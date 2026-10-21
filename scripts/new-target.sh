#!/usr/bin/env bash
# new-target.sh — scaffold targets/<name>/ from the template.
#
# Usage: ./scripts/new-target.sh <target-name>
#
# Creates the folder, copies the NOTES.md template and the evidence conventions.
# Fill in the Scope section of NOTES.md before doing anything else.

set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

name="${1:-}"
if [ -z "$name" ]; then
  echo "usage: $0 <target-name>" >&2
  exit 1
fi
case "$name" in
  */*|.*) echo "target name must not contain '/' or start with '.'" >&2; exit 1 ;;
esac

dest="$HERE/targets/$name"
if [ -e "$dest" ]; then
  echo "targets/$name already exists" >&2
  exit 1
fi

mkdir -p "$dest/evidence"
cp "$HERE/targets/_template/NOTES.md" "$dest/NOTES.md"
cp "$HERE/targets/_template/evidence/README.md" "$dest/evidence/README.md"
if [ -f "$HERE/templates/TARGET.md" ]; then
  cp "$HERE/templates/TARGET.md" "$dest/TARGET.md"
fi

echo "created targets/$name/"
echo "next: edit targets/$name/NOTES.md — scope, out-of-scope, and program rules"
echo "      (confirm automated testing and AI assistance are allowed before recon)"
echo "      or paste the program policy text into the chat and let /skill:hunt-onboarding fill it in"
