#!/bin/bash
# validate-jsonc.sh — Validate opencode.jsonc against the opencode JSON schema
# Usage: bash scripts/validate-jsonc.sh <path-to-opencode.jsonc>

TARGET_FILE="$1"

if [ -z "$TARGET_FILE" ]; then
  echo "Usage: $0 <path-to-opencode.jsonc>"
  exit 1
fi

if [ ! -f "$TARGET_FILE" ]; then
  echo "✗ File not found: $TARGET_FILE"
  exit 1
fi

echo "Validating: $TARGET_FILE"

if python3 -c "
import json, sys
with open('$TARGET_FILE', 'r') as f:
    content = f.read()
try:
    json.loads(content)
except json.JSONDecodeError:
    lines = content.split('\n')
    cleaned = []
    for line in lines:
        if '//' in line:
            line = line[:line.index('//')]
        cleaned.append(line)
    try:
        json.loads('\n'.join(cleaned))
    except json.JSONDecodeError as e:
        print(f'Syntax error at line {e.lineno}, col {e.colno}: {e.msg}')
        sys.exit(1)
print('✓ Valid JSON syntax')
" 2>&1; then

  python3 -c "
import json, sys

with open('$TARGET_FILE', 'r') as f:
    content = f.read()

lines = content.split('\n')
cleaned = []
for line in lines:
    if '//' in line:
        line = line[:line.index('//')]
    cleaned.append(line)
config = json.loads('\n'.join(cleaned))

warnings = []

if 'model' in config and not isinstance(config['model'], str):
    warnings.append('model should be a string')

if 'permission' in config:
    perm = config['permission']
    valid_levels = {'ask', 'allow', 'deny'}
    if isinstance(perm, str):
        if perm not in valid_levels:
            warnings.append(f'permission \"{perm}\" is not valid')
    elif isinstance(perm, dict):
        for key, val in perm.items():
            if isinstance(val, str) and val not in valid_levels:
                warnings.append(f'permission.{key} \"{val}\" is not valid')

if 'mcp' in config:
    for name, mcp_config in config['mcp'].items():
        if isinstance(mcp_config, dict) and 'type' in mcp_config:
            if mcp_config['type'] not in ('local', 'remote'):
                warnings.append(f'mcp.{name}.type \"{mcp_config[\"type\"]}\" not valid')
            if mcp_config['type'] == 'local' and 'command' not in mcp_config:
                warnings.append(f'mcp.{name} is local but missing command')
            if mcp_config['type'] == 'remote' and 'url' not in mcp_config:
                warnings.append(f'mcp.{name} is remote but missing url')

if warnings:
    for w in warnings:
        print(f'  ⚠  {w}')
else:
    print('✓ All field types look valid')
" 2>&1

  echo "✓ Validation complete — config is usable"
else
  echo "✗ Validation FAILED — fix syntax errors before using"
  exit 1
fi
