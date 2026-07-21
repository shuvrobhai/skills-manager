#!/bin/bash
# sync-skills.sh — Sync skills from central repo to enabled AI agent tools
#
# Usage:
#   scripts/sync-skills.sh                  # sync all enabled tools
#   scripts/sync-skills.sh --dry-run        # preview only
#   scripts/sync-skills.sh --tool claude-code  # sync a single tool
#   scripts/sync-skills.sh --exclude apple  # exclude skills matching name pattern

set -euo pipefail

source "$(dirname "$0")/lib/common.sh"
resolve_root
load_env

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

export DRY_RUN TARGET_TOOL EXCLUDE_PATTERNS

resolve_config | python3 -c '
import json, os, subprocess, sys

SKILLS_DIR = os.environ["SKILLS_DIR"]
DRY_RUN = os.environ.get("DRY_RUN", "false").lower() == "true"
TARGET_TOOL = os.environ.get("TARGET_TOOL") or None
EXCLUDE_PATTERNS = [p.lower() for p in os.environ.get("EXCLUDE_PATTERNS", "").split()] if os.environ.get("EXCLUDE_PATTERNS") else []

cfg = json.load(sys.stdin)

# 1. Find all unique real skill directories
real_dirs = {}
collisions = []
for root, dirs, files in os.walk(SKILLS_DIR):
    if "SKILL.md" in files:
        real = os.path.realpath(root)
        name = os.path.basename(real)
        if name in real_dirs:
            collisions.append((name, real_dirs[name], real))
        real_dirs[name] = real

skill_names = sorted(real_dirs.keys())
for p in EXCLUDE_PATTERNS:
    skill_names = [n for n in skill_names if p not in n.lower()]

print(f"--- Scanning skills ---")
print(f"  Found {len(real_dirs)} unique skills")
if EXCLUDE_PATTERNS:
    print(f"  After exclusions: {len(skill_names)} skills")
if collisions:
    print(f"  WARNING: {len(collisions)} basename collision(s) detected:")
    for name, first, second in collisions:
        print(f"    {name}:")
        print(f"      1st: {first}")
        print(f"      2nd: {second} (overwrites 1st)")
print()

# 2. Get enabled tools
tools = []
for t in cfg.get("tools", []):
    if t.get("enabled"):
        path = os.path.expanduser(t["path"]) + "/skills"
        tools.append((t["name"], path))

if TARGET_TOOL:
    tools = [(n, p) for n, p in tools if n == TARGET_TOOL]
    if not tools:
        print(f"error: no enabled tool named {TARGET_TOOL}")
        sys.exit(1)

print(f"--- Enabled tools ({len(tools)}) ---")
for name, path in tools:
    print(f"  {name} \u2192 {path}")
print()

# 3. Sync
for tool_name, tool_path in tools:
    print(f"--- {tool_name} \u2192 {tool_path} ---")
    if not os.path.isdir(tool_path):
        print(f"  Creating {tool_path}")
        if not DRY_RUN:
            os.makedirs(tool_path, exist_ok=True)

    # Remove symlinks in destination that conflict with source directories
    # (rsync cannot replace a symlink with a directory)
    removed = 0
    if not DRY_RUN and os.path.isdir(tool_path):
        for name in skill_names:
            dest = os.path.join(tool_path, name)
            if os.path.islink(dest):
                os.remove(dest)
                removed += 1
        if removed:
            print(f"  Removed {removed} conflicting symlinks")

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
'
