#!/usr/bin/env bash
# fetch-disclosed-reports.sh
#
# Fetches the latest PUBLICLY DISCLOSED HackerOne reports and saves one Markdown
# file per report into ~/Study/BugHunt/intel/disclosed-reports/.
#
# How to run:
#   cd ~/Study/BugHunt
#   ./scripts/fetch-disclosed-reports.sh                 # latest 25 disclosed reports
#   ./scripts/fetch-disclosed-reports.sh --limit 100     # more reports
#   ./scripts/fetch-disclosed-reports.sh --sort votes    # most-upvoted instead of latest
#   ./scripts/fetch-disclosed-reports.sh --sort bounty   # highest bounty
#   H1_COOKIE='<your H1 session cookie>' ./scripts/fetch-disclosed-reports.sh
#       # optional: also fetch the full report body (requires a logged-in H1 account)
#
# Requirements:
#   - python3 (standard library only; no pip packages)
#   - outbound HTTPS to hackerone.com
#
# Notes:
#   - No credentials are needed for metadata + the public summary snippet.
#     HackerOne returns null for the full report body to anonymous clients, so
#     full write-ups require H1_COOKIE from your own account.
#   - Idempotent: reports already saved as <report-id>-*.md are skipped.
#   - Polite: ~0.4s between pages, ~0.5s between per-report summary fetches.
#
# Exit codes: 0 success, 1 fatal error, 2 missing dependency.

set -euo pipefail

OUTDIR="${OUTDIR:-$HOME/Study/BugHunt/intel/disclosed-reports}"
LIMIT=25
PAGES=5
SORT="latest"
SUMMARY=1

usage() {
  sed -n '2,30p' "$0" | sed 's/^# \{0,1\}//'
  exit 0
}

while [ $# -gt 0 ]; do
  case "$1" in
    --limit) LIMIT="${2:-}"; shift 2 ;;
    --pages) PAGES="${2:-}"; shift 2 ;;
    --sort)  SORT="${2:-}"; shift 2 ;;
    --no-summary) SUMMARY=0; shift ;;
    -h|--help) usage ;;
    *) echo "Unknown option: $1" >&2; usage ;;
  esac
done

case "$SORT" in latest|votes|bounty) ;; *) echo "Invalid --sort: $SORT (latest|votes|bounty)" >&2; exit 1 ;; esac
case "$LIMIT" in ''|*[!0-9]*) echo "--limit must be a positive integer" >&2; exit 1 ;; esac
case "$PAGES" in ''|*[!0-9]*) echo "--pages must be a positive integer" >&2; exit 1 ;; esac

command -v python3 >/dev/null 2>&1 || { echo "ERROR: python3 is required" >&2; exit 2; }
mkdir -p "$OUTDIR"

echo "[*] HackerOne disclosed reports -> $OUTDIR (sort=$SORT, limit=$LIMIT, pages=$PAGES)"

python3 - "$OUTDIR" "$LIMIT" "$PAGES" "$SORT" "$SUMMARY" <<'PY'
import glob
import html
import json
import os
import re
import sys
import time
import urllib.error
import urllib.request
from datetime import datetime, timezone

OUTDIR, LIMIT, PAGES, SORT, SUMMARY = sys.argv[1], int(sys.argv[2]), int(sys.argv[3]), sys.argv[4], sys.argv[5] == "1"
COOKIE = os.environ.get("H1_COOKIE", "")

GRAPHQL_URL = "https://hackerone.com/graphql"
SORT_FIELD = {"latest": "disclosed_at", "votes": "votes", "bounty": "total_awarded_amount"}[SORT]
UA = ("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 "
      "(KHTML, like Gecko) Chrome/120 Safari/537.36")
HEADERS = {
    "User-Agent": UA,
    "Content-Type": "application/json",
    "Origin": "https://hackerone.com",
    "Referer": "https://hackerone.com/hacktivity",
}
PAGE_SIZE = 50

REPORT_FIELDS = """... on HacktivityDocument {
  severity_rating total_awarded_amount currency cwe cve_ids votes
  team { handle name }
  reporter { username }
  report { _id title url }
}"""


def post(query, cookie=None):
    headers = dict(HEADERS)
    if cookie:
        headers["Cookie"] = cookie
    data = json.dumps({"query": query}).encode()
    req = urllib.request.Request(GRAPHQL_URL, data=data, headers=headers, method="POST")
    for attempt in range(4):
        try:
            with urllib.request.urlopen(req, timeout=25) as resp:
                return json.loads(resp.read().decode("utf-8", "replace"))
        except urllib.error.HTTPError as e:
            if e.code == 429 and attempt < 3:
                time.sleep(2 ** attempt)
                continue
            raise
    return {}


def page_query(after):
    after_str = f', after: "{after}"' if after else ""
    return (f'{{ search(index: CompleteHacktivityReportIndex, query: {{bool: {{}}}}, '
            f'first: {PAGE_SIZE}{after_str}, sort: {{field: "{SORT_FIELD}", direction: DESC}}) '
            f'{{ total_count pageInfo {{ endCursor }} nodes {{ {REPORT_FIELDS} }} }} }}')


