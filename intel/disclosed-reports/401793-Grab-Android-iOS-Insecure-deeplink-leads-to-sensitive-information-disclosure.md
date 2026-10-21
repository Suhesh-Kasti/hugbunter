# [Grab Android/iOS] Insecure deeplink leads to sensitive information disclosure

- **Report ID:** 401793
- **URL:** https://hackerone.com/reports/401793
- **Program:** grab
- **Reporter:** bagipro
- **Severity:** High
- **Bounty:** —
- **CWE:** Cross-site Scripting (XSS) - Generic
- **CVEs:** —
- **Votes:** 551
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

A deeplink feature was found missing validation that led to sensitive information disclosure. Once triggered, the deeplink would direct users to load any attacker-controlled URL within a webview. The impact was further escalated as the webview contain sensitive information. A temporary patch was distributed shortly after the submission was verified and a permanent patch was released and...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
