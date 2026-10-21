# SSRF in Exchange leads to ROOT access in all instances

- **Report ID:** 341876
- **URL:** https://hackerone.com/reports/341876
- **Program:** shopify
- **Reporter:** 0xacb
- **Severity:** Medium
- **Bounty:** —
- **CWE:** Server-Side Request Forgery (SSRF)
- **CVEs:** —
- **Votes:** 585
- **Fetched:** 2026-10-21 16:52 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

Shopify infrastructure is isolated into subsets of infrastructure. @0xacb reported it was possible to gain root access to any container in one particular subset by exploiting a server side request forgery bug in the screenshotting functionality of Shopify Exchange. Within an hour of receiving the report, we disabled the vulnerable service, began auditing applications in all subsets and...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
