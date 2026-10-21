# Improper Authentication - any user can login as other user with otp/logout & otp/login

- **Report ID:** 921780
- **URL:** https://hackerone.com/reports/921780
- **Program:** snapchat
- **Reporter:** korniltsev
- **Severity:** Critical
- **Bounty:** —
- **CWE:** Improper Authentication - Generic
- **CVEs:** —
- **Votes:** 971
- **Fetched:** 2026-10-21 16:52 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

This vulnerability was discovered on the One Tap Password (OTP) login/logout flow. If exploited, the attacker could log in to any account for which they had the user_id. This id is exposed in several places and should not have been trusted in the request by the logout endpoint.

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
