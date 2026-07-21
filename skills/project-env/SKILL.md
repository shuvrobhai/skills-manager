---
name: project-env
description: >
  Configure opencode.jsonc (global and per-project), plugins, MCP servers,
  custom agents, skills, permissions, and more for opencode projects.
  Use when user wants to set up a new project environment, modify existing
  config, add/remove plugins or MCPs, change models or permissions, or
  customize how opencode behaves in a project. Has a learning memory that
  adapts to user preferences over time.
---

# Project Environment Configurator (project-env)

A conversational configuration wizard for opencode projects. It walks through
each configuration domain, explains options, learns preferences over time,
and generates or updates `opencode.jsonc` files.

## How It Works

1. **Load memory** — reads `memory/preferences.yaml` from this skill's directory
2. **Detect current state** — runs `scripts/detect-config.sh` on the current project
3. **Interview** — walks through config domains, adapting to your experience tier
4. **Generate config** — runs `scripts/merge-jsonc.sh` to apply changes
5. **Validate** — runs `scripts/validate-jsonc.sh` against the opencode JSON schema
6. **Save memory** — logs session to `memory/preferences.yaml`

## Experience Tiers

| Tier | Sessions | Behavior |
|------|----------|----------|
| 1 (Beginner) | 0-3 | Full guided tour — explains every option |
| 2 (Familiar) | 4-9 | Skips rejected areas, offers quick-start defaults |
| 3 (Experienced) | 10+ | Proposes config from memory, user confirms/tweaks |
| 4 (Trusted) | 15+ | Silent apply with brief override menu |

The skill auto-detects and increments its tier as session count grows.

## Config Domains (Asked in Order)

For each, read `references/config-fields.md` for plain-English explanations
and `references/decision-guide.md` for when/why to recommend each feature.

### 1. Model / Provider
Ask which model and provider. Memory stores the default.
Options: anthropic, openai, google, openrouter, or custom providers.
Check memory for preferred model first.

### 2. Permissions
Configure per-tool permission gating (ask / allow / deny):
- `bash` — running shell commands
- `edit` — editing files
- `read` — reading files
- `glob` / `grep` — searching files
- `webfetch` — fetching URLs
- `external_directory` — accessing dirs outside workspace

Default recommendation: `bash: ask`, everything else `allow`.

### 3. Watcher Ignore
What files/dirs the agent should never see:
Default recommendation: `node_modules`, `.git`, `dist`, `build`, `.next`, `venv`.

### 4. Formatter
Enable or configure code formatters. Built-in or custom commands.

### 5. LSP
Language Server Protocol integration. Code intelligence, completions, go-to-definition.
Can be disabled if the user doesn't need it (many don't).

### 6. Skills
- Load all global skills (from `~/.agents/skills/`)
- Or specify per-project skills only
- Can add additional skill paths

### 7. Plugins
List currently registered plugins (from `~/.config/opencode/tui.json`).
Allow user to keep, remove, or add plugins. Support `file://` paths.

### 8. MCP Servers
Model Context Protocol — connects external tools (databases, APIs, file systems).
Ask: "Do you want to connect anything? E.g. a database, a search tool, a custom API?"
If yes, collect: type (local/remote), command or URL, any env variables.

### 9. Custom Agents
Create sub-agents with specific models, prompts, or permissions.
Check if user needs specialized agents for code review, planning, testing, etc.

### 10. Catch-all
"Anything else? I can also create AGENTS.md, CONTEXT.md, or set references."
Only offer if the user seems interested.

## Memory Management

Read `memory/preferences.yaml` at the start of every session.
Write to it at the end of every session.

### What Memory Tracks

- **User defaults** — preferred model, permissions, common choices
- **Tendencies** — which areas are always accepted, always skipped, need explanation
- **Projects** — per-project config snapshots and rejection history
- **Session log** — timestamp, project, actions taken

### How Learning Works

- After 2-3 consistent rejections of an area → it becomes `always_skips`
- After 2-3 consistent acceptances → it becomes `always_accepts`
- If user asks for an explanation → area moves to `needs_explanation`
- The skill proactively rechecks skipped areas every 5 sessions:
  "I've stopped asking about MCP servers. Has that changed?"

### User Commands

The skill should understand natural language requests:
- "Remember that I prefer Claude Sonnet" → updates `defaults.model`
- "Stop asking me about LSP" → adds `lsp_config` to `always_skips`
- "What do you know about me?" → summarizes memory
- "Forget my preferences" → resets `tendencies` section (keeps session_log)
- "I changed my mind about MCP" → removes MCP from `always_skips`

## Token Efficiency Rules

- Do NOT re-read the config files on every turn — read detect-config output once
- Do NOT print the full memory file to the user — summarize it
- Only load reference files when the user enters that config domain
- Keep interview responses concise: state recommendation, ask yes/no, move on

## Verification

After generating/updating `opencode.jsonc`, ALWAYS run:

```bash
bash scripts/validate-jsonc.sh <path-to-opencode.jsonc>
```

If validation fails, show the errors and offer to fix them before concluding.
If validation passes, confirm to the user and log the session to memory.
