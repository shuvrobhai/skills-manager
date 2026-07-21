#!/bin/bash
# link-to.sh — Replace target directory with symlinks into the monorepo
# Usage: make link-to DIR=~/.agents/skills
#        scripts/link-to.sh ~/.agents/skills

set -euo pipefail
MONOREPO="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="${1:?Usage: link-to.sh <target-dir>}"
# Expand leading tilde (handles make + zsh quoting edge-case)
TARGET="${TARGET/#\~/$HOME}"
TARGET="$(cd "$(dirname "$TARGET")" 2>/dev/null && pwd)/$(basename "$TARGET")"

if [ "$TARGET" = "$MONOREPO" ]; then
  echo "Error: target cannot be the monorepo itself" >&2
  exit 1
fi

if [ ! -d "$MONOREPO/skills" ]; then
  echo "Error: $MONOREPO/skills not found" >&2
  exit 1
fi

# Remove target if it exists (will recreate)
if [ -e "$TARGET" ]; then
  echo "Removing existing $TARGET ..."
  rm -rf "$TARGET"
fi

mkdir -p "$TARGET"

count=0
for skilldir in "$MONOREPO/skills"/*/; do
  [ -d "$skilldir" ] || continue
  skillname="$(basename "$skilldir")"
  ln -sf "$skilldir" "$TARGET/$skillname"
  count=$((count + 1))
done

echo "Symlinked $count skills into $TARGET"
