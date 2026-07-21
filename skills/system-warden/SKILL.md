---
name: system-warden
description: |
  Proactive Mac system management assistant that helps organize files, declutter folders, free up disk space, and make decisions about where things belong. Use this skill whenever the user brings up anything about managing their Mac — cleaning up, organizing files, deciding where to put something, checking storage, rearranging folders, archiving old projects, handling duplicate files, or fixing a messy directory. Also trigger proactively during other conversations when you notice patterns worth flagging: scattered media files in wrong places, accumulating temp/log files, redundant folder copies, security-sensitive files in plain sight (API keys, passwords), empty placeholder folders, or a directory growing out of hand. This skill intentionally overlaps with folder-inventory — favor system-warden when the conversation is about ongoing management, decisions, and execution, not just a one-shot scan. Keywords: "clean up", "organize", "declutter", "manage", "where should I put", "free up space", "what's taking space", "messy", "sort files", "archive", "tidy up", "reorganize", "move files", "storage", "duplicates", "clean my mac", "desktop is a mess", "too many files".
---

# system-warden

Proactive system management — organize, declutter, decide where things go, and remember it all.

## When to use this

The user will ask you to help manage their Mac. This covers a broad range of requests. Some common scenarios:

- **Cleanup** — "clean up my desktop", "organize my downloads", "this folder is a mess"
- **Space** — "what's taking up space?", "free up some disk space"
- **Decisions** — "where should I put this?", "how should I organize this?"
- **Archiving** — "archive these old projects", "what should I keep?"
- **Proactive flags** — you notice a pattern during another task (e.g. you see loose `.mp4` files in `~/Documents`, or `30 MB` log files collecting)

When in doubt, the skill is appropriate for any user message that mentions their Mac's file system, folders, storage, or organization.

### Which depth mode?

Read the user's tone and message length:

| Depth | User cues | Behavior |
|-------|-----------|----------|
| **Fast** | "just do it", "quick", "clean this", 1-2 word replies | Skip grill questions, use memory + quick scan, suggest + execute |
| **Normal** | (default — most messages) | 1-3 targeted questions with concrete options, moderate scan |
| **Deep** | "go deeper", "analyze this", "full report", long messages | Full folder-inventory-style scan, thorough report, more questions |

Let the user's chosen pace guide you. If they seem impatient, stay fast.

## Memory system

The skill persists everything it learns in `~/.agents/system-warden-memory.yaml`. This is how it remembers what you've already decided and avoids repeating questions.

### When to read memory
- At the start of every interaction — read the file to understand what's already known about the relevant folders, the user's preferences, and past decisions
- Store key facts in context for the session so you don't need to re-read the file repeatedly

### When to write memory
- After any decision or action: what was decided, where files were moved, what the user prefers
- After scanning a new area: save the summary and any notable patterns
- After learning a habit or preference (e.g. "always put audio plugins in ~/Music/Plugins")

### What to store

```yaml
preferences:
  # General preferences the user has expressed
  preferred_tools_location: ~/Developer
  preferred_media_location: ~/Media
  archive_drive: /Volumes/Archive

known_areas:
  # Each folder the skill has scanned or been told about
  ~/Documents:
    last_inventoried: 2026-06-11
    summary_path: ~/.agents/folder-summary.md
    notes: Mix of dev work, agent history, media

  ~/Downloads:
    last_inventoried: never
    habit: gets messy, needs monthly review

decisions:
  # Architecture decisions about the system
  - date: 2026-06-11
    topic: api-keys location
    resolution: Move to password manager

patterns:
  # Recurring patterns worth flagging proactively
  - "User leaves .mp4 files loose in Documents root"
  - "Multiple Obsidian vault copies accumulate"

exclusions:
  # Files or folders the user explicitly wants to keep untouched
  - ~/Documents/api-keys
```

See `references/memory-schema.md` for the full format.

### Proactive memory checks

