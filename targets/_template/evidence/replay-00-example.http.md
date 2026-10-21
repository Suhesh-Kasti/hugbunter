# Example replay — copy this file to targets/<name>/evidence/replay-01-<name>.http.md

- **Candidate:** #1 — <one-line hypothesis>
- **Tested:** <YYYY-MM-DD HH:MM UTC>
- **Identity:** account A (<user-a@example.test>) attacking account B's object
- **Target:** <https://target.example/api/orders/1002>

## Request

```http
GET /api/orders/1002 HTTP/1.1
Host: target.example
Authorization: Bearer [REDACTED]
Accept: application/json
Connection: close
```

## Response

```http
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: 132

{"id":1002,"owner":"user-b@example.test","total":"129.00","status":"shipped"}
```

## Verdict

- **Status:** CONFIRMED / NEEDS MORE EVIDENCE / REJECTED
- **Gate questions answered:** concrete request+response (1), reproducible from a
  clean session (2), exact impact (3)
- **Gate questions still open:** duplicate check (4), preconditions (5), scope (6)
- **Redactions:** Authorization token replaced with [REDACTED]
- **Notes for the human:** <what to re-verify by hand>
