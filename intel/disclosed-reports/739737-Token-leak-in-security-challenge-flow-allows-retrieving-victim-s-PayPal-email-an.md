# Token leak in security challenge flow allows retrieving victim's PayPal email and plain text password

- **Report ID:** 739737
- **URL:** https://hackerone.com/reports/739737
- **Program:** paypal
- **Reporter:** alexbirsan
- **Severity:** High
- **Bounty:** 15300 USD
- **CWE:** Missing Authentication for Critical Function
- **CVEs:** —
- **Votes:** 1409
- **Fetched:** 2026-10-21 16:52 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

A bug was identified whereby sensitive, unique tokens were being leaked in a JS file used by the recaptcha implementation. In certain cases, a user must solve a CAPTCHA challenge after authenticating. When the security challenge is completed, the authentication request is replayed to log in. The exposed tokens were used in the POST request to solve the CAPTCHA.

The researcher identified a...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
