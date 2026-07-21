# Config File Locations

## Global Config

| File | Purpose |
|------|---------|
| `~/.config/opencode/opencode.jsonc` | Global opencode settings — applies to all projects |
| `~/.config/opencode/tui.json` | TUI plugin registrations |
| `~/.config/opencode/themes/` | Custom theme files (`.json`) |

## Per-Project Config

| File | Purpose |
|------|---------|
| `./opencode.jsonc` | Project-level settings — merges with global |
| `./AGENTS.md` | Agent instructions specific to this project |
| `./CLAUDE.md` | Alternative name for agent instructions |
| `./CONTEXT.md` | Domain model / project context documentation |
| `.agents/skills/` | Project-specific skills (overrides global) |

## Merge Behavior

opencode merges global + per-project config. Per-project values override global.
Arrays (like `plugin`, `skills.paths`) are concatenated, not replaced.

## Config Resolution Order

1. Global: `~/.config/opencode/opencode.jsonc`
2. Project: `./opencode.jsonc` (overrides global)
3. CLI flags (overrides both)
