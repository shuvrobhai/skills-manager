#!/bin/bash
# resolve-config.sh — Substitute ${VAR} placeholders in config.json
# Uses values from .env (if present) or the current environment.
#
# Usage:
#   scripts/resolve-config.sh              # print resolved config to stdout
#   scripts/resolve-config.sh --in-place   # overwrite config.json in place
#   scripts/resolve-config.sh --validate   # exit 1 if any placeholder remains unresolved

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
CONFIG="$ROOT/config.json"
ENV_FILE="$ROOT/.env"

# Load .env if present (set -a auto-exports for child processes)
if [ -f "$ENV_FILE" ]; then
  set -a
  . "$ENV_FILE"
  set +a
fi

resolve() {
  python3 - "$CONFIG" << 'PYEOF'
import json, os, re, sys

config_path = sys.argv[1]
with open(config_path) as f:
    content = f.read()

def replace(m):
    var = m.group(1)
    val = os.environ.get(var)
    if val is not None:
        return val
    return m.group(0)  # leave unresolved

resolved = re.sub(r'\$\{([^}]+)\}', replace, content)

try:
    json.loads(resolved)
except json.JSONDecodeError as e:
    print(f'error: resolved config is not valid JSON — {e}', file=sys.stderr)
    sys.exit(1)

print(resolved, end='')
PYEOF
}

case "${1:-}" in
  --in-place)
    resolve > "$CONFIG.tmp" && mv "$CONFIG.tmp" "$CONFIG"
    echo "ok — config.json resolved in place"
    ;;
  --validate)
    output=$(resolve 2>&1)
    if echo "$output" | grep -q '\${'; then
      unresolved=$(echo "$output" | grep -o '\${[^}]*}' | sort -u)
      echo "error: unresolved placeholders:" >&2
      echo "$unresolved" >&2
      exit 1
    fi
    echo "ok — all placeholders resolved"
    ;;
  *)
    resolve
    ;;
esac
