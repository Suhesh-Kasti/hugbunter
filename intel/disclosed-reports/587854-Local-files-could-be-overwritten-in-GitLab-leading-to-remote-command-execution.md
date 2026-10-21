# Local files could be overwritten in GitLab, leading to remote command execution

- **Report ID:** 587854
- **URL:** https://hackerone.com/reports/587854
- **Program:** gitlab
- **Reporter:** saltyyolk
- **Severity:** Critical
- **Bounty:** 12000 USD
- **CWE:** Command Injection - Generic
- **CVEs:** —
- **Votes:** 542
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

### Summary
#### Arbitrary file overwrite
A new feature (download a directory of a repository) in GitLab 11.11 introduced some changes in `./internal/service/repository/archive.go` of Gitaly.
```go
func handleArchive(ctx context.Context, writer io.Writer, in *gitalypb.GetArchiveRequest, compressCmd *exec.Cmd, format string, path string) error {                                                   ...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
