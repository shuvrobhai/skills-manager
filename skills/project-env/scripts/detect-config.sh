#!/bin/bash
# detect-config.sh — Scan current project and global dir for existing opencode config
# Usage: bash scripts/detect-config.sh [project-directory]

PROJECT_DIR="${1:-$(pwd)}"
GLOBAL_DIR="$HOME/.config/opencode"

echo "{"
echo "  \"project_dir\": \"$PROJECT_DIR\","
echo "  \"global_dir\": \"$GLOBAL_DIR\","
echo "  \"files\": {"

FIRST=true
for file in "$GLOBAL_DIR/opencode.jsonc" "$GLOBAL_DIR/tui.json"; do
  if [ -f "$file" ]; then
    $FIRST || echo ","
    FIRST=false
    SIZE=$(wc -c < "$file" | tr -d ' ')
    echo -n "    \"$file\": { \"exists\": true, \"size\": $SIZE }"
  fi
done

for file in "$PROJECT_DIR/opencode.jsonc" "$PROJECT_DIR/AGENTS.md" \
            "$PROJECT_DIR/CLAUDE.md" "$PROJECT_DIR/CONTEXT.md"; do
  if [ -f "$file" ]; then
    $FIRST || echo ","
    FIRST=false
    SIZE=$(wc -c < "$file" | tr -d ' ')
    echo -n "    \"$file\": { \"exists\": true, \"size\": $SIZE }"
  fi
done

if [ -d "$PROJECT_DIR/.agents/skills" ]; then
  $FIRST || echo ","
  SKILL_COUNT=$(ls -1 "$PROJECT_DIR/.agents/skills" 2>/dev/null | wc -l | tr -d ' ')
  echo -n "    \"project_skills_dir\": { \"exists\": true, \"skill_count\": $SKILL_COUNT }"
fi

echo ""
echo "  }"
echo "}"
