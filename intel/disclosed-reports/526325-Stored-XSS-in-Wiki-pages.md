# Stored XSS in Wiki pages

- **Report ID:** 526325
- **URL:** https://hackerone.com/reports/526325
- **Program:** gitlab
- **Reporter:** ryhmnlfj
- **Severity:** High
- **Bounty:** —
- **CWE:** Cross-site Scripting (XSS) - Stored
- **CVEs:** CVE-2019-5467
- **Votes:** 629
- **Fetched:** 2026-10-21 16:52 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

### Summary

I found Stored XSS using Wiki-specific Hierarchical link Markdown in Wiki pages.

### Steps to reproduce

1. Sign in to GitLab.
2. Open a Project page that you have permission to edit Wiki pages.
3. Open Wiki page.
4. Click "New page" button.
5. Fill out "Page slug" form with `javascript:`.
6. Click "Create page" button.
7. Fill out the each form as follows:    
Title:...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
