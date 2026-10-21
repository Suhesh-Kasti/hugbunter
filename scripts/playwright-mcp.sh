#!/usr/bin/env bash
# playwright-mcp.sh — launch the repo-local Playwright MCP server over stdio.
# Referenced from .mcp.json. Run scripts/setup.sh first to create the venv.
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJ="$HERE/mcp/playwright"

if [ ! -x "$PROJ/.venv/bin/python" ]; then
  echo "playwright MCP is not set up yet — run: ./scripts/setup.sh" >&2
  exit 1
fi

exec "$PROJ/.venv/bin/python" "$PROJ/server.py"
