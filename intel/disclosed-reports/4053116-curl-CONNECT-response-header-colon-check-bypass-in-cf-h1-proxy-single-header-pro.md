# curl CONNECT response header colon-check bypass in cf-h1-proxy single_header — proxy authentication bypass via injected HTTP/1.x status line

- **Report ID:** 4053116
- **URL:** https://hackerone.com/reports/4053116
- **Program:** curl
- **Reporter:** noraqiu
- **Severity:** High
- **Bounty:** —
- **CWE:** Improper Authentication - Generic
- **CVEs:** —
- **Votes:** 8
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

## Summary

In the HTTP/1.1 proxy-CONNECT response parser (`lib/cf-h1-proxy.c`, `single_header()`), the per-line counter `data->req.headerline` (a.k.a. `k->headerline`) is never incremented — only the tunnel-local `ts->headerlines` is. `Curl_req_soft_reset()` resets `k->headerline` to 0 before the CONNECT exchange begins, and it stays 0 for the entire CONNECT response. `Curl_verify_header()`...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
