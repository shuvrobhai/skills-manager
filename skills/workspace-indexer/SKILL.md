---
name: workspace-indexer
description: Maintains and updates INDEX.md files in the developer workspace. Use when creating, moving, renaming directories, graduating projects, or checking/auditing index sync.
---

# Workspace Indexer

Helper to keep workspace indices in sync.

## Summary

- Auto-heals hierarchical indexes (`INDEX.md`) across directory boundaries.
- Scans `~/Developer/` filesystem vs. INDEX entries, auto-fixes missing entries, reports stale entries.
- Adheres to Index Ownership & Self-Healing Guide in `~/Developer/AGENTS.md`.

## Workflow

1. **Scan** — Walk filesystem under `~/Developer/`, collect non-hidden subdirectories. Compare against entries in local INDEX.md files and parent `~/Developer/INDEX.md`.

2. **Auto-fix** — Silently add any directory that exists on disk but is missing from its local INDEX (and parent INDEX if top-level). Use canonical format.

3. **Report** — Show INDEX entries whose directories no longer exist on disk. Ask before deleting. Show top-level dirs missing a local INDEX. Ask before creating.

4. **Update** — Apply all confirmed changes (additions done immediately, removals after approval).

5. **Verify** — Confirm all INDEX files are in sync and no mismatches remain.

## Graduation Flow

When user says "graduate X from playground/ to projects/" (or similar cross-category move):
- Move the directory to the new location
- Update source local INDEX (remove entry)
- Update destination local INDEX (add entry)
- Update `~/Developer/INDEX.md` parent entry if needed

## Scan Filter Rules

Only consider these for INDEX entries:
- **Named directories** that are not hidden (don't start with `.`)

Always ignore:
- Hidden directories (`.agents/`, `.claude/`, `.antigravitycli/`, `.git/`, etc.)
- All files (`.DS_Store`, `*.xml`, `*.json`, `*.md`)
- Meta/docs files (`README.md`, `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, `INDEX.md` itself)

## Canonical Format

```markdown
- `dir/` — Description of purpose.
```

## Non-Negotiable Rules

- **No Internal File Tracking**: Do not list sub-project internal files (e.g., source code, scripts) in parent or local indexes. Only document high-level sub-project boundaries and statuses.
- **Maintain Metadata**: Always preserve metadata block structure or key sections if present.
- **Preserve Clean Structure**: Ensure formatting is standardized.

## Reference Index

- **Indexing Conventions**: [references/indexing-rules.md](references/indexing-rules.md)
- **Validation Checklist**: [references/validation.md](references/validation.md)
