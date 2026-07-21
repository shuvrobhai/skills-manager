---
name: skills-monorepo-setup
description: >
  Consolidate scattered skill directories into a single source-of-truth
  monorepo with registry, dev workspace, and symlink consumers.
  Use when creating or reorganizing a skill hub,
  migrating from ~/.agents/skills/ (or similar ad-hoc layouts)
  to a centralized monorepo, or setting up the consumer symlink farm.
  Also use when the user asks about skill folder structure, skill registry,
  or how skills are managed on this machine.
---

# Skills Monorepo Setup

## Quick start

This skill sets up a **skills monorepo** — a single directory that is the source of truth for all agent skills on the machine.

Key concepts:
- **Monorepo** — `skills/` holds every skill as a subdirectory
- **Registry** — `INDEX.json` is auto-generated from SKILL.md frontmatter
- **Symlink hub** — Consumers (e.g. `~/.agents/skills/`) are symlink farms pointing into `skills/`
- **Workspace** — Dev scratch space for skill-creator iteration cycles

Typical location: `~/Developer/skills-monorepo/`

## Workflow

### 1. Create directory structure

```
skills-monorepo/
├── skills/
│   └── _custom/          # Locally authored skills
├── scripts/
├── workspace/
├── Makefile
├── SOURCES.md
└── AGENTS.md
```

### 2. Write AGENTS.md

Include rules for:
- Directory structure overview (so any agent can orient itself)
- How to add / remove / update skills
- Symlink consumers and how to refresh them
- INDEX.json format (auto-generated, never edit by hand)
- Workspace conventions

SHOW the complete AGENTS.md template from REFERENCE.md.

### 3. Write Makefile

SHOW the Makefile template from REFERENCE.md. Targets:
- `make index` — regenerate INDEX.json + INDEX.md from skills/ frontmatter
- `make link-to DIR=<path>` — create/replace symlink farm at target dir
- `make scaffold NAME=<name>` — create a new custom skill skeleton

### 4. Write scripts

Copy the bundled scripts into `scripts/`:
- `gen-index.sh` — Python-based YAML frontmatter parser (handles multiline, quoted, pipe-syntax descriptions)
- `link-to.sh` — Creates symlinks; handles tilde expansion for make compatibility
- `scaffold.sh` — Creates `skills/_custom/<name>/` with SKILL.md template

### 5. Write SOURCES.md

Track provenance: which upstream repo each skill came from, with URL and last-updated note.

SHOW the SOURCES.md template from REFERENCE.md.

### 6. Copy existing skills into skills/

From whatever ad-hoc directory they currently live in (e.g. `~/.agents/skills/`).

```bash
for skill in <source-dir>/*/; do
  name="$(basename "$skill")"
  cp -R "$(dirname "$skill")/$name" skills/
done
```

Note: use `$(dirname "$skill")/$name` to avoid trailing-slash issues that cause `cp` to flatten contents.

### 7. Run make index

Generates INDEX.json + INDEX.md. This scans every `skills/*/SKILL.md` and parses its YAML frontmatter.

### 8. Back up original + symlink

```bash
mv <source-dir> <source-dir>.bak
make link-to DIR=<source-dir>
```

Note: `link-to.sh` creates **two types of symlinks** for custom skills:
- `_custom/<name>/` → monorepo `skills/_custom/<name>/` (nested, for nest-aware tools)
- `<name>/` → monorepo `skills/_custom/<name>/` (flat, for tools like opencode that expect skills one level deep)

This dual-link ensures custom skills are discoverable regardless of the consumer's discovery strategy.

## Undoing the symlink farm

If you need to break the symlink farm and restore real copies:

1. Copy resolved files back:
   ```bash
   cp -RL ~/Developer/skills-monorepo/skills/* <target>/
   ```
   (The `-L` flag follows symlinks and copies the actual files.)

2. Remove the symlink farm:
   ```bash
   rm <symlink-dir>
   ```

3. Restore from backup (if available):
   ```bash
   mv <backup-dir> <original-dir>
   ```

## Communication rule

When presenting choices to the user, always lead with your recommendation and a one-line reason before asking questions.

**Example:**
> "I recommend using `_custom/` because it clearly separates authored skills from upstream — do you agree?"
> (followed by alternative if needed)

## Keeping this skill current

When the monorepo workflow, templates, or scripts change:

1. **Scripts:** Re-copy from the monorepo `scripts/` dir into this skill's `scripts/` dir
2. **Templates:** Regenerate REFERENCE.md by copying current AGENTS.md, Makefile, and SOURCES.md
3. **SKILL.md:** Update manually if workflow steps changed

No automation is bundled for this — update explicitly when the monorepo evolves.

## Bundled scripts

See `scripts/` in this skill directory:
- `gen-index.sh` — generates INDEX.json + INDEX.md from YAML frontmatter
- `link-to.sh` — creates symlink farm, handles tilde expansion
- `scaffold.sh` — creates `skills/_custom/<name>/` skeleton
