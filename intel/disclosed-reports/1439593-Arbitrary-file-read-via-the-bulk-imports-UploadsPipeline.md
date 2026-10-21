# Arbitrary file read  via the bulk imports UploadsPipeline

- **Report ID:** 1439593
- **URL:** https://hackerone.com/reports/1439593
- **Program:** gitlab
- **Reporter:** vakzz
- **Severity:** Critical
- **Bounty:** 29000 USD
- **CWE:** Path Traversal
- **CVEs:** —
- **Votes:** 329
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

### Summary

The bulk imports api does not remove symlinks when untaring the uploads.tar.gz file, allowing arbitrary files to be read and uploaded when importing a group.

When a group has uploads (such as markdown attachments), an `uploads.tar.gz` file will be downloaded and extracted in the...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
