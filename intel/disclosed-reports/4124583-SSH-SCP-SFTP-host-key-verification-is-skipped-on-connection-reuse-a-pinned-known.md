# SSH (SCP/SFTP) host-key verification is skipped on connection reuse — a pinned/known_hosts transfer silently reuses a previously-unverified connection

- **Report ID:** 4124583
- **URL:** https://hackerone.com/reports/4124583
- **Program:** curl
- **Reporter:** joumaaa
- **Severity:** Medium
- **Bounty:** —
- **CWE:** Improper Validation of Certificate with Host Mismatch
- **CVEs:** CVE-2022-27782
- **Votes:** 2
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

## Summary

For SCP/SFTP, curl verifies the server's host key once, during the initial connect state machine,
in `ssh_check_fingerprint()` — which reads `CURLOPT_SSH_HOST_PUBLIC_KEY_SHA256` / `_MD5`, the
`CURLOPT_SSH_KNOWNHOSTS` file, and the `CURLOPT_SSH_HOSTKEYFUNCTION` callback. That function has
exactly one caller, `ssh_state_hostkey()` (`lib/vssh/libssh2.c:1461`), reached only on a...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
