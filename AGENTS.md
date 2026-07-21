# .skills-manager

Central skill library + sync config for 20+ AI coding agents. This is a data/config repo, not a code project — no build system, no package.json.

## Repo layout

| Path | Purpose |
|------|---------|
| `config.json` | Master config (v2.1.0): tool paths, marketplace sources, preferences, auth |
| `skills/` | ~170 skill directories, each with `SKILL.md` + optional scripts/references/templates |
| `skills/_custom/` | Custom/local skills not from marketplace |
| `cache/` | Marketplace index cache (auto-generated JSON) |

## Skill directory convention

Every skill has `SKILL.md` with YAML frontmatter (`name`, `description`, optional `version`, `author`, `license`, `platforms`, `metadata/tags`).

Marketplace-installed skills also carry `meta.json` tracking origin/revision.

## Tools configured

`config.json.tools` registers 20+ agents (opencode, claude-code, cursor, codex, hermes, gemini, etc.) with their individual `skills_path` and `config_path`. Enabled/disabled per-tool.

## Secrets warning

`config.json` contains plaintext API keys (`llm_provider.api_key`, `github_token`, `auth_session` tokens). This repo is **not** git-tracked — do not add it to git or expose its contents.

## Marketplace sources

- `ComposioHQ/awesome-claude-skills` (GitHub)
- `skills.sh` (web)

Cached in `cache/marketplace-skills.json` and `cache/marketplace-skill-descriptions.json`.

## No CI / no tests at root

Individual skills may have their own tests (e.g. `skills/comfyui/tests/`), scripts, and setup. There is no repo-level test/lint/format command.
