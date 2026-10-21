# Exfiltrate and mutate repository and project data through injected templated service

- **Report ID:** 446585
- **URL:** https://hackerone.com/reports/446585
- **Program:** gitlab
- **Reporter:** jobert
- **Severity:** Critical
- **Bounty:** 11000 USD
- **CWE:** Improper Access Control - Generic
- **CVEs:** —
- **Votes:** 762
- **Fetched:** 2026-10-21 16:52 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

The GitLab import feature contains a vulnerability that allows an attacker to import a project that creates a service template. Service templates can normally only be created by a GitLab instance Administrator. When a new project is created, service templates are automatically initialized for the project that is being created. Initializing and saving the service templates is handled in the...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
