# CURLOPT_PROXYHEADER is not part of the HTTP-proxy connection reuse key: a second CONNECT-tunnel transfer silently reuses the first tunnel's Proxy-Auth

- **Report ID:** 4124549
- **URL:** https://hackerone.com/reports/4124549
- **Program:** curl
- **Reporter:** joumaaa
- **Severity:** Medium
- **Bounty:** —
- **CWE:** Improper Authentication - Generic
- **CVEs:** CVE-2026-3784
- **Votes:** 5
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

## Summary

When libcurl tunnels through an HTTP proxy with `CONNECT` (HTTPS-over-proxy), the custom headers
set via `CURLOPT_PROXYHEADER` are sent to the proxy **once, at tunnel-setup time**
(`lib/http_proxy.c:63-83`). The connection-reuse decision for a proxied connection, however, does
**not** take `proxyheaders` into account. `proxy_info_matches()` compares only the proxy type, the
proxy...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
