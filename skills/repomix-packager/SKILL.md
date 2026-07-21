---
name: repomix-packager
description: |
  Pack repository code into a single AI-friendly file optimized for the user's context window and intent. Asks clarifying questions about purpose, token budget, and scope; then suggests and runs the optimal repomix command. Use when the user wants to package code for AI consumption (sending to ChatGPT, Claude, Gemini), preparing code context for another AI session, or extracting focused parts of a codebase as AI input. Triggers on keywords like "pack for AI", "send to ChatGPT", "prepare context", "repomix this", "bundle for Claude/Claude code", "pack this repo", "make a repomix file", "create AI context".
---

# repomix-packager

Before running, clarify what the user actually needs. The format, compression, and scope should match their specific AI use case.

## Intent-to-options reference

| Intent | Format | Compress | Extra flags |
|---|---|---|---|
| Whole codebase for expensive AI | markdown | yes | — |
| Deep analysis of specific area | xml | no | `--include "<patterns>"` |
| Quick overview / docs | markdown | no | — |
| Max context under tight token limit | plain | yes | `--include "<patterns>"` |
| Code review recent changes | xml | no | `--include-diffs` |
| Structure / metrics only | xml | — | `--no-files` |

## Workflow

### 1. Understand intent
Ask about (unless user already specified):
- **Purpose**: What AI + task is this for?
- **Token budget**: How much context does the target AI allow? (Claude ~200K, GPT-4o ~128K, Gemini ~1M, local LLM often 8-32K)
- **Scope**: Whole repo or specific dirs/files?
- **Format**: xml (default), markdown, json, plain

### 2. Suggest & confirm
Present a brief recommendation:
```
I'll run: repomix --style markdown --compress --include "src/**" --output /tmp/ctx.md
Reason: Markdown is token-efficient for Claude, compression cuts ~70% tokens for your 200K window, --include limits to source code.
```

### 3. Run repomix
Use `npx repomix@latest` (or local bin if project has it). For remote repos, always output to `/tmp/`.

### 4. Report
Tell the user the output path, token count, file count, and how to feed it to their AI.

## Common command patterns

```bash
# Basic local pack
npx repomix@latest

# Compressed for tight context
npx repomix@latest --compress --output /tmp/compressed.xml

# Markdown for AI chat (token-efficient)
npx repomix@latest --style markdown --output /tmp/context.md

# Targeted scope
npx repomix@latest --include "src/**/*.{ts,tsx}" --output /tmp/context.xml

# Remote repo, clean output
npx repomix@latest --remote user/repo --compress --output /tmp/repo-analysis.xml

# With git changes for review
npx repomix@latest --include-diffs --style markdown --output /tmp/review.md

# Enforce a hard token ceiling
npx repomix@latest --compress --token-budget 100000

# Split large output for sequential feeding
npx repomix@latest --compress --split-output 200kb
```

## Key decisions

**Compression** (`--compress`): Always suggest when repo >100 files or budget is tight. Skip when user needs exact verbatim code or repo is small.

**Format**: markdown is most token-efficient for AI chat; xml preserves full structure for analysis; plain is minimal overhead; json for programmatic use.

**Split output** (`--split-output`): Use when total output would exceed the AI's window — creates numbered chunks for sequential feeding.

## Self-check

- [ ] Clarified intent before running?
- [ ] Confirmed suggested command with user?
- [ ] Noted token count + file count?
- [ ] Told user output path and how to use it?
- [ ] Remote repos go to `/tmp/`?
- [ ] Suggested compression/split for large outputs?
