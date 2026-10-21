# libcurl TLS shorter-retry mismatch discloses client heap memory during cancelled IMAPS upload

- **Report ID:** 4105853
- **URL:** https://hackerone.com/reports/4105853
- **Program:** curl
- **Reporter:** giant_anteater
- **Severity:** Medium
- **Bounty:** —
- **CWE:** Out-of-bounds Read
- **CVEs:** —
- **Votes:** 2
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

## Proof of Concept

High-level reproduction:

1. Check out curl 8.22.0 at commit
   `01346829096c61b372692f6dc43ffa778c6caccd`.
2. Build libcurl with either:
   - rustls-ffi 0.15.4 / rustls 0.23.45; or
   - GnuTLS 3.8.13.
3. Run the supplied loopback IMAPS server and multi-interface client.
4. The client starts a large `APPEND` upload using a deliberately small socket
   send buffer.
5. The...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
