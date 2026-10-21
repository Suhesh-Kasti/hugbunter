# Sensitive user information disclosure at bonjour.uber.com/marketplace/_rpc via the 'userUuid' parameter

- **Report ID:** 542340
- **URL:** https://hackerone.com/reports/542340
- **Program:** uber
- **Reporter:** anandpingsafe
- **Severity:** High
- **Bounty:** —
- **CWE:** Information Disclosure
- **CVEs:** —
- **Votes:** 643
- **Fetched:** 2026-10-21 16:52 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

It was possible for an attacker to insert another user’s UUID into the userUuid POST parameter when making a request to https://bonjour.uber.com/marketplace/_rpc?rpc=getConsentScreenDetails, allowing them to retrieve personal data from the victim user’s account, as well as the user's mobile auth token, which could allow them to make requests to mobile APIs as the victim.

Thanks again,...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
