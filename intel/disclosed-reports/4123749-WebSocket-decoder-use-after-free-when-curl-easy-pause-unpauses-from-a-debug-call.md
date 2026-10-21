# WebSocket decoder use-after-free when curl_easy_pause() unpauses from a debug callback

- **Report ID:** 4123749
- **URL:** https://hackerone.com/reports/4123749
- **Program:** curl
- **Reporter:** rat5ak
- **Severity:** None
- **Bounty:** —
- **CWE:** Use After Free
- **CVEs:** —
- **Votes:** 8
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

### Summary

At `lib/ws.c:503`, `ws_dec_pass_payload()` holds a pointer into the WebSocket receive queue while passing a frame to the application's write callback. If that callback returns `CURL_WRITEFUNC_PAUSE`, the `PAUSE requested` trace invokes the debug callback before the WebSocket pass consumes those bytes (`CURLOPT_VERBOSE=1` and `curl_global_trace("write")` enabled). Calling...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
