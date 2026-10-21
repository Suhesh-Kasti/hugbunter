# Ordinary HEY user can make HEY originate authenticated mail from attacker-selected @hey.com  addresses

- **Report ID:** 4035023
- **URL:** https://hackerone.com/reports/4035023
- **Program:** basecamp
- **Reporter:** gachikuku
- **Severity:** High
- **Bounty:** —
- **CWE:** Improper Access Control - Generic
- **CVEs:** —
- **Votes:** 14
- **Fetched:** 2026-10-20 23:12 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

## Summary

  An ordinary HEY user can add an attacker-selected `@hey.com` identity as an external sender using
  unrelated, attacker-controlled SMTP credentials.

  If the temporary external-account object is deleted immediately after enqueue, HEY delivers the
  queued message through its first-party infrastructure while retaining the claimed identity.

  With Basecamp security/triage...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
