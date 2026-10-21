# H1514 Remote Code Execution on kitcrm using bulk customer update of Priority Products

- **Report ID:** 422944
- **URL:** https://hackerone.com/reports/422944
- **Program:** shopify
- **Reporter:** fransrosen
- **Severity:** Medium
- **Bounty:** —
- **CWE:** Command Injection - Generic
- **CVEs:** —
- **Votes:** 830
- **Fetched:** 2026-10-21 16:52 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

As part of [H1-514](https://www.hackerone.com/blog/Shopify-Awards-116000-Hackers-Canada-h1-514-Recap), @fransrosen and @avlidienbrunn reported that Kit was not validating the file type of uploaded images during the bulk customer update process. Since Kit used Imagemagick and did not disable Ghostscript, the lack of validation meant that uploading a malicious Postscript file would result in...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
