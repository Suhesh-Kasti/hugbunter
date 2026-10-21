# POP3: data after the end-of-body terminator is written into the retrieved message

- **Report ID:** 4132132
- **URL:** https://hackerone.com/reports/4132132
- **Program:** curl
- **Reporter:** durgasai1
- **Severity:** Medium
- **Bounty:** —
- **CWE:** Acceptance of Extraneous Untrusted Data With Trusted Data
- **CVEs:** —
- **Votes:** 1
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

## Vulnerability Information

When a POP3 server sends the end-of-body terminator and further data in the same read, curl
writes the bytes after the terminator into the retrieved message's output file and still reports
success. The PoC returns the message, its "." line, and then a second "+OK" response that answers
no command; the file for message 1 becomes b'HONEST-ONE\r\n.\r\n+OK...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
