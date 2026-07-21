#!/bin/bash
# sync-skills.sh — Sync skills from central repo to enabled AI agent tools
#
# Usage:
#   scripts/sync-skills.sh                  # sync all enabled tools
#   scripts/sync-skills.sh --dry-run        # preview only
#   scripts/sync-skills.sh --tool claude-code  # sync a single tool
#   scripts/sync-skills.sh --exclude apple  # exclude skills matching name pattern

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
CONFIG="$ROOT/config.json"
SKILLS_DIR="$ROOT/skills"
DRY_RUN=false
TARGET_TOOL=""
EXCLUDE_PATTERNS=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY_RUN=true; shift ;;
    --tool) TARGET_TOOL="$2"; shift 2 ;;
    --exclude) EXCLUDE_PATTERNS+=("$2"); shift 2 ;;
    *) echo "usage: $0 [--dry-run] [--tool <name>] [--exclude <pattern>]"; exit 1 ;;
  esac
done

[ -f "$CONFIG" ] || { echo "error: config.json not found at $CONFIG"; exit 1; }

ENV_FILE="$ROOT/.env"
[ -f "$ENV_FILE" ] && { set -a; . "$ENV_FILE"; set +a; }

python3 <<PYEOF
import json, os, re, subprocess, sys

SKILLS_DIR = os.environ.get('SKILLS_DIR', '$SKILLS_DIR')
CONFIG = os.environ.get('CONFIG', '$CONFIG')
DRY_RUN = os.environ.get('DRY_RUN', '$DRY_RUN').lower() == 'true'
TARGET_TOOL = os.environ.get('TARGET_TOOL', '$TARGET_TOOL') or None
EXCLUDE_PATTERNS = [p.lower() for p in os.environ.get('EXCLUDE_PATTERNS', '').split()] if os.environ.get('EXCLUDE_PATTERNS') else []

# 1. Find all unique real skill directories
real_dirs = {}
for root, dirs, files in os.walk(SKILLS_DIR):
    if 'SKILL.md' in files:
        real = os.path.realpath(root)
        name = os.path.basename(real)
        real_dirs[name] = real

# Sort and filter
skill_names = sorted(real_dirs.keys())
for p in EXCLUDE_PATTERNS:
    skill_names = [n for n in skill_names if p not in n.lower()]

print(f"--- Scanning skills ---")
print(f"  Found {len(real_dirs)} unique skills")
if EXCLUDE_PATTERNS:
    print(f"  After exclusions: {len(skill_names)} skills")
print()

# 2. Load config and resolve env vars
with open(CONFIG) as f:
    content = f.read()

def replace_env(m):
    var = m.group(1)
    val = os.environ.get(var)
    return val if val is not None else m.group(0)

resolved = re.sub(r'\$\{([^}]+)\}', replace_env, content)
cfg = json.loads(resolved)

# 3. Get enabled tools
tools = []
for name, t in cfg.get('tools', {}).items():
    if t.get('enabled') and t.get('skills_path'):
        tools.append((name, os.path.expanduser(t['skills_path'])))

if TARGET_TOOL:
    tools = [(n, p) for n, p in tools if n == TARGET_TOOL]
    if not tools:
        print(f"error: no enabled tool named '{TARGET_TOOL}'")
        sys.exit(1)

print(f"--- Enabled tools ({len(tools)}) ---")
for name, path in tools:
    print(f"  {name} → {path}")
print()

# 4. Sync
for tool_name, tool_path in tools:
    print(f"--- {tool_name} → {tool_path} ---")
    if not os.path.isdir(tool_path):
        print(f"  Creating {tool_path}")
        if not DRY_RUN:
            os.makedirs(tool_path, exist_ok=True)

    synced = 0
    for name in skill_names:
        src = real_dirs[name]
        dest = os.path.join(tool_path, name)
        if DRY_RUN:
            print(f"  [dry-run] rsync -a --delete {src}/ {dest}/")
        else:
            subprocess.run(["rsync", "-a", "--delete", f"{src}/", f"{dest}/"],
                         check=True, capture_output=True)
        synced += 1

    if DRY_RUN:
        print(f"  [dry-run] Would sync {synced} skills")
    else:
        print(f"  Synced {synced} skills")

print()
print("--- Done ---")
PYEOF
