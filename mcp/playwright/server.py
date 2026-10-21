#!/usr/bin/env python3
"""Minimal Playwright MCP server for the BugHunt workspace.

Why a small custom server instead of a third-party one:
  * console + dialog capture — proves JavaScript actually executed (alert/confirm),
    which is what turns "reflected payload" into a valid XSS PoC;
  * a network log — confirms out-of-band callbacks and client-side requests;
  * a small, fixed tool surface keeps the prompt-cache prefix stable.

Stdio transport. Started by scripts/playwright-mcp.sh; do not run by hand.
"""
from __future__ import annotations

import asyncio
import json
import os
from typing import Any

from mcp.server.fastmcp import FastMCP

mcp = FastMCP("playwright")

MAX_TEXT = 20000

_state: dict[str, Any] = {
    "pw": None,
    "browser": None,
    "context": None,
    "page": None,
    "console": [],
    "dialogs": [],
    "network": [],
    "headers": {},
}


def _trim(s: str, limit: int = MAX_TEXT) -> str:
    if s is None:
        return ""
    return s if len(s) <= limit else s[:limit] + f"\n... [truncated {len(s) - limit} chars]"


def _on_dialog(dialog) -> None:
    _state["dialogs"].append(
        {"type": dialog.type, "message": dialog.message, "default_value": dialog.default_value}
    )
    asyncio.ensure_future(dialog.dismiss())


async def _ensure_page():
    if _state["page"] is not None:
        return _state["page"]

    from playwright.async_api import async_playwright

    _state["pw"] = await async_playwright().start()
    try:
        _state["browser"] = await _state["pw"].chromium.launch(headless=True)
    except Exception as exc:  # noqa: BLE001
        raise RuntimeError(
            "Chromium could not launch. Run: cd mcp/playwright && uv run playwright install chromium "
            "(and, if system libraries are missing, `sudo uv run playwright install-deps chromium`). "
            f"Original error: {exc}"
        ) from exc

    context = await _state["browser"].new_context(ignore_https_errors=True)
    if _state["headers"]:
        await context.set_extra_http_headers(_state["headers"])

    page = await context.new_page()
    page.on("console", lambda m: _state["console"].append({"type": m.type, "text": m.text}))
    page.on("dialog", _on_dialog)
    page.on(
        "request",
        lambda r: _state["network"].append(
            {"dir": "request", "method": r.method, "url": r.url, "resource": r.resource_type}
        ),
    )
    page.on(
        "response",
        lambda r: _state["network"].append(
            {"dir": "response", "status": r.status, "url": r.url}
        ),
    )

    _state["context"] = context
    _state["page"] = page
    return page


@mcp.tool()
async def browser_navigate(url: str, wait_until: str = "domcontentloaded") -> str:
    """Open a URL in a headless Chromium and return status, final URL and title.
    wait_until: load | domcontentloaded | networkidle | commit.
    Use this to load a target page or a crafted URL carrying an XSS payload."""
    page = await _ensure_page()
    resp = await page.goto(url, wait_until=wait_until, timeout=45000)
    title = await page.title()
    status = resp.status if resp is not None else "no-response"
    return f"status={status}\nfinal_url={page.url}\ntitle={title}"


@mcp.tool()
async def browser_snapshot(max_chars: int = 8000) -> str:
    """Return the visible text of the current page (body innerText), trimmed.
    Use this to read what a page renders without pulling raw HTML."""
    page = await _ensure_page()
    body = await page.evaluate("() => (document.body ? document.body.innerText : '')")
    return _trim(body or "", max_chars)


@mcp.tool()
async def browser_get_html(selector: str = "", max_chars: int = 20000) -> str:
    """Return the page HTML, optionally only the first match of a CSS selector.
    Use this to inspect reflection context (escaped vs raw angle brackets)."""
    page = await _ensure_page()
    if selector:
        el = await page.query_selector(selector)
        if el is None:
            return f"no element matches selector: {selector}"
        html = await el.inner_html()
    else:
        html = await page.content()
    return _trim(html, max_chars)


@mcp.tool()
async def browser_evaluate(expression: str) -> str:
    """Evaluate a JavaScript expression in the page and return its value as text.
    Use for proof work: document.domain, reading localStorage, or payload probes."""
    page = await _ensure_page()
    value = await page.evaluate(expression)
    try:
        return json.dumps(value, default=str)[:MAX_TEXT]
    except Exception:  # noqa: BLE001
        return _trim(str(value))


@mcp.tool()
async def browser_click(selector: str, timeout_ms: int = 5000) -> str:
    """Click the first element matching a CSS selector. Use for DOM XSS triggers."""
    page = await _ensure_page()
    await page.click(selector, timeout=timeout_ms)
    return f"clicked: {selector}"


@mcp.tool()
async def browser_fill(selector: str, value: str) -> str:
    """Fill an input matching a CSS selector with a value. Use for form/reflection tests."""
    page = await _ensure_page()
    await page.fill(selector, value)
    return f"filled: {selector}"


@mcp.tool()
async def browser_set_headers(headers: dict[str, str]) -> str:
    """Set extra HTTP headers (e.g. Authorization, Cookie) and reset the page.
    Use this to test an authenticated surface. Merges into the current set."""
    _state["headers"].update(headers or {})
    if _state["context"] is not None:
        await _state["context"].set_extra_http_headers(_state["headers"])
    return f"headers now: {sorted(_state['headers'])}"


@mcp.tool()
async def browser_get_cookies() -> str:
    """Return the browser context cookies as JSON (name, domain, path). Values are included."""
    if _state["context"] is None:
        return "[]"
    cookies = await _state["context"].cookies()
    return json.dumps(
        [{"name": c["name"], "domain": c["domain"], "path": c["path"], "value": c.get("value")} for c in cookies],
        default=str,
    )[:MAX_TEXT]


@mcp.tool()
async def browser_console(clear: bool = True) -> str:
    """Return captured console messages AND dialogs (alert/confirm/prompt), then clear them.
    A dialog entry is direct proof that injected JavaScript executed — check this
    after XSS payloads. clear=false keeps the buffer."""
    out = {"dialogs": list(_state["dialogs"]), "console": list(_state["console"])}
    if clear:
        _state["dialogs"].clear()
        _state["console"].clear()
    return json.dumps(out, default=str)[:MAX_TEXT]


@mcp.tool()
async def browser_network(clear: bool = True) -> str:
    """Return captured request/response entries (method, url, status), then clear them.
    Use it to confirm client-side calls and out-of-band callbacks."""
    out = list(_state["network"])
    if clear:
        _state["network"].clear()
    return json.dumps(out, default=str)[:MAX_TEXT]


@mcp.tool()
async def browser_close() -> str:
    """Close the browser and reset all state. Use when finished with a page."""
    try:
        if _state["browser"] is not None:
            await _state["browser"].close()
        if _state["pw"] is not None:
            await _state["pw"].stop()
    finally:
        for key in ("pw", "browser", "context", "page"):
            _state[key] = None
        _state["console"].clear()
        _state["dialogs"].clear()
        _state["network"].clear()
    return "closed"


if __name__ == "__main__":
    mcp.run()
