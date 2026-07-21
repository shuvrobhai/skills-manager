# Decision Guide — When to Recommend Each Feature

## Model Selection

| Situation | Recommend |
|-----------|-----------|
| General coding, everyday use | Claude Sonnet 4 |
| Complex architecture, planning | Claude Opus |
| Simple tasks, cost-sensitive | Claude Haiku or GPT-4o-mini |
| Privacy-sensitive code | Local model via Ollama |

## Permissions Tuning

| Situation | Recommendation |
|-----------|---------------|
| Learning / exploring | `bash: ask` — prevents accidental destructive commands |
| Production work | `bash: allow` — speed, but be careful |
| Sensitive codebase | `read: allow`, `edit: ask` — review before changes |
| External access needed | `external_directory: allow` for monorepo patterns |
| Agent feels too restricted | Switch `ask` → `allow` for the noisiest gated tools |

## MCP Servers

| Situation | Recommend |
|-----------|-----------|
| Working with databases | PostgreSQL or SQLite MCP server |
| Need web search | Web search MCP server |
| Custom API integration | Build a local MCP server for your API |
| Not sure what MCP is | Skip for now — revisit when you need external data |

## Custom Agents

| Situation | Recommend |
|-----------|-----------|
| Want different models for different tasks | Create plan/build/test agents with specific models |
| Code review workflow | Create a "review" agent with strict instructions |
| Specialized domain work | Create agent with domain-specific prompt |
| Most users | Not needed — default agents are fine |

## Skills

| Situation | Recommend |
|-----------|-----------|
| Want reusable workflows | Install skills from GitHub or write your own |
| Per-project specialization | Use `.agents/skills/` in the project |
| Global tools (git, testing, etc.) | Use global `~/.agents/skills/` |
| First time | Load all global skills, skip per-project for now |

## Plugins

| Situation | Recommend |
|-----------|-----------|
| Want TUI enhancements | Add plugin paths to `tui.json` |
| CTO platform user | Keep the CTO TUI plugin |
| Privacy-conscious | Review what plugins do before adding |
| Performance issues | Disable unnecessary plugins |

## Watcher Ignore

Always recommend ignoring:
- `node_modules`, `.git`, `dist`, `build`, `.next`, `venv`, `__pycache__`
- `*.log`, `.env`, `.env.local` (secrets)
- Any generated/cache directories

## Formatter + LSP

| Situation | Recommend |
|-----------|-----------|
| TypeScript/JavaScript | Enable both — big quality-of-life improvement |
| Python | Enable formatter, LSP optional |
| Rust/Go | Enable LSP for code intelligence |
| Markdown/docs-only | Neither — overkill |
