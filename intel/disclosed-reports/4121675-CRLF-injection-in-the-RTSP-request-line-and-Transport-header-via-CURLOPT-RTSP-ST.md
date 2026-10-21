# CRLF injection in the RTSP request-line and Transport header via `CURLOPT_RTSP_STREAM_URI` and `CURLOPT_RTSP_TRANSPORT`

- **Report ID:** 4121675
- **URL:** https://hackerone.com/reports/4121675
- **Program:** curl
- **Reporter:** noraqiu
- **Severity:** High
- **Bounty:** —
- **CWE:** CRLF Injection
- **CVEs:** —
- **Votes:** 5
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

## Summary

Two RTSP option strings reach the wire with no CR/LF neutralization, even though each is formatted directly into an RTSP request-line or header field that is terminated by CRLF. `Curl_setstropt()` (`lib/setopt.c`) stores each option string after checking only the 8 MB length cap (`CURL_MAX_INPUT_LENGTH`) — it never inspects for `\r` or `\n` — and both construction sites inside...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
