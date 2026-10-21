# Memory exhaustion (DoS) via unbounded file read in `EncodingDiscovery.detect_encoding()`

- **Report ID:** 4028616
- **URL:** https://hackerone.com/reports/4028616
- **Program:** weblate
- **Reporter:** sumit-sabhaya
- **Severity:** Medium
- **Bounty:** —
- **CWE:** Uncontrolled Resource Consumption
- **CVEs:** —
- **Votes:** 21
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

## Summary

`EncodingDiscovery.detect_encoding()` in `translation_finder/discovery/base.py` passes the raw file handle to `charset_normalizer.from_fp()`, which internally does `from_bytes(fp.read())` — the **entire file is loaded into memory**, with no size cap. Every other sniffing path in this codebase is bounded at 1 MiB (`FORMAT_SNIFF_MAX_BYTES` in `discovery/files.py`); this one is...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
