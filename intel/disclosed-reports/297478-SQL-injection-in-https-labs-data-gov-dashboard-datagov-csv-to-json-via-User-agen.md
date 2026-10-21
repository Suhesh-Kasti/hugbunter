# SQL injection in https://labs.data.gov/dashboard/datagov/csv_to_json via User-agent

- **Report ID:** 297478
- **URL:** https://hackerone.com/reports/297478
- **Program:** gsa_bbp
- **Reporter:** harisec
- **Severity:** Critical
- **Bounty:** —
- **CWE:** SQL Injection
- **CVEs:** —
- **Votes:** 699
- **Fetched:** 2026-10-21 16:52 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

I've identified an SQL injection vulnerability in the website  **labs.data.gov** that affects the endpoint `/dashboard/datagov/csv_to_json` and can be exploited via the **User-Agent** HTTP header.

I didn't extracted any data from the database, I've confirmed the vulnerability using **sleep** SQL queries with various arithmetic operations. The **sleep** command combined with the arithmetic...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
