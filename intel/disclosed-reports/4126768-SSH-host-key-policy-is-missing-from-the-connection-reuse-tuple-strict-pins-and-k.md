# SSH host-key policy is missing from the connection-reuse tuple: strict pins and knownhosts are silently skipped on reused SFTP/SCP connections

- **Report ID:** 4126768
- **URL:** https://hackerone.com/reports/4126768
- **Program:** curl
- **Reporter:** cyrax21_
- **Severity:** Low
- **Bounty:** —
- **CWE:** Authentication Bypass by Primary Weakness
- **CVEs:** CVE-2022-27782
- **Votes:** 5
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

(The core effect is a silent host-authentication bypass: a transfer whose
configured SSH host-key policy would reject the server is served anyway, with
exit code 0 and no warning, because it reuses a pooled connection established
under a weaker or absent policy. curl may assess this lower because it
requires two SSH transfers on one connection pool with differing policies —
but that is exactly...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
