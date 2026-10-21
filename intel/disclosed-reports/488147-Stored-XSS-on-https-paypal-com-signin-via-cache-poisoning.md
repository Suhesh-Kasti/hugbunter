# Stored XSS on https://paypal.com/signin via cache poisoning

- **Report ID:** 488147
- **URL:** https://hackerone.com/reports/488147
- **Program:** paypal
- **Reporter:** albinowax
- **Severity:** High
- **Bounty:** 18900 USD
- **CWE:** HTTP Request Smuggling
- **CVEs:** —
- **Votes:** 685
- **Fetched:** 2026-10-21 16:52 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

Due to a configuration in frontend, caching servers, it was possible for a researcher to use request smuggling to convert a page request into a cached redirect. If the cached redirect were accessed by a legitimate user, an attacker's content would be rendered instead of the requested page. While this would not impact any back-end data, this could interfere with the integrity of certain pages,...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
