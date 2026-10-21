# urlapi: CURLUPART_HOST accepts text after an IPv6 zone ip and URL round trip changes the host

- **Report ID:** 4127756
- **URL:** https://hackerone.com/reports/4127756
- **Program:** curl
- **Reporter:** offyotto
- **Severity:** Low
- **Bounty:** —
- **CWE:** Improper Input Validation
- **CVEs:** —
- **Votes:** 5
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

## Summary:
[six or fewer sentences describing the issue in your own human voice and optionally a short proof-of-concept script]
An app can set a host from untrusted input from CURLUPART_HOST, as the docs allow, and rely on curl to reject bad hosts. curl accepts [fe80::1%25eth0]@evil.example/x as a valid IPv6 host. The URL it then builds has evil.example as its host. Any code that uses that URL...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
