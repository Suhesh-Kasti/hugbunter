# Able to Become Admin for Any LINE Official Account

- **Report ID:** 698579
- **URL:** https://hackerone.com/reports/698579
- **Program:** line
- **Reporter:** ngalog
- **Severity:** Critical
- **Bounty:** —
- **CWE:** Privilege Escalation
- **CVEs:** —
- **Votes:** 493
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

The reporter found an issue where abusing an IDOR would allow for an attacker to become an administrator of any LINE Official Account. This was due to an issue where the group ID could be extracted and/or easily guessed, combined with lack of authentication, leading to being able to craft a request that resulted in being given administration rights to that LINE Official Account.

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
