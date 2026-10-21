# HTTP/1.1 connection reuse returns unsolicited server data as the next request's response (regression in 8.22.0)

- **Report ID:** 4098761
- **URL:** https://hackerone.com/reports/4098761
- **Program:** curl
- **Reporter:** 1rhino2
- **Severity:** Medium
- **Bounty:** —
- **CWE:** HTTP Request Smuggling
- **CVEs:** —
- **Votes:** 16
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

Since 8.22.0 libcurl reuses an idle HTTP/1.1 connection that already has unread bytes waiting on it, as long as the pool health check ran less than a second ago, and those bytes are then returned as the response to the next request sent on that connection, so every later response on it is shifted by one. The cause is lib/conncache.c Curl_cpool_conn_seems_healthy(), line 954 in curl-8_22_0:...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
