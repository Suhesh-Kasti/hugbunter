# Stored XSS on the public Pontoon dashboards: the latest-activity tooltip re-parses a contributor's account address as HTML

- **Report ID:** 3988961
- **URL:** https://hackerone.com/reports/3988961
- **Program:** mozilla
- **Reporter:** timhaines
- **Severity:** High
- **Bounty:** 3000 USD
- **CWE:** Cross-site Scripting (XSS) - Stored
- **CVEs:** —
- **Votes:** 51
- **Fetched:** 2026-10-21 16:54 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

## Summary

Pontoon's latest-activity tooltip on its public dashboards built its markup by concatenating contributor-supplied `data-*` values into a string and handing it to jQuery's `.after()`. Only the translation text was encoded. The server escaped the values into the attributes, but the browser decodes attributes before jQuery reads them, so the markup came back raw.

A contributor with no...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
