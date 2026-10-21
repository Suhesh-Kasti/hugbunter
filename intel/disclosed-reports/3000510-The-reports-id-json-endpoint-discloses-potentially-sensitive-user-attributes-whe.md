# The /reports/:id.json endpoint discloses potentially sensitive user attributes when reporter summary is present

- **Report ID:** 3000510
- **URL:** https://hackerone.com/reports/3000510
- **Program:** security
- **Reporter:** avinash_
- **Severity:** Critical
- **Bounty:** —
- **CWE:** Information Disclosure
- **CVEs:** —
- **Votes:** 625
- **Fetched:** 2026-10-21 16:52 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

Hi

The.json endpoint of any disclosed report is leaking reporter's email, OTP backup codes, reporter's phone number, "graphql_secret_token", tshirt size all the reporter account's internal details etc. 

```
 GET /reports/█████.json HTTP/2
Host: hackerone.com
````

* I was checking Hackerone's disclosed report ██████████ and suddenly during check found .json point is leaking too much data of...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
