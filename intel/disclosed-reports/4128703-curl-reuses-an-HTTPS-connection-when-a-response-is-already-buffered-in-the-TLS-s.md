# curl reuses an HTTPS connection when a response is already buffered in the TLS stack

- **Report ID:** 4128703
- **URL:** https://hackerone.com/reports/4128703
- **Program:** curl
- **Reporter:** shafran99
- **Severity:** Medium
- **Bounty:** —
- **CWE:** Acceptance of Extraneous Untrusted Data With Trusted Data
- **CVEs:** —
- **Votes:** 0
- **Fetched:** 2026-10-20 23:12 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

curl master (`15292ed75`, `8.23.1-DEV`) reuses an idle HTTP/1.1-over-TLS
connection even when a complete extra response is already buffered in
OpenSSL/GnuTLS. The `ef6b17cf1` fix only polls the socket:
`Curl_cpool_conn_seems_healthy()` (`lib/conncache.c:1073`, called from
`lib/url.c:1071`) uses `Curl_conn_is_alive()`, and `cf_ssl_is_alive()`
(`lib/vtls/vtls.c:1287`) delegates to...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
