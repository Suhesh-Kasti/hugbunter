# Git flag injection - local file overwrite to remote code execution

- **Report ID:** 658013
- **URL:** https://hackerone.com/reports/658013
- **Program:** gitlab
- **Reporter:** vakzz
- **Severity:** Critical
- **Bounty:** 12000 USD
- **CWE:** Command Injection - Generic
- **CVEs:** —
- **Votes:** 777
- **Fetched:** 2026-10-21 16:52 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

### Summary

The `wiki_blobs` scope of the Search API can be provided with an arbitrary `ref` parameter, allowing for additional flags to be injected into the git command. 

For example the following API call:

```
`curl --header "PRIVATE-TOKEN: $TOKEN" 'http://gitlab-vm.local/api/v4/projects/4/search?scope=wiki_blobs&search=page&ref=--output=/tmp/file'`
```

The above will generate the...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
