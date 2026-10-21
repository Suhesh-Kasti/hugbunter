# IMAP custom FETCH literals can spoof tagged responses and desynchronize reused connections

- **Report ID:** 4021854
- **URL:** https://hackerone.com/reports/4021854
- **Program:** curl
- **Reporter:** giant_anteater
- **Severity:** —
- **Bounty:** —
- **CWE:** —
- **CVEs:** —
- **Votes:** 5
- **Fetched:** 2026-10-21 16:54 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

## Summary

There is an IMAP parser vulnerability, related to a custom `FETCH` whose message set begins with a range or comma, `is_custom_fetch_listing()` causes `imap_state_listsearch_resp()` to skip literal parsing (`lib/imap.c:1233-1235`).

The generic ping-pong reader nevertheless continues parsing the response as newline-delimited IMAP responses. Consequently, a line inside an...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
