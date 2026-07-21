#!/bin/bash
# resolve-config.sh — Substitute ${VAR} placeholders in config.json
# Uses values from .env (if present) or the current environment.
#
# Usage:
#   scripts/resolve-config.sh              # print resolved config to stdout
#   scripts/resolve-config.sh --in-place   # overwrite config.json in place
#   scripts/resolve-config.sh --validate   # exit 1 if any placeholder remains unresolved

set -euo pipefail

source "$(dirname "$0")/lib/common.sh"
resolve_root

case "${1:-}" in
  --in-place)
    resolve_config > "$CONFIG.tmp" && mv "$CONFIG.tmp" "$CONFIG"
    echo "ok — config.json resolved in place"
    ;;
  --validate)
    output=$(resolve_config 2>&1)
    if echo "$output" | grep -q '\${'; then
      unresolved=$(echo "$output" | grep -o '\${[^}]*}' | sort -u)
      echo "error: unresolved placeholders:" >&2
      echo "$unresolved" >&2
      exit 1
    fi
    echo "ok — all placeholders resolved"
    ;;
  *)
    resolve_config
    ;;
esac
