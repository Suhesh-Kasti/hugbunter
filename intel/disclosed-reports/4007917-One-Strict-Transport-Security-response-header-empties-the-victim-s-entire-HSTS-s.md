# One Strict-Transport-Security response header empties the victim's entire HSTS store, silently,

- **Report ID:** 4007917
- **URL:** https://hackerone.com/reports/4007917
- **Program:** curl
- **Reporter:** xshubhamraj
- **Severity:** Medium
- **Bounty:** —
- **CWE:** Cleartext Transmission of Sensitive Information
- **CVEs:** CVE-2023-46219, CVE-2023-23915, CVE-2023-23914, CVE-2024-9681
- **Votes:** 5
- **Fetched:** 2026-10-21 16:54 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

## Summary
One `Strict-Transport-Security` response header, from any HTTPS server the victim contacts, leaves
the victim's on-disk HSTS store at **zero bytes**. Every host in it loses HSTS protection, including
hosts unrelated to the server that sent the header. curl exits 0 and prints nothing.

Two behaviours combine, each harmless alone. `Curl_fopen()` truncates the real store before it...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
