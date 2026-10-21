# RCE when removing metadata with ExifTool

- **Report ID:** 1154542
- **URL:** https://hackerone.com/reports/1154542
- **Program:** gitlab
- **Reporter:** vakzz
- **Severity:** Critical
- **Bounty:** 20000 USD
- **CWE:** Code Injection
- **CVEs:** —
- **Votes:** 508
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

### Summary
When uploading image files, GitLab Workhorse passes any files with the extensions [jpg|jpeg|tiff](https://gitlab.com/gitlab-org/gitlab/-/blob/v13.10.2-ee/workhorse/internal/upload/exif/exif.go#L104) through to [ExifTool](https://exiftool.org/) to remove any non-whitelisted tags.

An issue with this is that ExifTool will ignore the file extension and try to determine what the file is...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
