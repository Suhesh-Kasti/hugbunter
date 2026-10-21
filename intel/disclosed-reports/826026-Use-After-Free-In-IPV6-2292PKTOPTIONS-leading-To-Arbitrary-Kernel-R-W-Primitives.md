# Use-After-Free In IPV6_2292PKTOPTIONS leading To Arbitrary Kernel R/W Primitives

- **Report ID:** 826026
- **URL:** https://hackerone.com/reports/826026
- **Program:** playstation
- **Reporter:** theflow0
- **Severity:** High
- **Bounty:** 10000 USD
- **CWE:** Use After Free
- **CVEs:** —
- **Votes:** 741
- **Fetched:** 2026-10-21 16:52 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

## Summary

Due to missing locks in option `IPV6_2292PKTOPTIONS` of `setsockopt` , it is possible to race and free the `struct ip6_pktopts ` buffer, while it is being handled by `ip6_setpktopt`. This structure contains pointers (`ip6po_pktinfo`) that can be hijacked to obtain arbitrary kernel R/W primitives. As a consequence, it is easy to have kernel code execution. This vulnerability is...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
