# .skills-manager

Central skill library + sync config for 20+ AI coding agents. This is a data/config repo, not a code project — no build system, no package.json.

## Repo layout

| Path | Purpose |
|------|---------|
| `config.json` | Master config (v2.1.0): tool paths, marketplace sources, preferences, auth |
| `skills/` | ~150 flat skill directories, each with `SKILL.md` + optional scripts/references/templates |
| `skills/_custom/` | Custom/local skills not from marketplace |
| `cache/` | Marketplace index cache (auto-generated JSON) |
| `docs/` | Architecture reviews and other documentation |
| `scripts/lib/` | Shared bash library (`common.sh`) used by all scripts |

## Skill directory convention

Every skill has `SKILL.md` with YAML frontmatter (`name`, `description`, optional `version`, `author`, `license`, `platforms`, `metadata/tags`).

Marketplace-installed skills also carry `meta.json` tracking origin/revision.

## Tools configured

`config.json.tools` is an array of `{name, path, enabled}` entries for 29 agents. `skills_path` is derived as `{path}/skills`; `config_path` is `{path}`. Enabled/disabled per-tool.

## Secrets warning

`config.json` contains plaintext API keys (`llm_provider.api_key`, `github_token`, `auth_session` tokens). This repo is **not** git-tracked — do not add it to git or expose its contents.

## Marketplace sources

- `ComposioHQ/awesome-claude-skills` (GitHub)
- `skills.sh` (web)

Cached in `cache/marketplace-skills.json` and `cache/marketplace-skill-descriptions.json`.

## Scripts

| Script | Purpose |
|--------|---------|
| `scripts/resolve-config.sh` | Substitute `${VAR}` placeholders in config.json from `.env` or environment. Supports `--validate` and `--in-place`. |
| `scripts/sync-skills.sh` | Sync skills from this central repo to every enabled tool's `skills_path`. Supports `--dry-run`, `--tool <name>`, `--exclude <pattern>`. |
| `scripts/check-secrets.sh` | Scan config.json for plaintext secrets that should be in `.env` instead. |

## Secrets

Sensitive values (API keys, tokens) live in `.env` (gitignored). `config.json` uses `${VAR_NAME}` placeholders. Run `scripts/resolve-config.sh` to produce a resolved config with actual values.

## No CI / no tests at root

Individual skills may have their own tests (e.g. `skills/comfyui/tests/`), scripts, and setup. There is no repo-level test/lint/format command.
