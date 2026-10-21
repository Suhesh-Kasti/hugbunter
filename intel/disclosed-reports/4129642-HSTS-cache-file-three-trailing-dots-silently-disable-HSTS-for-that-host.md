# HSTS cache file: three trailing dots silently disable HSTS for that host

- **Report ID:** 4129642
- **URL:** https://hackerone.com/reports/4129642
- **Program:** curl
- **Reporter:** jashu19
- **Severity:** Medium
- **Bounty:** —
- **CWE:** Improper Certificate Validation
- **CVEs:** CVE-2026-8924, CVE-2023-46219
- **Votes:** 1
- **Fetched:** 2026-10-20 23:12 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

**Researcher:** Maturi Jaswanth Sai
**Program:** curl (HackerOne)
**Asset:** github.com/curl/curl, `lib/hsts.c`
**Affected:** curl 8.20.0, 8.21.0, 8.22.0 and 8.23.0 (tag `curl-8_23_0`,
2026-10-14), plus master `eb2b201a` (8.23.1-DEV, 2026-10-19)
**Weakness:** CWE-295 / CWE-693, an HSTS pin that silently stops applying

Before we went into report to be clear I have created separate file for...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
