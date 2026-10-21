# Burp Suite OpenAPI Event Log HTML injection triggers Windows SMB authentication

- **Report ID:** 3972558
- **URL:** https://hackerone.com/reports/3972558
- **Program:** portswigger
- **Reporter:** gankd
- **Severity:** Medium
- **Bounty:** 1000 USD
- **CWE:** —
- **CVEs:** CVE-2021-29416
- **Votes:** 54
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

### Summary

Burp Suite 2026.8 build 53343 inserts attacker-controlled text from an OpenAPI parser exception into the Event log HTML without encoding it. After the user invokes **Response → Save OpenAPI requests to site map** and selects the resulting Event log row, Swing's `HTMLEditorKit` interprets an injected `<img>` tag. On Windows, a UNC-backed `file:` URL causes the Burp process to...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
