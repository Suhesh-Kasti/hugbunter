# Server Side Request Forgery (SSRF) via Analytics Reports

- **Report ID:** 2262382
- **URL:** https://hackerone.com/reports/2262382
- **Program:** security
- **Reporter:** megaman_
- **Severity:** Critical
- **Bounty:** 25000 USD
- **CWE:** Server-Side Request Forgery (SSRF)
- **CVEs:** —
- **Votes:** 529
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

We recently received a critical server-side request forgery (SSRF) vulnerability report through our bug bounty program. The issue allowed attackers to make internal requests from our application servers by exploiting a lack of output sanitization in an error message. By crafting malicious requests, an attacker could have accessed internal AWS services and obtained temporary credentials. 

Upon...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
