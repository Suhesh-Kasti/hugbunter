# CRLF injection in the HTTP request-line via `CURLOPT_REQUEST_TARGET` (`--request-target`)

- **Report ID:** 4121689
- **URL:** https://hackerone.com/reports/4121689
- **Program:** curl
- **Reporter:** noraqiu
- **Severity:** High
- **Bounty:** —
- **CWE:** CRLF Injection
- **CVEs:** —
- **Votes:** 6
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

## Summary

The `CURLOPT_REQUEST_TARGET` option string reaches the wire with no CR/LF neutralization, even though it is formatted directly into the HTTP request-line, which is terminated by CRLF. `Curl_setstropt()` (`lib/setopt.c`) stores the option string after checking only the 8 MB length cap (`CURL_MAX_INPUT_LENGTH`) — it never inspects for `\r` or `\n` — and the request-line construction...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
