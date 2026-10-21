# Shopify Stocky App OAuth Misconfiguration

- **Report ID:** 740989
- **URL:** https://hackerone.com/reports/740989
- **Program:** shopify
- **Reporter:** vulnh0lic
- **Severity:** Medium
- **Bounty:** —
- **CWE:** Privilege Escalation
- **CVEs:** —
- **Votes:** 527
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

@vulnh0lic noticed that a staff member without Apps permission was able to access the Stocky app. We determined that this was because of a bug in Stocky's OAuth authentication code, which allowed the user to be granted access to Stocky at the start of the OAuth process rather than the end. This resulted in a full authentication bypass. Within an hour of validating the report, we deployed a fix...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
