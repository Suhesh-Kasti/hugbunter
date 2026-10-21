# SMTP header injection via C-escape `\r` in the recipient display name

- **Report ID:** 3913007
- **URL:** https://hackerone.com/reports/3913007
- **Program:** nextcloud
- **Reporter:** dogeshark
- **Severity:** None
- **Bounty:** —
- **CWE:** Buffer Over-read
- **CVEs:** —
- **Votes:** 19
- **Fetched:** 2026-10-21 16:53 UTC
- **Source:** HackerOne public hacktivity (GraphQL)

## Summary

Vulnerability Summary

Roundcube strips CR/LF from address input in `rcmail_sendmail::email_input_format()`
(`program/include/rcmail_sendmail.php:760`) and then, twenty-five lines later,
calls `stripcslashes()` on the recipient's display name at
`program/include/rcmail_sendmail.php:790`. An authenticated user who submits the
**two-character** sequence `\r` inside a quoted display name passes...

## Report Body

_Not fetched: HackerOne returns the full write-up only to authenticated clients._
_Read it at the URL above, or set `H1_COOKIE` and re-run after deleting this file._

## Learning Notes

- **Bug class:**
- **Root cause:**
- **What made it exploitable:**
- **How I would confirm/refute it on a target:**
- **What the agent got right / wrong:**
