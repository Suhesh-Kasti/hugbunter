# Privilege Escalation From user to SYSTEM via unauthenticated command execution

- **Report ID:** 544928
- **URL:** https://hackerone.com/reports/544928
- **Program:** ui
- **Reporter:** b0yd
- **Severity:** Critical
- **Bounty:** —
- **CWE:** Command Injection - Generic
- **CVEs:** CVE-2019-15595
- **Votes:** 553
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

The vulnerability, or feature depending how you look at it, is the ability to execute commands using the 
evostream API interface that is exposed on localhost:7440. Since the evostream service is running as SYSTEM a user can use the launchprocess command,  http://docs.evostream.com/2.0/launchProcess.html, to execute any binary with supplied arguments. The only thing that is keeping this...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
