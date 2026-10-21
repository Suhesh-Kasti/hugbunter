#!/usr/bin/env bash
# doctor.sh — verify the BugHunt workspace wiring end to end.
#
# Read-only: it talks to local services only and never sends traffic to a target.
# Usage:
#   cd ~/Study/BugHunt && ./scripts/doctor.sh
#
# Exit code: 0 if every check passes, 1 if any check fails.

set -uo pipefail
cd "$(dirname "$0")/.." || exit 1

PASS=0
FAIL=0
ok()  { printf '  [PASS] %s\n' "$1"; PASS=$((PASS + 1)); }
bad() { printf '  [FAIL] %s\n' "$1"; FAIL=$((FAIL + 1)); }
hdr() { printf '\n== %s ==\n' "$1"; }

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

hdr "Arson Framework API (:3001)"
hcode=$(curl -s -o "$tmp/health" -w '%{http_code}' -m 5 http://localhost:3001/health || echo 000)
if [ "$hcode" = "200" ]; then
  ok "health 200: $(cat "$tmp/health")"
else
  bad "health returned $hcode (is the ars0n docker stack up?)"
fi

hdr "Burp MCP (:9876, SSE)"
bcode=$(curl -s -o /dev/null -D "$tmp/burp.headers" -w '%{http_code}' -m 4 http://127.0.0.1:9876/ || true)
if grep -qi 'text/event-stream' "$tmp/burp.headers" 2>/dev/null; then
  ok "SSE stream at / (HTTP $bcode, content-type: text/event-stream)"
else
  bad "no text/event-stream from http://127.0.0.1:9876/ (is Burp MCP enabled?)"
fi

hdr "SearXNG (:5343)"
scode=$(curl -s -o "$tmp/sx.json" -w '%{http_code}' -m 20 'http://localhost:5343/search?q=test&format=json' || echo 000)
if [ "$scode" = "200" ] && command -v python3 >/dev/null 2>&1; then
  if python3 -c "import json,sys;d=json.load(open('$tmp/sx.json'));sys.exit(0 if 'results' in d else 1)" 2>/dev/null; then
    ok "format=json 200 and parses (json output enabled)"
  else
    bad "format=json returned $scode but the body did not parse"
  fi
else
  bad "format=json returned $scode (enable json in searxng settings.yml?)"
fi

hdr "MCP configuration"
if [ -f .mcp.json ]; then ok ".mcp.json present"; else bad ".mcp.json missing"; fi
for srv in arson-framework burp playwright; do
  if cmd mcp list 2>/dev/null | grep -q "$srv"; then ok "$srv registered"; else bad "$srv not registered"; fi
done

hdr "MCP bridge + browsers"
if command -v supergateway >/dev/null 2>&1; then
  ok "supergateway on PATH ($(command -v supergateway))"
elif [ -x "$HOME/.local/bin/supergateway" ]; then
  ok "supergateway at ~/.local/bin (used by scripts/mcp-bridge.sh)"
else
  bad "supergateway not found (scripts/mcp-bridge.sh will fall back to npx)"
fi
if [ -x mcp/playwright/.venv/bin/python ]; then ok "playwright venv present"; else bad "mcp/playwright/.venv missing (run ./scripts/setup.sh)"; fi
if [ -d "$HOME/.cache/ms-playwright" ]; then ok "chromium browser cache present"; else bad "no ~/.cache/ms-playwright (run ./scripts/setup.sh)"; fi

hdr "MCP tool surfaces (.mcp.json)"
if command -v python3 >/dev/null 2>&1 && [ -f .mcp.json ]; then
  python3 - "$tmp" <<'PY'
import json, subprocess, sys, threading, queue, time
tmp = sys.argv[1]
cfg = json.load(open(".mcp.json"))["mcpServers"]

def probe(spec):
    q = queue.Queue()
    p = subprocess.Popen([spec["command"]] + spec.get("args", []), stdin=subprocess.PIPE,
                         stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, text=True, bufsize=1)
    threading.Thread(target=lambda: [q.put(l.strip()) for l in p.stdout if l.strip()], daemon=True).start()
    def send(o): p.stdin.write(json.dumps(o) + "\n"); p.stdin.flush()
    def wait(i, t=90):
        end = time.time() + t
        while time.time() < end:
            try: m = json.loads(q.get(timeout=end - time.time()))
            except queue.Empty: break
            if m.get("id") == i: return m
        return None
    try:
        send({"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2024-11-05","capabilities":{},"clientInfo":{"name":"doctor","version":"1"}}})
        wait(1)
        send({"jsonrpc":"2.0","method":"notifications/initialized"})
        send({"jsonrpc":"2.0","id":2,"method":"tools/list","params":{}})
        r = wait(2)
        return r["result"]["tools"] if r else None
    finally:
        p.terminate()

with open(f"{tmp}/mcp.txt", "w") as fh:
    for name, spec in cfg.items():
        tools = probe(spec)
        fh.write(f"{name} {len(tools) if tools else -1}\n")
PY
  while read -r name count; do
    if [ "$count" -gt 0 ] 2>/dev/null; then ok "$name exposes $count tools"; else bad "$name exposed no tools"; fi
  done < "$tmp/mcp.txt"
else
  bad "python3 or .mcp.json unavailable; skipped MCP probe"
fi

hdr "Agents"
for a in recon-agent triage-agent report-agent; do
  if [ -f ".commandcode/agents/$a.md" ]; then
    if grep -qE '^model:\s*deepseek/' ".commandcode/agents/$a.md"; then ok "$a present (deepseek model pinned)"; else bad "$a present but model not pinned to deepseek"; fi
  else
    bad "$a missing"
  fi
done

hdr "Skills"
installed=$(cmd skills list 2>/dev/null | grep -oE '[0-9]+ installed' | grep -oE '[0-9]+' || echo 0)
ok "$installed skills installed"
issues=$(cmd skills list --debug 2>/dev/null | grep -icE '^\s*(Skipped|Duplicate)' || true)
if [ "$issues" = "0" ]; then ok "no skipped or duplicate skills"; else bad "$issues skill issue group(s) reported"; fi
disabled=$(python3 -c "import json;print(len(json.load(open('.commandcode/settings.json'))['disabledSkills']))" 2>/dev/null || echo 0)
ok "$disabled skills disabled in .commandcode/settings.json"

hdr "Target template"
if [ -f targets/_template/NOTES.md ]; then ok "targets/_template/NOTES.md present"; else bad "target template missing"; fi

printf '\n============================================\n'
printf ' RESULT: %d passed, %d failed\n' "$PASS" "$FAIL"
printf '============================================\n'
[ "$FAIL" -eq 0 ]
