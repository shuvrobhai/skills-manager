#!/bin/bash
# check-secrets.sh — Scan config.json for plaintext secrets that should be in .env
#
# Usage:
#   scripts/check-secrets.sh                # check for secrets in config.json
#   scripts/check-secrets.sh --verbose      # show matched values (masked)

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
CONFIG="$ROOT/config.json"
VERBOSE=false

[[ "${1:-}" == "--verbose" ]] && VERBOSE=true

if [ ! -f "$CONFIG" ]; then
  echo "ok — no config.json found"
  exit 0
fi

# Patterns that look like secrets
PATTERNS=(
  'gh[pousr]_[A-Za-z0-9_][A-Za-z0-9_]\{10,\}'
  'AIzaSy[A-Za-z0-9_-]\{10,\}'
  'sk-[A-Za-z0-9]\{10,\}'
  '[0-9a-f]\{8\}-[0-9a-f]\{4\}-[0-9a-f]\{4\}-[0-9a-f]\{4\}-[0-9a-f]\{12\}'
)

EXIT_CODE=0
MATCHES=0

for pattern in "${PATTERNS[@]}"; do
  while IFS= read -r line; do
    if [ -n "$line" ]; then
      MATCHES=$((MATCHES + 1))
      if [ "$VERBOSE" = true ]; then
        echo "warning: possible secret at $line"
      fi
      EXIT_CODE=1
    fi
  done < <(grep -n "$pattern" "$CONFIG" 2>/dev/null || true)
done

if [ "$EXIT_CODE" -eq 0 ]; then
  echo "ok — no plaintext secrets detected in config.json"
else
  echo "warning: $MATCHES potential secret(s) found in config.json"
  echo "  Run with --verbose to see locations."
  echo "  Move these values to .env and use \${VAR} placeholders in config.json."
fi

exit $EXIT_CODE
