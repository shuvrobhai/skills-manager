#!/bin/bash
# merge-jsonc.sh — Safely merge new fields into an existing opencode.jsonc
# Usage: bash scripts/merge-jsonc.sh <target-file> <key-path> <json-value>
#
# Examples:
#   bash scripts/merge-jsonc.sh opencode.jsonc 'model' '"anthropic/claude-sonnet-4-20250514"'
#   bash scripts/merge-jsonc.sh opencode.jsonc 'permission.bash' '"ask"'
#   bash scripts/merge-jsonc.sh opencode.jsonc 'watcher.ignore' '["node_modules",".git"]'

TARGET_FILE="$1"
KEY_PATH="$2"
NEW_VALUE="$3"

if [ -z "$TARGET_FILE" ] || [ -z "$KEY_PATH" ] || [ -z "$NEW_VALUE" ]; then
  echo "Usage: $0 <target-file> <key-path> <json-value>"
  echo "  key-path uses dot notation: 'permission.bash' or 'watcher.ignore'"
  exit 1
fi

if [ ! -f "$TARGET_FILE" ]; then
  echo "{" > "$TARGET_FILE"
  echo '  "$schema": "https://opencode.ai/config.json"' >> "$TARGET_FILE"
  echo "}" >> "$TARGET_FILE"
fi

python3 -c "
import json, sys

filepath = '$TARGET_FILE'
key_path = '$KEY_PATH'.split('.')
new_value = json.loads('$NEW_VALUE')

with open(filepath, 'r') as f:
    content = f.read()

try:
    config = json.loads(content)
except json.JSONDecodeError:
    lines = content.split('\n')
    cleaned = []
    for line in lines:
        if '//' in line:
            line = line[:line.index('//')]
        cleaned.append(line)
    config = json.loads('\n'.join(cleaned))

obj = config
for key in key_path[:-1]:
    if key not in obj or not isinstance(obj[key], dict):
        obj[key] = {}
    obj = obj[key]

obj[key_path[-1]] = new_value

with open(filepath, 'w') as f:
    json.dump(config, f, indent=2)
    f.write('\n')

print(f'✓ Updated {key_path[-1]} in {filepath}')
" 2>&1 || echo "✗ Failed to update $TARGET_FILE"
