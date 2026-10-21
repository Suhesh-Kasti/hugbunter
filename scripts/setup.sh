#!/usr/bin/env bash
# setup.sh — one-time, per-machine setup for the BugHunt workspace.
#
#   1. supergateway (SSE -> stdio bridge used by .mcp.json)
#   2. uv venv for the Playwright MCP server + Chromium download
#   3. import check
#
# After this, run ./scripts/doctor.sh to verify the whole wiring.
# Nothing here touches a target; no traffic leaves localhost.

set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "[1/3] supergateway (MCP SSE->stdio bridge)"
if command -v supergateway >/dev/null 2>&1; then
  echo "  already on PATH: $(command -v supergateway) ($(supergateway --version 2>/dev/null || echo '?'))"
elif [ -x "$HOME/.local/bin/supergateway" ]; then
  echo "  found at ~/.local/bin/supergateway ($("$HOME/.local/bin/supergateway" --version 2>/dev/null || echo '?'))"
else
  echo "  installing to ~/.local (no sudo needed)..."
  npm i -g --prefix "$HOME/.local" supergateway@4.2.0
fi

echo "[2/3] Playwright MCP venv (uv)"
if ! command -v uv >/dev/null 2>&1; then
  echo "  ERROR: uv is required — https://docs.astral.sh/uv/getting-started/installation/" >&2
  exit 1
fi
cd "$HERE/mcp/playwright"
uv sync
uv run playwright install chromium

echo "[3/3] import check"
"$HERE/mcp/playwright/.venv/bin/python" - <<'PY'
import mcp
import playwright
print("  mcp + playwright import OK")
PY

echo
echo "Done. If Chromium fails to launch at runtime, install system libraries once:"
echo "  sudo \"$HERE/mcp/playwright/.venv/bin/playwright\" install-deps chromium"
echo "Then verify everything: ./scripts/doctor.sh"
