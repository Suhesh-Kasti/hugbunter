# RCE via the DecompressedArchiveSizeValidator and Project BulkImports (behind feature flag)

- **Report ID:** 1609965
- **URL:** https://hackerone.com/reports/1609965
- **Program:** gitlab
- **Reporter:** vakzz
- **Severity:** Critical
- **Bounty:** 33510 USD
- **CWE:** Command Injection - Generic
- **CVEs:** CVE-2022-2185
- **Votes:** 387
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

### Summary

The `DecompressedArchiveSizeValidator` is used to check the size of a archive before extracting it:

https://gitlab.com/gitlab-org/gitlab/-/blob/v15.1.0-ee/lib/gitlab/import_export/decompressed_archive_size_validator.rb#L82
```ruby
      def command
        "gzip -dc #{@archive_path} | wc -c"
      end

   def validate
        pgrp = nil
        valid_archive = true

       ...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
