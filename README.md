# BugHunt

This is my working folder for bug bounty hunting. I set it up so that CommandCode
(and whatever model I'm running) does the boring parts — recon, mapping, keeping
notes, drafting reports — while I stay the one who actually decides if something
is a real bug.

The whole thing is built around one rule: **the machine is not allowed to call
something a finding.** It can propose. Only a request I actually sent and a
response I actually saw make a candidate real.

Nothing here talks to a target unless I point it at one first.

---

## What's in here

- `AGENTS.md` — the rules and the workflow. CommandCode reads this automatically
  when I work in this folder, so it's basically my standing instructions.
- `.commandcode/agents/` — three subagents: `recon-agent`, `triage-agent`,
  `report-agent`. Each one has a narrow job and a narrow set of tools.
- `.commandcode/skills/` — the skill packs (claude-bughunter + bug-reaper).
  84 skills total, 12 disabled because they're for targets I'm not doing
  (mobile, vSphere, M365, crypto). They still have every web/API class I need.
- `.mcp.json` — the MCP servers (Arson, Burp, Playwright). Committed on purpose
  so a fresh clone works. No secrets in it, just localhost URLs.
- `targets/` — one folder per target. `targets/_template/` is the starting point.
- `intel/disclosed-reports/` — public HackerOne reports pulled down so I can
  study real bugs in the classes I'm hunting.
- `scripts/` — setup, the doctor, the report fetcher, and the MCP launchers.

---

## What has to be running

This isn't a self-contained thing — it plugs into a few local services.

1. **Arson Framework** (Docker). Should be listening on `http://localhost:3001`
   for the MCP server, and the web UI on `:80`. This is my recon engine —
   subfinder, httpx, katana, the query API for everything it has found.
2. **Burp Suite Pro with the MCP extension**. I enable the MCP server in Burp's
   `MCP` tab and it comes up on `http://127.0.0.1:9876`. This is my repeater —
   every request I actually send by hand goes through here.
3. **SearXNG** (Docker) on `http://localhost:5343`. For OSINT and for pulling
   context on a target. I have JSON output enabled in `settings.yml` so scripts
   can use it too, not just the browser.
4. **CommandCode** — `cmd`, version 1.84+.

If Arson, Burp or SearXNG aren't up, `doctor.sh` will tell me straight away.

---

## Fresh clone, step by step

```bash
git clone <this-repo-url> ~/Study/BugHunt
cd ~/Study/BugHunt
```

**1. Install the bridge and the browser.** This is per machine, not per clone.

```bash
./scripts/setup.sh
```

That does three things: installs `supergateway` (needed to talk to Arson and
Burp, which only speak SSE over HTTP), builds the Playwright virtualenv with
`uv` and downloads Chromium. The venv lives in `mcp/playwright/.venv/` and is
gitignored, so it's always rebuilt, never committed. Chromium goes to
`~/.cache/ms-playwright`, also outside the repo.

**2. Start the local services** (Arson stack, Burp with MCP on, SearXNG) if they
aren't already running.

**3. Check everything is wired.**

```bash
./scripts/doctor.sh
```

It should end with `20 passed, 0 failed`. Every line tells me what it checked.
If something fails, the message usually says what to do — e.g. "run setup.sh",
or "enable json in searxng settings.yml". Run this before any session where I
care about the result.

**4. Start hunting.**

```bash
cmd
```

CommandCode loads `AGENTS.md`, the three agents, the skills and the MCP servers.
First message I send is usually just "let's hunt on <target>".

---

## How I actually hunt

This is the loop. It's the same every time, which is the point.

**1. Set up the target folder.**

```bash
./scripts/new-target.sh acme
```

Then I open `targets/acme/NOTES.md` and fill in the top before anything else:
what's in scope, what's out, and what the program's rules are — specifically
whether they allow automated scanning and AI help. If I can't answer that from
the program page, I don't start. That file is the contract for the engagement.

**2. Recon.** I ask for the `recon-agent`. It reads the scope from NOTES.md, uses
Arson to pull subdomains, live hosts, endpoints, tech, and writes:

- `targets/acme/surface.md` — the attack surface as a table
- hypotheses appended to NOTES.md, each with "what would prove or kill this"

The recon agent has no repeater and no browser. It maps, it doesn't touch.

**3. Triage.** This is where `triage-agent` comes in. It's deliberately locked in
plan mode, which means it *cannot send requests*. That's not a limitation I
worked around, it's the design — I don't want an agent firing payloads at
someone's production site on its own.

So what it gives me back is a verdict plus the exact raw request to send:

```http
GET /api/orders/1002 HTTP/1.1
Host: target.example
Authorization: Bearer <my token>
```

**4. I approve it, then it gets sent.** Once I say go, the request goes out
through Burp (`send_http1_request`) or Arson's repeater, and the raw
request/response pair gets written to
`targets/acme/evidence/replay-01-<name>.http.md`.

If I want to watch it in a real browser instead — DOM XSS, anything client-side —
Playwright is there. The `browser_console` tool returns captured alerts and
console output, so I can prove `alert(document.domain)` fired without sitting
there watching a screen.

**5. Verdict.** CONFIRMED, NEEDS MORE EVIDENCE, or REJECTED — written into
FINDINGS.md. Default is REJECT. If it's confirmed, the evidence folder has the
proof.

**6. Report.** `report-agent` drafts `REPORT.md` from the evidence only. It's
told to invent nothing, and to stamp "EVIDENCE MISSING — DO NOT SUBMIT" on
anything it can't back up.

Then **I** read it, check it against the program's rules, and I'm the one who
submits it. Nothing gets submitted by the agent.

---

## The two rules I don't break

**No finding without a replay.** If I can't show the request and the response,
it's a suspicion, not a bug. This is the whole reason the triage agent is in
plan mode.

**Nothing goes out faster than 5 requests/second**, and no destructive payloads —
no `DROP TABLE`, no deleting things to "prove" it works. If a bug needs something
destructive to demonstrate, I write it up as theory and let the program decide.
Getting kicked out of a program costs more than any single report is worth.

---

## MCP servers, and why Arson is trimmed

Three servers, each scoped to how I actually use them:

| Server | Tools exposed | What it's for |
|---|---|---|
| `arson-framework` | 51 of 157 | recon + queries + the repeater |
| `burp` | 27 | manual replay, Collaborator, proxy history |
| `playwright` | 11 | browser proof capture (alerts, console, DOM) |

Arson ships 157 tools. I expose 51. The framework itself is untouched — all 157
still work in Arson's own web UI. I only narrowed what the model sees, for two
reasons:

1. **Cost.** Tool definitions are the biggest fixed cost in every request.
   157 schemas is about 420 KB (~105k tokens) every single time. The 51 I keep
   is about 60 KB (~15k). Caching helps, but a cold session or any change pays
   full price. 86% off for free.
2. **It stops the agent doing something I don't want.** Most of the tools I left
   out are per-class exploiters (`manage_sqli`, `manage_xss`, `manage_ssrf`…) and
   workflow runners that pull in nuclei and ffuf. Recon agents are supposed to
   map, not scan. Not exposing those tools enforces that instead of just asking
   the model to behave.

I checked the trim doesn't cost me anything the agents use: they reference 48
tools, 51 are exposed, none missing. `doctor.sh` checks it.

If I need one back, it's a one-line edit to `.mcp.json` — add
`"--tools", "manage_graphql"` to the args — and restart the session. The full
list of 157 names is in `mcp/README.md`. For one-off stuff I just use Arson's
web UI, which never lost anything.

---

## Skills

`claude-bughunter` (83 skills) and `bug-reaper` (1). They're normal Agent Skills
files, so `/skill:bb-methodology`, `/skill:hunt-xss`, `/skill:triage-validation`
all work, and the model auto-picks them by topic.

12 are disabled in `.commandcode/settings.json` — the mobile, enterprise and
crypto ones. If I ever hit a target that needs one, I delete its line from that
file (or toggle it in `/skills`). Note that `cmd skills list` still shows all 84
as "installed"; disabled just means the model doesn't see them.

---

## The intel folder

`intel/disclosed-reports/` is public HackerOne disclosures saved as markdown —
metadata, a summary snippet and a "Learning Notes" section for me to fill in
while reading. It's the cheapest way to learn a bug class: read how ten real
people found it before I try it myself.

Refresh or add to it with:

```bash
./scripts/fetch-disclosed-reports.sh --sort votes  --limit 60   # best validated
./scripts/fetch-disclosed-reports.sh --sort bounty --limit 40   # highest impact
./scripts/fetch-disclosed-reports.sh --sort latest --limit 40   # what's new
```

It's idempotent — re-running skips what's already there. Full report bodies need
my HackerOne session cookie (`H1_COOKIE=... ./scripts/...`); without it I get the
public summary and click through to the report.

No Intigriti or Bugcrowd feed, on purpose: Intigriti has no public disclosure API
at all and Bugcrowd's only public feed is metadata with no titles or classes.
Worth knowing so I don't go looking for a scraper that doesn't exist.

---

## Repo layout

```
AGENTS.md                 my standing rules for the agent
.mcp.json                 MCP servers (Arson 51 / Burp / Playwright)
.commandcode/
  agents/                 recon, triage, report
  skills/                 the skill packs
  settings.json           disabled skills
mcp/
  playwright/             uv venv + server.py + uv.lock
  README.md               why Arson is trimmed, full 157 tool list
scripts/
  setup.sh                one-time per machine
  doctor.sh               is everything wired (run before a hunt)
  new-target.sh           scaffold targets/<name>/
  fetch-disclosed-reports.sh
  mcp-bridge.sh           SSE -> stdio bridge for Arson + Burp
  playwright-mcp.sh       launches the browser MCP
targets/
  _template/              NOTES.md + evidence conventions
  <name>/                 NOTES.md, surface.md, FINDINGS.md, REPORT.md, evidence/
intel/disclosed-reports/  HackerOne writeups for study
```

`skills/` (the upstream clones I copied the skills out of) is gitignored — it's
7 MB of docs and history I don't need in every clone. The skills themselves are
in `.commandcode/skills/`.

---

## When something breaks

- **`doctor.sh` says a server exposes 0 tools.** That MCP server didn't start.
  Check the service is up, then look at `/mcp` inside a session for the error.
- **Chromium won't launch.** run
  `sudo ./mcp/playwright/.venv/bin/playwright install-deps chromium` once. It
  launched fine on CachyOS, but it's the usual culprit on a bare machine.
- **Arson/Burp tools missing entirely.** `supergateway` isn't installed —
  `./scripts/setup.sh`. If it's installed somewhere odd, `scripts/mcp-bridge.sh`
  finds it in `.tools/`, `~/.local/bin`, or on `PATH`, and falls back to `npx`.
- **A skill isn't showing up.** `cmd skills list --debug` says why — usually a
  description over 1024 chars, or the folder name not matching the `name:` field.
- **SearXNG returns 403 on `?format=json`.** JSON output isn't enabled in
  `settings.yml` — add `json` to `search.formats` and restart the container.

---

## Things I still want to add

- A wrapper that enforces the 5 req/s ceiling mechanically instead of trusting
  the instructions.
- A second identity helper for IDOR work, so every access-control test has an
  A and a B account by default.
- Somewhere to keep per-class notes that builds up as I work through the intel
  reports.

---

Authorized testing only. Everything in here assumes the target is covered by a
program's scope or I have written permission. If it isn't, the answer is no.
