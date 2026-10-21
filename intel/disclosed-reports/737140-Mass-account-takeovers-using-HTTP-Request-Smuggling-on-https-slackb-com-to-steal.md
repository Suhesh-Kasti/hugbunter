# Mass account takeovers using HTTP Request Smuggling on https://slackb.com/ to steal session cookies

- **Report ID:** 737140
- **URL:** https://hackerone.com/reports/737140
- **Program:** slack
- **Reporter:** defparam
- **Severity:** Critical
- **Bounty:** —
- **CWE:** HTTP Request Smuggling
- **CVEs:** —
- **Votes:** 870
- **Fetched:** 2026-10-21 16:52 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

This researcher exploited an HTTP Request Smuggling bug on a Slack asset to perform a CL.TE-based hijack onto neighboring customer requests. This hijack forced the victim into an open-redirect that forwarded the victim onto the researcher's collaborator client with slack domain cookies. The posted cookies in the customer request on the collaborator client contained the customer's secret session...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
