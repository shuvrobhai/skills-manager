# Templates

## AGENTS.md

```markdown
# Skills Monorepo

Single source of truth for all agent skills on this machine.
Other directories (e.g. `~/.agents/skills/`) symlink into here — never copy skills out.

## Directory structure

```
skills-monorepo/
├── skills/              # Source of truth — edit skills here
│   ├── <skill-name>/    # Upstream or ported skills
│   └── _custom/         # Locally authored skills (not from upstream)
├── INDEX.json           # Auto-generated registry — run `make index` to refresh
├── INDEX.md             # Human-readable version of the same
├── SOURCES.md           # Provenance: where each skill came from
├── Makefile             # Dev commands
├── scripts/             # Helper scripts
│   ├── gen-index.sh     # Scans skills/ → INDEX.json + INDEX.md
│   ├── link-to.sh       # Creates symlink farm at target directory
│   └── scaffold.sh      # Creates new skill skeleton in _custom/
└── workspace/           # Dev scratch space (not synced anywhere)
```

## Managing skills

### Add a new skill (from upstream)
1. Copy the skill files into `skills/<name>/`
2. Update `SOURCES.md` with provenance info
3. Run `make index` to update the registry
4. Run `make link-to DIR=<consumer-path>` to refresh symlinks

### Add a custom skill
Same as above but put it in `skills/_custom/<name>/`.

### Remove a skill
1. Delete `skills/<name>/`
2. Run `make index`
3. Run `make link-to DIR=<consumer-path>`

### Update an existing skill
1. Update files in `skills/<name>/`
2. Update `SOURCES.md` if version/date changed
3. Run `make index`
4. Run `make link-to DIR=<consumer-path>`

## Symlinks

Consumers are directories whose contents are entirely symlinked from here.
Current consumers:
- `~/.agents/skills/` — all skills

After any change to `skills/`, run:
```
make link-to DIR=~/.agents/skills
```

This replaces the target directory with fresh symlinks pointing into the monorepo.

## INDEX.json format

Generated from each `skills/*/SKILL.md` frontmatter. Each entry:
```json
{
  "name": "<from frontmatter>",
  "description": "<from frontmatter>",
  "source": "upstream" | "custom",
  "path": "skills/<name>"
}
```

Never edit INDEX.json by hand — always use `make index`.

## Workspace

`workspace/` is for skill-creator iteration cycles (eval directories, iteration-1/, etc.).
It is NOT part of the source of truth. Nothing symlinks into it.
Safe to delete contents when cleaning up.
```

## Makefile

```makefile
SHELL := /bin/bash
DIR ?= $(HOME)/.agents/skills
NAME ?= new-skill

.PHONY: index link-to scaffold

index:
	@scripts/gen-index.sh

link-to:
	@scripts/link-to.sh "$(DIR)"

scaffold:
	@scripts/scaffold.sh "$(NAME)"
```

## SOURCES.md

```markdown
# Skill Sources

Provenance tracking for every skill in this monorepo.

| Skill | Source | URL | Notes |
|-------|--------|-----|-------|
| <name> | <org>/<repo> | <url> | |

---

**How to update:** When pulling a new version from upstream, add a row noting the date and commit:
`| skill-name | org/repo | url | Updated: YYYY-MM-DD (abc1234) |`
```
