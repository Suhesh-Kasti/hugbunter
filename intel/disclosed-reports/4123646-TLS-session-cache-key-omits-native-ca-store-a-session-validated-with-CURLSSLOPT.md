# TLS session cache key omits native_ca_store: a session validated with CURLSSLOPT_NATIVE_CA can be resumed by a transfer that disabled it (incomplete f

- **Report ID:** 4123646
- **URL:** https://hackerone.com/reports/4123646
- **Program:** curl
- **Reporter:** joumaaa
- **Severity:** Low
- **Bounty:** —
- **CWE:** Improper Certificate Validation
- **CVEs:** CVE-2026-11564
- **Votes:** 5
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

## Summary

CVE-2026-11564 fixed the connection *pool* so that a connection whose certificate was
validated with the native CA store is not reused by a later transfer that switched to
custom CA material. That same field, `native_ca_store`, is compared for connection reuse
but is NOT part of the TLS *session* cache key. So a TLS session established and validated
with `CURLSSLOPT_NATIVE_CA` can...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
