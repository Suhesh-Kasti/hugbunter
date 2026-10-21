# Program onboarding — what to send me

Paste this into the chat and fill in what you have. Anything you leave out, I
will mark `UNKNOWN` rather than assume it is allowed.

## 1. Target name

What I should call this engagement. Short, lowercase, no spaces. The program
handle or the apex domain with dots as dashes works well.

```
target name: ....................
example:     acme        acme-com        acme-bbp
```

## 2. Raw policy text

Paste the program's scope and rules **verbatim**. Do not summarise it — the
wording is what decides whether automated testing and AI assistance are allowed,
and a summary loses exactly that detail.

Where to copy it from:

- **HackerOne:** the program page, "Scope" and "Policy" sections. Include the
  structured scope table if there is one (asset, type, max severity, bounty).
- **Bugcrowd:** the brief, plus the "Scope" and "Out of scope" tabs.
- **Intigriti:** the program page's scope and rules sections.
- **Self-hosted / VDP:** the security.txt, the disclosure page, or the policy
  document they publish.

What to include if it is present:

- [ ] In-scope assets (domains, wildcards, apps, APIs, mobile, IP ranges)
- [ ] Out-of-scope assets and third-party exclusions
- [ ] Rate limits or "no automated scanning" / "no brute force" wording
- [ ] Whether automated tooling is allowed
- [ ] Whether AI assistance is allowed
- [ ] Any blackout windows or forbidden test types

If a section does not exist, say so. "No rate limit stated" is a useful answer;
silence is not the same as permission.

## 3. Program URL

The link, so the extracted rules can be checked against the live policy later.

```
program url:  https://hackerone.com/............
              https://bugcrowd.com/............
              https://app.intigriti.com/............
```

Optional: platform, max bounty, "VDP (no monetary reward)" vs paid program.

---

## What happens next

1. I extract in-scope, out-of-scope, rate limits and the two testing answers.
2. I run `./scripts/new-target.sh <name>` and write `targets/<name>/TARGET.md`,
   with the sentence each rule came from.
3. If the program sets a rate limit below 5/s, I write it to
   `targets/<name>/RATE_LIMIT` so the replay throttle uses it.
4. If AI assistance or automated testing is `UNKNOWN`, I stop here and ask you
   to confirm with the program before anything touches the target.
5. I show you the extraction table and **ask permission before launching
   `recon-agent`**. Recon does not start in the same turn as onboarding.

---

## Example (copy this shape)

```
target name: acme

raw policy text:
---
Scope
In scope:
  *.acme.com
  api.acme.com
Out of scope:
  blog.acme.com
  Any third-party SaaS not owned by Acme
Rules:
  Do not use automated vulnerability scanners.
  AI-assisted testing is permitted.
  Rate limit: 2 requests per second.
---

program url: https://hackerone.com/acme
```

That produces: in scope `*.acme.com`, `api.acme.com`; out of scope
`blog.acme.com` and third-party SaaS; rate limit 2/s (written to RATE_LIMIT);
automated testing NOT allowed; AI assistance allowed. Then the recon permission
question.
