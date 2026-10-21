# Account Takeover via Password Reset without user interactions

- **Report ID:** 2293343
- **URL:** https://hackerone.com/reports/2293343
- **Program:** gitlab
- **Reporter:** asterion04
- **Severity:** Critical
- **Bounty:** 35000 USD
- **CWE:** Improper Access Control - Generic
- **CVEs:** —
- **Votes:** 987
- **Fetched:** 2026-10-21 16:52 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

@asterion04 submitted a report to GitLab.

Summary

I found a way to change the password of a GitLab account via the password reset form and successfully retrieve the final reset link without user interactions, using just its email address.
Steps to reproduce

Go to "Forgot Your Password?" link
Enter the victim's email and intercept the submit request via Burp Suite .
Then right-click on the...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
