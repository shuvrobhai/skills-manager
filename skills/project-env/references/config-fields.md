# opencode.jsonc — Field Reference

Plain-English explanations of every config field.

## Core Settings

| Field | Type | What It Does |
|-------|------|--------------|
| `$schema` | URL | Points to the JSON schema for validation. Just leave it as is. |
| `model` | string | Which AI model to use, e.g. `anthropic/claude-sonnet-4-20250514`. Format: `provider/model-name`. |
| `shell` | string | Default shell for terminal commands (e.g. `zsh`, `bash`). Usually leave unset. |
| `logLevel` | string | How verbose logs are: `DEBUG`, `INFO`, `WARN`, `ERROR`. Only useful for troubleshooting. |

## Agents

Custom agents that do specialized work. Each agent can have its own model
and instructions. Built-in agent types: `plan`, `build`, `general`, `explore`,
`title`, `summary`, `compaction`.

```jsonc
{
  "agent": {
    "plan": { "model": "anthropic/claude-sonnet-4-20250514" },
    "build": { "model": "anthropic/claude-sonnet-4-20250514" }
  }
}
```

Agent fields:
- `model` — override the model for this agent
- `prompt` — custom instructions for this agent
- `permission` — different permission rules for this agent
- `description` — when to use this agent
- `mode` — `subagent` (invoked by @name), `primary` (main agent), `all`
- `color` — hex color or theme color for the agent badge
- `steps` — max iterations before stopping
- `temperature` — creativity level (0.0 = deterministic, 1.0 = creative)

## Permissions

Control what the agent can do. Three levels: `allow`, `ask`, `deny`.

```jsonc
{
  "permission": {
    "bash": "ask",
    "edit": "allow",
    "read": "allow",
    "glob": "allow",
    "grep": "allow",
    "webfetch": "ask"
  }
}
```

Available tools:
- `read` — reading files
- `edit` — editing files
- `bash` — running shell commands
- `glob` / `grep` — searching files/contents
- `task` — spawning sub-agents
- `webfetch` — fetching URLs
- `external_directory` — accessing files outside workspace
- `question` — asking you questions
- `skill` — loading skills

Or set a single string to apply to all: `"permission": "allow"`.

## Provider

Configure model providers (where the AI runs).

```jsonc
{
  "provider": {
    "anthropic": {
      "name": "Anthropic",
      "api": "anthropic",
      "env": ["ANTHROPIC_API_KEY"]
    },
    "openai": {
      "name": "OpenAI",
      "api": "openai",
      "env": ["OPENAI_API_KEY"]
    }
  }
}
```

For custom providers (e.g. Ollama, local models):
```jsonc
{
  "provider": {
    "ollama": {
      "name": "Ollama",
      "api": "openai",
      "options": { "baseURL": "http://localhost:11434/v1" },
      "models": {
        "llama3": { "id": "llama3" }
      }
    }
  }
}
```

## Skills

Which skill directories to load.

```jsonc
{
  "skills": {
    "paths": [
      "~/.agents/skills",
      "./.agents/skills"
    ]
  }
}
```

## References

Pull in external context (git repos or local directories) for the agent to reference.

```jsonc
{
  "references": {
    "api-docs": {
      "repository": "https://github.com/myorg/api-docs.git",
      "branch": "main",
      "description": "API documentation reference"
    }
  }
}
```

## MCP Servers

Model Context Protocol — connects external tools to the agent.

### Local MCP (runs as a process on your machine)

```jsonc
{
  "mcp": {
    "my-db": {
      "type": "local",
      "command": ["npx", "-y", "@modelcontextprotocol/server-postgres"],
      "environment": { "PGHOST": "localhost", "PGPORT": "5432" }
    }
  }
}
```

### Remote MCP (runs on a server)

```jsonc
{
  "mcp": {
    "search-api": {
      "type": "remote",
      "url": "https://api.example.com/mcp",
      "headers": { "Authorization": "Bearer <token>" }
    }
  }
}
```

Fields:
- `type` — `local` or `remote`
- `command` — (local) the command + args to run
- `url` — (remote) the server URL
- `environment` — env variables for the process
- `enabled` — true/false
- `timeout` — request timeout in ms (default 5000)

## Plugins

TUI plugins that extend the opencode interface.

```jsonc
{
  "plugin": [
    "file:///path/to/plugin-directory"
  ]
}
```

Each plugin is a directory with a `package.json` that has a `"main"` entry.

## Commands (Slash Commands)

Custom slash commands for the TUI.

```jsonc
{
  "command": {
    "deploy": {
      "template": "Deploy the application to production",
      "description": "Quick deploy command",
      "agent": "build"
    }
  }
}
```

## Watcher

Files the agent should ignore.

```jsonc
{
  "watcher": {
    "ignore": ["node_modules", ".git", "dist", "build", ".next", "*.log"]
  }
}
```

## Formatter

Code formatting configuration.

```jsonc
{ "formatter": true }
```

Or per-language:
```jsonc
{
  "formatter": {
    "prettier": {
      "command": ["npx", "prettier", "--write"],
      "extensions": [".js", ".ts", ".jsx", ".tsx", ".json", ".css"]
    }
  }
}
```

## LSP

Language server protocol for code intelligence.

```jsonc
{ "lsp": true }
```

Or custom LSP server:
```jsonc
{
  "lsp": {
    "typescript": {
      "command": ["typescript-language-server", "--stdio"],
      "extensions": [".ts", ".tsx", ".js", ".jsx"]
    }
  }
}
```

## Other Fields

| Field | What It Does |
|-------|--------------|
| `instructions` | Additional instruction file paths to include |
| `username` | Override display name in conversations |
| `autoupdate` | Auto-update behavior: `true`, `false`, or `"notify"` |
| `experimental.openTelemetry` | Enable OpenTelemetry spans for debugging |
| `experimental.policies` | Restrict which providers can be used for what |
| `compaction` | Control context window overflow management |
| `tool_output.max_lines` | Max lines before truncating tool output (default 2000) |
| `tool_output.max_bytes` | Max bytes before truncating tool output (default 51200) |
| `disabled_providers` | Providers to disable |
| `enabled_providers` | When set, ONLY these providers are enabled |
