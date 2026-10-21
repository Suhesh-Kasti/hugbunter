# SCP upload with --crlf sends more bytes than the size declared to the server (same class curl refused for IMAP CVE-2026-87864 and RTSP)

- **Report ID:** 4123654
- **URL:** https://hackerone.com/reports/4123654
- **Program:** curl
- **Reporter:** joumaaa
- **Severity:** Low
- **Bounty:** —
- **CWE:** CRLF Injection
- **CVEs:** CVE-2026-87864
- **Votes:** 5
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

## Summary

curl recently started REFUSING uploads that combine a size-declaring protocol with CRLF
conversion, because the LF->CRLF expansion makes the number of bytes actually sent differ
from the size declared to the server:

- IMAP APPEND — CVE-2026-87864, `lib/imap.c:885-886`:
  `if(data->set.crlf) failf(data, "Cannot APPEND with CRLF conversion making size unknown");`
- RTSP — commit...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
