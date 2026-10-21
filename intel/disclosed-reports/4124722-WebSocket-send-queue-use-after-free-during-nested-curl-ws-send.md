# WebSocket send queue use-after-free during nested curl_ws_send()

- **Report ID:** 4124722
- **URL:** https://hackerone.com/reports/4124722
- **Program:** curl
- **Reporter:** rat5ak
- **Severity:** Low
- **Bounty:** —
- **CWE:** Use After Free
- **CVEs:** —
- **Votes:** 2
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

At `lib/ws.c:1734`, `ws_flush()` borrows a pointer from the outgoing `sendbuf` and passes it to `ws_send_raw_blocking()`; it skips those bytes only after the send returns. A `curl_ws_send()` from the WebSocket write callback can be interrupted by a TCP-trace debug callback that calls `curl_ws_send()` again, and the nested flush frees the chunk the outer send is using. On `curl-8_23_0` with...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
