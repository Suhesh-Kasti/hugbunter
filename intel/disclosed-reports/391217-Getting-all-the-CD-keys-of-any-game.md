# Getting all the CD keys of any game

- **Report ID:** 391217
- **URL:** https://hackerone.com/reports/391217
- **Program:** valve
- **Reporter:** moskowsky
- **Severity:** Critical
- **Bounty:** 20000 USD
- **CWE:** Improper Access Control - Generic
- **CVEs:** —
- **Votes:** 638
- **Fetched:** 2026-10-21 16:52 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

Using the `/partnercdkeys/assignkeys/` endpoint on partner.steamgames.com with specific parameters, an authenticated user could download previously-generated CD keys for a game which they would not normally have access. Audit logs were not bypassed using this method, and an investigation of those audit logs did not show any prior or ongoing exploitation of this bug.

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
