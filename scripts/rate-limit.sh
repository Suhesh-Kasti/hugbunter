#!/usr/bin/env bash
# rate-limit.sh — shared request throttle for the replay path.
#
# A token bucket that every process shares (agents, replay.sh, my own shell), so
# the 5 requests/second rule in AGENTS.md cannot be silently exceeded, no matter
# who sends the request.
#
# Usage:
#   scripts/rate-limit.sh acquire [n]     block until n slots are free (default 1)
#   scripts/rate-limit.sh status          current usage in the window
#   scripts/rate-limit.sh reset           clear the bucket
#
# Options (before the command):
#   --rate N      requests per second        (default: $RATE_LIMIT or 5)
#   --window S    window length in seconds   (default: 1)
#
# Env:
#   RATE_LIMIT          default rate
#   BUGHUNT_STATE_DIR   bucket location (default: ${XDG_CACHE_HOME:-~/.cache}/bughunt)
#
# Exit codes: 0 ok, 1 usage, 2 python3 missing.
#
# Called automatically by scripts/replay.sh. Any path that sends through Burp or
# Arson must call `acquire` immediately before the send.

set -euo pipefail

command -v python3 >/dev/null 2>&1 || { echo "rate-limit: python3 is required" >&2; exit 2; }

exec python3 - "$@" <<'PY'
import fcntl
import os
import sys
import time
from collections import deque

DEFAULT_RATE = float(os.environ.get("RATE_LIMIT", "5"))
STATE_DIR = os.environ.get(
    "BUGHUNT_STATE_DIR",
    os.path.join(os.environ.get("XDG_CACHE_HOME", os.path.expanduser("~/.cache")), "bughunt"),
)


def parse(argv):
    rate, window, rest = DEFAULT_RATE, 1.0, []
    i = 0
    while i < len(argv):
        if argv[i] == "--rate":
            rate = float(argv[i + 1]); i += 2
        elif argv[i] == "--window":
            window = float(argv[i + 1]); i += 2
        else:
            rest.append(argv[i]); i += 1
    return rate, window, rest


def main():
    rate, window, rest = parse(sys.argv[1:])
    command = rest[0] if rest else "status"
    count = int(rest[1]) if len(rest) > 1 else 1

    if rate <= 0 or window <= 0:
        print("rate-limit: --rate and --window must be positive", file=sys.stderr)
        return 1

    os.makedirs(STATE_DIR, exist_ok=True)
    stamps_path = os.path.join(STATE_DIR, "ratelimit.stamps")
    lock_path = os.path.join(STATE_DIR, "ratelimit.lock")
    log_path = os.path.join(STATE_DIR, "ratelimit.log")

    lock = open(lock_path, "a+")
    fcntl.flock(lock, fcntl.LOCK_EX)

    def read_stamps():
        try:
            with open(stamps_path) as fh:
                return [float(x) for x in fh.read().split()]
        except (OSError, ValueError):
            return []

    def write_stamps(items):
        with open(stamps_path, "w") as fh:
            fh.write(" ".join(f"{t:.6f}" for t in items))

    if command == "reset":
        write_stamps([])
        print("rate-limit: bucket cleared")
        return 0

    if command == "status":
        now = time.time()
        recent = sorted(t for t in read_stamps() if t > now - window)
        print(f"rate       : {rate:g} req/s (window {window:g}s)")
        print(f"state dir  : {STATE_DIR}")
        print(f"in window  : {len(recent)} / {rate:g}")
        print(f"headroom   : {max(0, int(rate) - len(recent))} request(s) before a wait")
        if os.path.exists(log_path):
            with open(log_path) as fh:
                tail = fh.read().splitlines()[-5:]
            if tail:
                print("recent     :")
                for line in tail:
                    print(f"  {line}")
        return 0

    if command != "acquire":
        print(f"rate-limit: unknown command {command!r} (acquire|status|reset)", file=sys.stderr)
        return 1

    if count < 1:
        print("rate-limit: acquire count must be >= 1", file=sys.stderr)
        return 1
    if count > rate:
        print(f"rate-limit: cannot acquire {count} at {rate:g} req/s (exceeds the whole budget)",
              file=sys.stderr)
        return 1

    waited = 0.0
    for _ in range(1000):
        now = time.time()
        stamps = [t for t in read_stamps() if t > now - window]
        if len(stamps) + count <= rate:
            stamps.extend([now] * count)
            write_stamps(stamps)
            with open(log_path, "a") as fh:
                fh.write(f"{time.strftime('%Y-%m-%dT%H:%M:%S', time.localtime(now))} "
                         f"acquire {count} (waited {waited:.2f}s)\n")
            if waited > 0:
                print(f"rate-limit: acquired {count} after waiting {waited:.2f}s")
            return 0
        # Wait until the oldest stamps fall out of the window. The +EPS margin
        # keeps two batches from landing inside one window when a server counts
        # inclusively at the boundary.
        need = len(stamps) + count - int(rate)
        wait_until = sorted(stamps)[max(0, need - 1)] + window + 0.05
        delay = max(0.01, wait_until - now)
        time.sleep(delay)
        waited += delay

    print("rate-limit: gave up waiting", file=sys.stderr)
    return 1


sys.exit(main())
PY
