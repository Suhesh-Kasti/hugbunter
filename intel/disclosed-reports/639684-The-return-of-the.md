# The return of the ＜

- **Report ID:** 639684
- **URL:** https://hackerone.com/reports/639684
- **Program:** rockstargames
- **Reporter:** alexbirsan
- **Severity:** High
- **Bounty:** 1000 USD
- **CWE:** Cross-site Scripting (XSS) - Stored
- **CVEs:** —
- **Votes:** 574
- **Fetched:** 2026-10-21 16:52 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

In this report, the researcher was able to demonstrate a Stored XSS vulnerability in our Message system on the Social Club website. By taking advantage of the fact that '＜' characters are normalized to '<', as well as discovering improper escaping of the aforementioned '<' character, the researcher was able to craft a payload to perform XSS attacks. 

An example...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
