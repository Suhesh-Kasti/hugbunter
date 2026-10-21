# One-click account hijack for anyone using Apple sign-in with Reddit, due to response-type switch + leaking href to XSS on www.redditmedia.com

- **Report ID:** 1567186
- **URL:** https://hackerone.com/reports/1567186
- **Program:** reddit
- **Reporter:** fransrosen
- **Severity:** Critical
- **Bounty:** —
- **CWE:** Improper Access Control - Generic
- **CVEs:** —
- **Votes:** 509
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

Hi,

# Description

I've been researching new ways to steal OAuth codes and access-tokens using postMessage, and I found a way for me to steal the code and/or access-token from Apple-sign-in on reddit.com allowing a full account hijack of the account in Reddit.

The way it works is this:

1. Attacker prepares a `state`-parameter in its own browser from the regular Apple sign-in flow in Reddit....

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
