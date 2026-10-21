# TFTP accepts a first response from an IP other than the requested server

- **Report ID:** 4103651
- **URL:** https://hackerone.com/reports/4103651
- **Program:** curl
- **Reporter:** sushiikan
- **Severity:** Low
- **Bounty:** —
- **CWE:** Man-in-the-Middle
- **CVEs:** —
- **Votes:** 10
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

### Summary:
When curl sends a TFTP request to the IP in the URL, it accepts the first valid response from any source IP and pins that sender as the transfer peer. A host that can get UDP packets to the client's ephemeral port and win this first-response race can receive bytes from a TFTP upload or provide the contents of a download

### Affected version
Tested with curl 8.22.0 and master...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