def meta_summary(url):
    try:
        req = urllib.request.Request(url, headers={"User-Agent": UA})
        with urllib.request.urlopen(req, timeout=20) as resp:
            body = resp.read().decode("utf-8", "replace")
    except Exception:
        return ""
    m = re.search(r'<meta[^>]+(?:name|property)="(?:og:)?description"[^>]+content="([^"]*)"', body)
    return html.unescape(m.group(1)).strip() if m else ""


def full_body(report_id):
    if not COOKIE:
        return ""
    try:
        d = post(f'{{ report(id: {int(report_id)}) {{ vulnerability_information }} }}', cookie=COOKIE)
        return ((d.get("data") or {}).get("report") or {}).get("vulnerability_information") or ""
    except Exception:
        return ""


def as_list(value):
    if value is None:
        return []
    if isinstance(value, str):
        return [value]
    return list(value)


def slug(title, maxlen=80):
    s = re.sub(r"[^A-Za-z0-9]+", "-", title or "untitled").strip("-")
    return (s[:maxlen].rstrip("-") or "untitled")


def write_report(node):
    rep = node.get("report") or {}
    rid = str(rep.get("_id") or "")
    if not rid:
        return False
    # Idempotency: any existing file for this report id means we already have it.
    if glob.glob(os.path.join(OUTDIR, f"{rid}-*.md")):
        return False

    title = (rep.get("title") or "Untitled report").strip()
    url = rep.get("url") or f"https://hackerone.com/reports/{rid}"
    program = (node.get("team") or {}).get("handle") or "unknown"
    reporter = (node.get("reporter") or {}).get("username") or "unknown"
    cwe = ", ".join(as_list(node.get("cwe"))) or "—"
    cves = ", ".join(as_list(node.get("cve_ids"))) or "—"
    bounty = node.get("total_awarded_amount")
    currency = node.get("currency") or ""
    bounty_s = f"{bounty} {currency}".strip() if bounty is not None else "—"
    summary = meta_summary(url) if SUMMARY else ""

    body = full_body(rid)
    if SUMMARY:
        time.sleep(0.5)

    lines = [
        f"# {title}",
        "",
        f"- **Report ID:** {rid}",
        f"- **URL:** {url}",
        f"- **Program:** {program}",
        f"- **Reporter:** {reporter}",
        f"- **Severity:** {node.get('severity_rating') or '—'}",
        f"- **Bounty:** {bounty_s}",
        f"- **CWE:** {cwe}",
        f"- **CVEs:** {cves}",
        f"- **Votes:** {node.get('votes') if node.get('votes') is not None else '—'}",
        f"- **Fetched:** {datetime.now(timezone.utc).strftime('%Y-%m-%d %H:%M UTC')}",
        f"- **Source:** HackerOne public hacktivity (GraphQL)",
        "",
        "## Summary",
        "",
        summary if summary else "_No public summary snippet available._",
        "",
    ]
    if body:
        lines += ["## Report Body (authenticated fetch)", "", body, ""]
    else:
        lines += [
            "## Report Body",
            "",
            "_Not fetched: HackerOne returns the full write-up only to authenticated clients._",
            "_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._",
            "",
        ]
    lines += [
        "## Learning Notes",
        "",
        "- **Bug class:**",
        "- **Root cause:**",
        "- **What made it exploitable:**",
        "- **How I would confirm/refute it on a target:**",
        "- **What the agent got right / wrong:**",
        "",
    ]

    path = os.path.join(OUTDIR, f"{rid}-{slug(title)}.md")
    with open(path, "w", encoding="utf-8") as fh:
        fh.write("\n".join(lines))
    print(f"  + {os.path.basename(path)}", file=sys.stderr)
    return True


def main():
    written = skipped = seen = 0
    after = None
    for page in range(1, PAGES + 1):
        if written >= LIMIT:
            break
        try:
            data = post(page_query(after))
        except Exception as e:
            print(f"[!] GraphQL request failed on page {page}: {e}", file=sys.stderr)
            if page == 1:
                print("NOT IMPLEMENTED: could not reach HackerOne GraphQL.", file=sys.stderr)
                return 1
            break

        if data.get("errors"):
            print(f"[!] GraphQL errors on page {page}: {data['errors'][:2]}", file=sys.stderr)
            if page == 1:
                print("NOT IMPLEMENTED: public hacktivity query was rejected.", file=sys.stderr)
                return 1
            break

        search = (data.get("data") or {}).get("search") or {}
        nodes = search.get("nodes") or []
        for node in nodes:
            if written >= LIMIT:
                break
            if not node.get("report"):
                continue
            seen += 1
            try:
                if write_report(node):
                    written += 1
                else:
                    skipped += 1
            except Exception as e:
                print(f"[!] failed to write report: {e}", file=sys.stderr)

        after = (search.get("pageInfo") or {}).get("endCursor")
        if not after or not nodes:
            break
        time.sleep(0.4)

    print(f"[+] done: {written} new, {skipped} already present, {seen} disclosed reports scanned", file=sys.stderr)
    return 0


sys.exit(main())
PY
