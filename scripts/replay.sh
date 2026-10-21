#!/usr/bin/env bash
# replay.sh — send one request through the rate limiter and record the evidence.
#
# This is the preferred way to send a replay: it enforces the 5 req/s rule and
# writes the raw request/response pair in the same shape as the evidence
# template, so nothing has to be copied by hand.
#
# Usage:
#   scripts/replay.sh <target> <name> <METHOD> <URL> [options]
#
# Example:
#   scripts/replay.sh acme idor-order GET 'https://app.example/api/orders/1002' \
#     -H 'Authorization: Bearer ...' -H 'Accept: application/json'
#
# Options:
#   -H, --header 'K: V'   extra request header (repeatable)
#   -d, --data 'body'     request body
#   -k, --insecure        skip TLS verification
#   --rate N              requests/second for this send (default $RATE_LIMIT or 5)
#
# Writes: targets/<target>/evidence/replay-<NN>-<name>.http.md
# The request and response headers are taken verbatim from curl's own trace, so
# what lands in the file is what went over the wire.

set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

usage() {
  sed -n '2,25p' "$0" | sed 's/^# \{0,1\}//'
  exit 1
}

[ $# -ge 4 ] || usage

target="$1"; name="$2"; method="$3"; url="$4"; shift 4

headers=(); data_present=0; data=""; insecure=0; rate_args=()
while [ $# -gt 0 ]; do
  case "$1" in
    -H|--header) headers+=("$2"); shift 2 ;;
    -d|--data|--data-raw) data="$2"; data_present=1; shift 2 ;;
    -k|--insecure) insecure=1; shift ;;
    --rate) rate_args=(--rate "$2"); shift 2 ;;
    *) echo "replay: unknown option '$1'" >&2; usage ;;
  esac
done

case "$target" in */*|.*|"") echo "replay: bad target name '$target'" >&2; exit 1 ;; esac
case "$name" in */*|.*|"") echo "replay: bad name '$name'" >&2; exit 1 ;; esac

dir="$HERE/targets/$target"
[ -d "$dir" ] || { echo "replay: no such target 'targets/$target' (run scripts/new-target.sh $target)" >&2; exit 1; }
mkdir -p "$dir/evidence"

next=$(( $(find "$dir/evidence" -maxdepth 1 -name 'replay-*.http.md' 2>/dev/null | wc -l) + 1 ))
seq=$(printf '%02d' "$next")
out="$dir/evidence/replay-$seq-$name.http.md"

UA="bughunt-replay/1.0"
trace=$(mktemp); body=$(mktemp)
trap 'rm -f "$trace" "$body"' EXIT

# Enforce the shared limit immediately before the request leaves.
"$HERE/scripts/rate-limit.sh" "${rate_args[@]+"${rate_args[@]}"}" acquire 1

curl_args=(-sS -v -o "$body" -X "$method" -H "User-Agent: $UA")
for h in "${headers[@]+"${headers[@]}"}"; do curl_args+=(-H "$h"); done
[ "$data_present" = 1 ] && curl_args+=(--data-raw "$data")
[ "$insecure" = 1 ] && curl_args+=(--insecure)

curl "${curl_args[@]}" "$url" 2>"$trace" || true

req_block=$(grep -E '^> ' "$trace" | sed 's/^> //' || true)
res_block=$(grep -E '^< ' "$trace" | sed 's/^< //' || true)

{
  echo "# Replay $seq — $name"
  echo
  echo "- **Target:** $target"
  echo "- **Sent:** $(date -u +'%Y-%m-%d %H:%M:%S UTC')"
  echo "- **URL:** $url"
  echo "- **Method:** $method"
  echo
  echo "## Request"
  echo
  echo '```http'
  echo "${req_block:-<no request line captured>}"
  echo '```'
  echo
  echo "## Response"
  echo
  echo '```http'
  echo "${res_block:-<no response headers captured>}"
  echo
  cat "$body"
  echo '```'
  echo
  echo "## Verdict"
  echo
  echo "- **Status:** NEEDS MORE EVIDENCE"
  echo "- **Gate questions answered:**"
  echo "- **Redactions to make before committing:**"
} > "$out"

echo "$out"
