# common.sh — Shared boilerplate for skills-manager scripts
#
# Usage:
#   source "$(dirname "$0")/lib/common.sh"
#   resolve_config  # prints resolved JSON to stdout, or exits 1 on failure
#
# Provides: resolve_config, load_env, resolve_root

set -euo pipefail

resolve_root() {
  if [ -z "${ROOT:-}" ]; then
    ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
  fi
  CONFIG="${ROOT}/config.json"
  SKILLS_DIR="${ROOT}/skills"
  ENV_FILE="${ROOT}/.env"
  export ROOT CONFIG SKILLS_DIR ENV_FILE
}

load_env() {
  if [ -f "$ENV_FILE" ]; then
    set -a
    . "$ENV_FILE"
    set +a
  fi
}

_resolve_json() {
  python3 - "$CONFIG" << 'PYEOF'
import json, os, re, sys

config_path = sys.argv[1]
with open(config_path) as f:
    content = f.read()

def replace(m):
    var = m.group(1)
    val = os.environ.get(var)
    return val if val is not None else m.group(0)

resolved = re.sub(r'\$\{([^}]+)\}', replace, content)

try:
    json.loads(resolved)
except json.JSONDecodeError as e:
    print(f'error: resolved config is not valid JSON — {e}', file=sys.stderr)
    sys.exit(1)

print(resolved, end='')
PYEOF
}

resolve_config() {
  resolve_root
  load_env
  _resolve_json
}
