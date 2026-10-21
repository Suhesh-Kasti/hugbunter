# Uncaught RecursionError crash in translation-finder (deep directory tree DoS)

- **Report ID:** 4022462
- **URL:** https://hackerone.com/reports/4022462
- **Program:** weblate
- **Reporter:** sumit-sabhaya
- **Severity:** Low
- **Bounty:** —
- **CWE:** Uncontrolled Resource Consumption
- **CVEs:** —
- **Votes:** 15
- **Fetched:** 2026-10-21 16:54 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

**Type:** Denial of Service (Availability)
**Severity:** Low-Medium (CVSS 3.7-5.5 depending on access)
**Affected:** WeblateOrg/translation-finder v3.4.1, commit f5f8bb5 (current main)

## TL;DR

`translation-finder` scans repository content using recursion without any depth limit. A repository with ~1000 nested folders causes an uncaught `RecursionError` that crashes the entire discovery call....

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
