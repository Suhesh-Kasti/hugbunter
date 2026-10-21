#!/usr/bin/env python3
"""build-intel-index.py — group intel/disclosed-reports/*.md by vulnerability class.

Reads the markdown files the fetcher writes and produces intel/INDEX.md, so a
class (say SSRF) can be picked and read without scrolling 111 filenames.

Usage:
    python3 scripts/build-intel-index.py

Reports can land in more than one class; anything unmatched goes to Uncategorised.
"""

from __future__ import annotations

import glob
import os
import re
from collections import defaultdict

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
REPORTS = os.path.join(ROOT, "intel", "disclosed-reports")
OUT = os.path.join(ROOT, "intel", "INDEX.md")

# Order matters only for the printed legend, not for matching.
CLASSES: list[tuple[str, str]] = [
    ("XSS", r"\bxss\b|stored xss|reflected xss|dom[- ]based|\bcross-site scripting\b|html injection"),
    ("SQLi", r"\bsql injection\b|\bsqli\b|blind sql"),
    ("RCE / Command injection", r"\brce\b|remote code execution|remote command execution|command injection|code execution|deserializ|webshell|arbitrary code"),
    ("SSRF", r"\bssrf\b|server-side request forgery"),
    ("Access control / IDOR", r"\bidor\b|insecure direct object|broken object level|\bbola\b|access control|authorization bypass|authorisation bypass|privilege escalation|vertical privilege|horizontal privilege|role escalation|become admin"),
    ("Account takeover / Auth bypass", r"account takeover|\bato\b|authentication bypass|auth bypass|password reset|confirmation bypass|session (?:cookie|fixation|hijack)|token leak|\b2fa\b|\bmfa\b|\botp\b|login as|impersonat|one-click account"),
    ("CSRF", r"\bcsrf\b|cross-site request forgery"),
    ("Request smuggling", r"request smuggling|smuggling|cl\.te|te\.cl"),
    ("Cache poisoning", r"cache poison|web cache|\bwcv\b"),
    ("Open redirect", r"open redirect"),
    ("File read / LFI / traversal", r"\blfi\b|local file inclusion|path traversal|directory traversal|arbitrary file (?:read|write)|file read|symlink"),
    ("File upload", r"file upload|upload bypass|uploads"),
    ("GraphQL", r"graphql"),
    ("OAuth / SSO / SAML", r"oauth|\boidc\b|\bsso\b|\bsaml\b|sign in with|single sign-on|idp\b"),
    ("JWT", r"\bjwt\b|json web token|alg[: ]?none"),
    ("XXE / XML", r"\bxxe\b|xml external|xml signature"),
    ("SSTI / Template injection", r"\bssti\b|template injection|templated|template engine"),
    ("Subdomain takeover", r"subdomain takeover"),
    ("Information disclosure / secrets", r"information disclosure|info(?:rmation)? leak|sensitive (?:data|information|user)|exposed|leaked|disclosure|api key|access token|credential"),
    ("Denial of service / crash", r"denial of service|\bdos\b|memory exhaustion|crash|use-after-free|unbounded|recursionerror"),
    ("Memory / TLS / transport", r"buffer overflow|out-of-bounds|heap|tls|ssl|openssl|hsts|ocsp|certificate|cryptograph|cipher"),
    ("CORS", r"\bcors\b"),
    ("Clickjacking", r"clickjacking|x-frame-options|frame-ancestors"),
    ("Business logic", r"business logic|logic flaw|improper|misconfigur|rate limit|brute force|bypass"),
    ("Race condition", r"race condition|\brace\b|\btoctou\b"),
]
COMPILED = [(name, re.compile(pat, re.I)) for name, pat in CLASSES]


def field(text: str, label: str) -> str:
    m = re.search(rf"^- \*\*{re.escape(label)}:\*\*\s*(.+)$", text, re.M)
    return m.group(1).strip() if m else ""


def parse(path: str) -> dict | None:
    text = open(path, encoding="utf-8", errors="replace").read()
    title = ""
    m = re.search(r"^#\s+(.+)$", text, re.M)
    if m:
        title = m.group(1).strip()
    rid = field(text, "Report ID") or os.path.basename(path).split("-")[0]
    url = field(text, "URL") or f"https://hackerone.com/reports/{rid}"
    summary = ""
    ms = re.search(r"## Summary\n+(.*?)(?=\n## |\Z)", text, re.S)
    if ms:
        summary = " ".join(ms.group(1).split())[:600]

    meta = {
        "id": rid,
        "title": title or "(untitled)",
        "url": url,
        "program": field(text, "Program"),
        "severity": field(text, "Severity"),
        "bounty": field(text, "Bounty"),
        "votes": field(text, "Votes"),
    }
    haystack = f"{meta['title']} {summary}"
    meta["classes"] = [name for name, rx in COMPILED if rx.search(haystack)]
    if not meta["classes"]:
        meta["classes"] = ["Uncategorised"]
    meta["_sort"] = (int(meta["votes"]) if meta["votes"].isdigit() else 0, int(rid) if rid.isdigit() else 0)
    return meta


def main() -> int:
    reports = [r for r in (parse(p) for p in sorted(glob.glob(os.path.join(REPORTS, "*.md")))) if r]
    if not reports:
        print(f"no reports found in {REPORTS}")
        return 1

    grouped: dict[str, list[dict]] = defaultdict(list)
    for rep in reports:
        for cls in rep["classes"]:
            grouped[cls].append(rep)
    for items in grouped.values():
        items.sort(key=lambda r: r["_sort"], reverse=True)

    order = sorted(grouped, key=lambda c: (c == "Uncategorised", -len(grouped[c]), c))

    lines = [
        "# Disclosed reports by class",
        "",
        f"{len(reports)} public HackerOne reports, grouped by vulnerability class.",
        "A report can appear under more than one class. Regenerate with:",
        "",
        "    python3 scripts/build-intel-index.py",
        "",
        "Each entry links to the report on HackerOne and to the saved local file",
        "(which has a Learning Notes section to fill in while reading).",
        "",
        "## Counts",
        "",
        "| Class | Reports |",
        "|---|---|",
    ]
    for cls in order:
        lines.append(f"| [{cls}](#{cls.lower().replace(' ', '-').replace('/', '').replace(',', '')}) | {len(grouped[cls])} |")

    for cls in order:
        lines += ["", f"## {cls}", ""]
        for rep in grouped[cls]:
            extra = " · ".join(x for x in (rep["program"], rep["severity"], f"{rep['votes']} votes") if x and x != "—")
            local = f"`{rep['id']}`"
            lines.append(f"- [{rep['title']}]({rep['url']}) — {extra} · {local}")
    lines.append("")

    open(OUT, "w", encoding="utf-8").write("\n".join(lines))
    print(f"wrote {OUT}: {len(reports)} reports across {len(order)} classes")
    for cls in order:
        print(f"  {cls}: {len(grouped[cls])}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
