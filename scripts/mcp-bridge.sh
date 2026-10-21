#!/usr/bin/env bash
# mcp-bridge.sh — SSE -> stdio bridge for MCP servers.
#
# Prefers a real supergateway binary (repo-local .tools, then ~/.local, then PATH)
# and falls back to `npx -y supergateway@<pin>` so a fresh clone works before
# setup has run. Pinning the version keeps MCP tool schemas — and therefore the
# prompt cache prefix — stable across sessions.
#
# Used by .mcp.json:
#   { "command": "./scripts/mcp-bridge.sh", "args": ["--sse", "<url>", ...] }
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PIN="supergateway@4.2.0"

for bin in \
  "$HERE/.tools/node_modules/.bin/supergateway" \
  "$HOME/.local/bin/supergateway" \
  "$(command -v supergateway 2>/dev/null || true)"; do
  if [ -n "$bin" ] && [ -x "$bin" ]; then
    exec "$bin" "$@"
  fi
done

exec npx -y "$PIN" "$@"
