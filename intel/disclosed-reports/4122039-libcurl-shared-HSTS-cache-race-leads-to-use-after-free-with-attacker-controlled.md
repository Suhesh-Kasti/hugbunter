# libcurl shared-HSTS-cache race leads to use-after-free with attacker-controlled function-pointer call

- **Report ID:** 4122039
- **URL:** https://hackerone.com/reports/4122039
- **Program:** curl
- **Reporter:** alicangonullu
- **Severity:** Critical
- **Bounty:** —
- **CWE:** Use After Free
- **CVEs:** —
- **Votes:** 7
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

Missing lock on the shared HSTS cache in `lib/hsts.c` (`CURL_LOCK_DATA_HSTS`) allows a race that frees an `stsentry` still referenced by another thread — deterministic same-address reclaim proves the freed object is fully attacker-writable and its destructor pointer is called with an attacker-chosen argument

## Severity

**High** (suggested) — CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:H/I:H/A:H...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
