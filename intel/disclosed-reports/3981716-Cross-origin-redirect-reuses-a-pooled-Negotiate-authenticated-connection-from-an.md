# Cross-origin redirect reuses a pooled Negotiate-authenticated connection from an unrelated transfer

- **Report ID:** 3981716
- **URL:** https://hackerone.com/reports/3981716
- **Program:** curl
- **Reporter:** silentsobs_
- **Severity:** Medium
- **Bounty:** —
- **CWE:** —
- **CVEs:** CVE-2026-1965
- **Votes:** 3
- **Fetched:** 2026-10-21 16:54 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

AI Disclosure: AI tools were used to assist with code analysis and drafting this report. All findings were independently investigated, verified against the source, and reproduced manually by me before submission.

## Summary

curl withholds a fresh `Authorization` header when a redirect crosses origins. That protection doesn't extend to connection reuse. If an application shares a connection...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
