# curl RTSP connection reuse routes response headers to the RTP callback (rtsp_conn state machine not reset between sessions)

- **Report ID:** 4121685
- **URL:** https://hackerone.com/reports/4121685
- **Program:** curl
- **Reporter:** noraqiu
- **Severity:** High
- **Bounty:** —
- **CWE:** —
- **CVEs:** —
- **Votes:** 5
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

## Summary

libcurl's RTSP client keeps a per-connection RTP parsing state machine in `struct rtsp_conn` (`state`, `in_header`, `rtp_len`, `buf`). This state machine is initialised exactly once, when a brand-new connection is allocated, and is never reset thereafter. RTSP connections are pooled and reused across requests (`PROTOPT_CONN_REUSE`), so a normal `SETUP → PLAY → GET_PARAMETER` session...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
