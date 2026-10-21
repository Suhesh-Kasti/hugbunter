# Remote Code Execution on www.semrush.com/my_reports on Logo upload

- **Report ID:** 403417
- **URL:** https://hackerone.com/reports/403417
- **Program:** semrush
- **Reporter:** fransrosen
- **Severity:** Critical
- **Bounty:** —
- **CWE:** Command Injection - Generic
- **CVEs:** —
- **Votes:** 824
- **Fetched:** 2026-10-21 16:52 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

The Logo upload in the report constructor at: https://www.semrush.com/my_reports/constructor

{F340480}

is passed through a not properly patched version of ImageMagick. You can use Postscript to get Ghostscript to run which in return allows to trigger arbitrary commands on the server, leading to Remote Code Execution. Tavis Ormandy has also mentioned recently that the policy.xml needs to...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
