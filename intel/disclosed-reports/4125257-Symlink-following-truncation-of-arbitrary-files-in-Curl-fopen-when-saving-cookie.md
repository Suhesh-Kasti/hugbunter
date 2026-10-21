# Symlink-following truncation of arbitrary files in `Curl_fopen()` when saving cookie jars, HSTS, or alt-svc caches

- **Report ID:** 4125257
- **URL:** https://hackerone.com/reports/4125257
- **Program:** curl
- **Reporter:** gubee
- **Severity:** Low
- **Bounty:** —
- **CWE:** Insecure Temporary File
- **CVEs:** —
- **Votes:** 2
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

## Affected Component

- `lib/curl_fopen.c`, `Curl_fopen()`, line 98: `curlx_fopen(filename, FOPEN_WRITETEXT)`
- Callers: `lib/cookie.c:1543` (cookie jar save), `lib/hsts.c:390` (HSTS save), `lib/altsvc.c:415` (alt-svc save)
- CLI entry points: `-c` / `--cookie-jar` (`src/config2setopts.c:575`), `--hsts FILE` (`:714`), `--alt-svc FILE` (`:711`)

## Summary

When curl saves a cookie jar (`-c` /...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
