# RCE via npm misconfig -- installing internal libraries from the public registry

- **Report ID:** 925585
- **URL:** https://hackerone.com/reports/925585
- **Program:** paypal
- **Reporter:** alexbirsan
- **Severity:** Critical
- **Bounty:** 30000 USD
- **CWE:** Code Injection
- **CVEs:** —
- **Votes:** 945
- **Fetched:** 2026-10-21 16:52 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

A Bug Bounty researcher identified an issue where certain development projects defaulted to the public NPM registry, instead of using the intended internal packages. Since the packages on the public registry did not exist, the researcher created these and observed they were downloaded. Had these packages been registered with malicious intent, it is possible for internal development to have...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
