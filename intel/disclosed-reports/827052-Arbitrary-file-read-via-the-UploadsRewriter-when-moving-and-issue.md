# Arbitrary file read via the UploadsRewriter when moving and issue

- **Report ID:** 827052
- **URL:** https://hackerone.com/reports/827052
- **Program:** gitlab
- **Reporter:** vakzz
- **Severity:** Critical
- **Bounty:** 20000 USD
- **CWE:** Path Traversal
- **CVEs:** —
- **Votes:** 1503
- **Fetched:** 2026-10-21 16:52 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

### Summary
The `UploadsRewriter` does not validate the file name, allowing arbitrary files to be copied via directory traversal when moving an issue to a new project.

The pattern used to look for references is :
```
  MARKDOWN_PATTERN = %r{\!?\[.*?\]\(/uploads/(?<secret>[0-9a-f]{32})/(?<file>.*?)\)}.freeze
```

This is used by the `UploadsRewriter` when copying an issue to also copy across...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