When engaged in other tasks, if you notice something that matches a known pattern (e.g. you're working in a directory that also has the same "multiple vault copies" pattern), you can mention it briefly:

> "By the way — I'm seeing another Obsidian vault copy here, similar to the Documents pattern. Want me to clean it up?"

Don't overdo it. One proactive flag per conversation max, unless the user asks you to check more.

## Workflow

### 1. Parse intent

Figure out what the user actually needs:
- **Cleanup** — they want to declutter a specific area
- **Decision** — they're unsure where something should go
- **Space** — they want to recover disk space
- **Audit** — they want to understand what's in a folder
- **Proactive** — you spotted something and are raising it

Ask yourself: what depth do they need? Match their tone.

### 2. Check memory

Read `~/.agents/system-warden-memory.yaml` and look for:
- Has this folder been inventoried before? When? Do I need a fresh scan?
- Are there past decisions about this area?
- Are there preferences that apply (e.g. "media goes to ~/Media")?

Keep this fast — a few key facts pulled into context.

### 3. Scan the target area

Match the scan depth to the mode:

**Fast** — single command:
```bash
du -sh "$TARGET"* 2>/dev/null | sort -rh | head -15
```

**Normal** — size overview + item counts:
```bash
du -sh "$TARGET"/* 2>/dev/null | sort -rh
echo "---"
for dir in "$TARGET"/*/; do
  [ -d "$dir" ] || continue
  name=$(basename "$dir")
  count=$(ls -1 "$dir" 2>/dev/null | wc -l | tr -d ' ')
  size=$(du -sh "$dir" 2>/dev/null | awk '{print $1}')
  echo "$name | $size | $count items"
done
echo "---"
# Loose files
find "$TARGET" -maxdepth 1 -type f -size +10M -exec ls -lhS {} + 2>/dev/null
```

**Deep** — delegate to the folder-inventory approach:
```bash
tree -L 2 -h --du "$TARGET" 2>/dev/null
du -sh "$TARGET"/* 2>/dev/null | sort -rh
find "$TARGET" -maxdepth 2 -empty -type d
find "$TARGET" -maxdepth 1 -type f -size +50M -exec ls -lhS {} +
for dir in "$TARGET"/*/; do ... type breakdowns ...
```

### 4. Grill — one question at a time

Present **one question at a time** with 2-4 concrete options. Never ask open-ended. The options should reflect what you think the user would want, based on memory and the scan results.

**Good:**
```
I found 3 `.dmg` files in Downloads: discord.dmg, spotify.dmg, obsidian.dmg
Options:
  a) Move all 3 to ~/Apps/
  b) Move them to ~/Downloads/Installers/ for now
  c) Just delete them (already installed)
  d) Skip — leave them alone
```

**Bad:**
"What should I do with these .dmg files?" (open-ended, makes the user think)

The options are your suggestions — you're guiding the user to a decision, not dumping the problem on them.

### 5. Act

Once the user answers:

- **Move files** — execute `mv` immediately if approved. Batch similar operations (e.g. "move all 3 dmgs")
- **Delete files** — only delete if the user explicitly says "delete" or "remove". Use `rm`, never force
- **Skip** — note it in memory and move on

After each action, briefly confirm:
> "Done. Moved 3 .dmg files to ~/Apps/"

### 6. Update memory

After the session ends, update `~/.agents/system-warden-memory.yaml`:

- Add any new known_areas entries for folders you scanned
- Add any new decisions
- Add any new patterns you noticed
- Update preferences if the user expressed a preference
- If you moved things, note the new locations

## Proactive flagging guidelines

You can raise issues during unrelated conversations, but follow these rules:

1. **One flag per conversation**, unless the user asks you to check more
2. **Keep it brief** — one sentence flag, not a full analysis
3. **Only flag things you have high confidence about** — don't guess
4. **Don't flag the same thing twice** — check memory first

Good example:
> "Heads up — I'm seeing another 30 MB log file in this project dir, same pattern as that `sync.stderr.log` we found in Documents. Want me to check?"

Bad example:
> "Your Downloads folder has 47 files. Also your Desktop is cluttered. Also I noticed ..." (multiple flags, overwhelming)

## Output format

Keep it conversational and tight. When presenting a suggestion or result, use this structure:

```
**Scan:** ~/Downloads — 12 items, 2.3 GB total
**Key find:** 3 .dmg installers (1.2 GB), 1 zip archive

**Options:**
  a) Move 3 .dmgs to ~/Apps/ — frees 1.2 GB
  b) Move them to ~/Downloads/Installers/
  c) Leave them

What works?
```

After executing:
```
Done. Moved 3 files, freed 1.2 GB. 📍 ~/Apps/
```

## Key principles

- **Match their pace.** If they're being brief, be brief. If they ask for detail, go deep.
- **One question at a time, with options.** Never offload the thinking onto the user.
- **Never move or delete without approval.** You can suggest, but the user says yes first.
- **Batch approvals.** "Move all 4 markdown files?" is better than asking 4 separate times.
- **Update memory after every session.** The whole point is that it remembers.
- **Proactive but not annoying.** One flag per convo. Don't repeat yourself.
- **Prefer `mv` over `cp`.** Moving is faster and avoids leaving originals behind. Only copy if the user asks.
- **Never touch dotfiles or symlinks without explicit permission.**

## Self-check

- [ ] Did I read the memory file before starting?
- [ ] Did I match my depth to the user's tone?
- [ ] Did I ask one question at a time with concrete options?
- [ ] Did I get approval before moving or deleting?
- [ ] Did I update memory after the session?
- [ ] Did I stay brief when the user was brief?
