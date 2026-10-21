# TLS session cache ignores CURLOPT_SSL_CTX_FUNCTION identity and resumes one client's session for another

- **Report ID:** 4129638
- **URL:** https://hackerone.com/reports/4129638
- **Program:** curl
- **Reporter:** jashu19
- **Severity:** Medium
- **Bounty:** —
- **CWE:** Improper Certificate Validation
- **CVEs:** CVE-2016-5419, CVE-2017-7468
- **Votes:** 1
- **Fetched:** 2026-10-20 23:12 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

**Researcher:** Maturi Jaswanth Sai
**Program:** curl (HackerOne)
**Asset:** github.com/curl/curl, `lib/vtls/vtls_scache.c`
**Affected:** curl 8.21.0, 8.22.0 and 8.23.0 (tag `curl-8_23_0`,
2026-10-14), plus master `eb2b201a` (8.23.1-DEV, 2026-10-19)
**Weakness:** CWE-295, wrong client identity on a resumed TLS session. Same
class as CVE-2016-5419 and CVE-2017-7468

Before we went into report to...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
