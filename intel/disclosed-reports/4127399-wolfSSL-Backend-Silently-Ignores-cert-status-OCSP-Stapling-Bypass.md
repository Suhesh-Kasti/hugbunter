# wolfSSL Backend Silently Ignores --cert-status (OCSP Stapling Bypass)

- **Report ID:** 4127399
- **URL:** https://hackerone.com/reports/4127399
- **Program:** curl
- **Reporter:** sheldonholmes
- **Severity:** Medium
- **Bounty:** —
- **CWE:** Improper Certificate Validation
- **CVEs:** —
- **Votes:** 1
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

## Summary
When curl is built with the wolfSSL TLS backend, `--cert-status` (`CURLOPT_SSL_VERIFYSTATUS`) is silently accepted and ignored. The wolfSSL backend sets `cert_status_request = NULL` in its vtable (`lib/vtls/wolfssl.c:2309`), meaning OCSP stapling is not implemented. The `curl_easy_setopt()` call returns `CURLE_NOT_BUILT_IN`, but the CLI tool at `src/config2setopts.c:442` discards...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
