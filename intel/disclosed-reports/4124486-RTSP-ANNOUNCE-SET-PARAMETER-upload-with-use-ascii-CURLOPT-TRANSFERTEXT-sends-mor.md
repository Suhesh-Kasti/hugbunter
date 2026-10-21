# RTSP ANNOUNCE/SET_PARAMETER upload with --use-ascii / CURLOPT_TRANSFERTEXT sends more body bytes than the declared Content-Length (incomplete fix of e

- **Report ID:** 4124486
- **URL:** https://hackerone.com/reports/4124486
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

curl refuses RTSP uploads that combine a body with `--crlf` / `CURLOPT_CRLF`, because the
LF→CRLF conversion makes the number of bytes actually sent differ from the `Content-Length`
curl declares to the server. That guard was added as a security fix:

- RTSP: commit `e84f95a` "rtsp: refuse doing uploads with CRLF conversions", `lib/rtsp.c:235`:
  ```c
  if(data->set.crlf) {
   ...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
