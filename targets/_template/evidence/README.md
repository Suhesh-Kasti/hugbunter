# Evidence — <target>

Raw request/response pairs live here. They are the only thing that makes a
finding *confirmed* rather than *suspected*.

## Rules

1. **One file per attempt**: `replay-<NN>-<short-name>.http.md`
   Example: `replay-01-idor-order-id.http.md`
2. **Paste raw HTTP**, not a summary. Request exactly as sent (method, path,
   headers, body), response exactly as received (status line, headers, body).
   Trim the body only if it is huge — say so and keep the beginning and end.
3. **Redact before saving**: your own session cookies, Authorization tokens,
   other users' PII if you did not need it to prove impact. Replace with
   `[REDACTED]` and note it. Never paste a live credential you did not create.
4. **Record the verdict** at the bottom: CONFIRMED / NEEDS MORE EVIDENCE / REJECTED,
   and which of the 7 Gate questions the evidence answers.
5. **Reproduce from a clean session** before calling it confirmed — a response
   from a warm session may be a cached or already-authenticated artifact.

## Workflow (who does what)

- `triage-agent` runs in plan mode and therefore **cannot send requests**. It
  emits the exact raw HTTP to send, plus the theory of impact.
- A **human approves** each request.
- The **main session** sends it (Burp `send_http1_request` / Arson `replay_request`)
  and writes the pair into this folder as `replay-<NN>-<name>.http.md`.
- Nothing is CONFIRMED until the response is here.

## Impact evidence

For a claim about *another* user's data, include two identities (A and B): the
request as A that reaches B's object, and B's own request showing it is theirs.
One account alone proves an ID is predictable, not that access is unauthorized.

_Template: ../_template/evidence/replay-00-example.http.md_
