# Open redirect on app.hey.com bypasses HEY desktop's internal-origin allowlist and loads attacker content inside a HEY BrowserWindow

- **Report ID:** 3972760
- **URL:** https://hackerone.com/reports/3972760
- **Program:** basecamp
- **Reporter:** nasrysami
- **Severity:** Medium
- **Bounty:** —
- **CWE:** Open Redirect
- **CVEs:** —
- **Votes:** 29
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

## Summary

`app.hey.com/proxy_image` compares the URL scheme case-sensitively. `https://` gets signed and proxied correctly. `HTTPS://` isn't recognised, so instead of proxying it, the endpoint 302s the visitor to the raw URL. No authentication needed.

That alone is an open redirect. It matters because the HEY desktop app uses "is this URL on app.hey.com?" as its test for "is this HEY's own...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
