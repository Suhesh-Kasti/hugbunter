# Explicit NO_PROXY /0 CIDR rules fail to bypass HTTP proxy for IP-literal requests

- **Report ID:** 4114965
- **URL:** https://hackerone.com/reports/4114965
- **Program:** curl
- **Reporter:** bootherr
- **Severity:** Low
- **Bounty:** —
- **CWE:** Information Exposure Through Sent Data
- **CVEs:** —
- **Votes:** 12
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

## Summary:

With an HTTP proxy configured, I found that curl sends IPv4 address-literal requests through it with `NO_PROXY=0.0.0.0/0`, and IPv6 address-literal requests through it with `NO_PROXY=::/0`. A zero-bit CIDR prefix should match every address in its family, so those requests should bypass the proxy. A mixed rule such as `NO_PROXY=0.0.0.0/0,::/0` lets a caller keep numeric destinations...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
