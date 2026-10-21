# Unauthenticated go-httpbin servers : Leads to Cookie Tossing on *.aws.dev and Open Redirect

- **Report ID:** 3966599
- **URL:** https://hackerone.com/reports/3966599
- **Program:** aws_vdp
- **Reporter:** notnotnotveg
- **Severity:** Medium
- **Bounty:** —
- **CWE:** Missing Authentication for Critical Function
- **CVEs:** —
- **Votes:** 29
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

**Description:** 
The unauthenticated go-httpbin instance exposes multiple endpoints that accept attacker-controlled input without appropriate validation.

Two issues were identified:
1. Cross-subdomain cookie tossing / cookie injection - `/cookies/set` allows an unauthenticated user to specify an arbitrary cookie `Domain`, including the parent `aws.dev` domain. This allows attacker-controlled...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
