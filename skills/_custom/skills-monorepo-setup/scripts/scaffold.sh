#!/bin/bash
# scaffold.sh — Create a new custom skill skeleton in skills/_custom/
# Usage: make scaffold NAME=my-skill
#        scripts/scaffold.sh my-skill

set -euo pipefail
MONOREPO="$(cd "$(dirname "$0")/.." && pwd)"
NAME="${1:?Usage: scaffold.sh <skill-name>}"
TARGET="$MONOREPO/skills/_custom/$NAME"

if [ -d "$TARGET" ]; then
  echo "Error: $TARGET already exists" >&2
  exit 1
fi

mkdir -p "$TARGET"

cat > "$TARGET/SKILL.md" <<EOF
---
name: $NAME
description: TODO: Describe what this skill does. Use when [trigger context].
---

# $NAME

TODO: Skill instructions here.
EOF

echo "Created $TARGET/SKILL.md"
echo "Next steps:"
echo "  1. Edit $TARGET/SKILL.md"
echo "  2. Run 'make index' to register it"
echo "  3. Run 'make link-to' to expose it to consumers"
