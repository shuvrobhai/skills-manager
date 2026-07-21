---
name: folder-inventory
description: |
  Create a comprehensive human-readable summary of any directory for cleanup, archiving, or organizational planning. Uses system CLI tools (ls, du, tree, find) to inventory ALL files — not just code. Generates a structured markdown report describing folder purposes, file counts, sizes, file types, and actionable cleanup notes. Triggers when user asks about cleaning up, organizing, summarizing, or "taking stock" of a folder; when they need to understand what's in a directory before archiving, sorting, or deleting. Keywords: "clean up", "organize", "summary of", "what's in", "inventory", "audit folder", "Downloads", "messy folder", "sort files", "archive", "tidy".
---

# folder-inventory

Inventory any directory and produce a structured report designed for an AI or human to plan cleanup, archiving, and reorganization.

## When to use this

Use this skill when the user wants to understand the contents of a folder that contains **mixed file types** — not just code, but also binaries, images, videos, archives, documents, and other non-text files. This is the right tool for:

- Cleaning up Downloads
- Auditing a project folder before archiving
- Taking stock of what's in a shared drive or backup
- Prepping a messy directory for reorganization

## Workflow

### 1. Clarify scope

Ask about anything the user hasn't already specified:

- **Target directory** — which folder to inventory? Default to current directory (`.`) if not specified.
- **Depth** — how deep to go? Default to 2 levels (top-level + one sub-level). For large directories, 1 level may be enough.
- **Goal** — cleanup? archive? just curious? This shapes the report's emphasis.

### 2. Inventory using system tools

Use these commands to gather data. Run them in parallel where possible.

```bash
# Top-level overview with sizes
du -sh "$TARGET"/* 2>/dev/null | sort -rh

# Full tree at requested depth
tree -L "$DEPTH" -h --du "$TARGET" 2>/dev/null

# For each subfolder: item count, total size, file type breakdown
for dir in "$TARGET"/*/; do
  count=$(ls -1 "$dir" 2>/dev/null | wc -l | tr -d ' ')
  size=$(du -sh "$dir" 2>/dev/null | awk '{print $1}')
  types=$(ls -1 "$dir" 2>/dev/null | sed 's/.*\.//' | sort | uniq -c | sort -rn | head -5 | tr '\n' ' ')
  echo "$dir | items: $count | size: $size | types: $types"
done
```

If `tree` is not available, fall back to `find`:

```bash
find "$TARGET" -maxdepth "$DEPTH" -type f -exec du -ah {} + | sort -rh
```

### 3. Build the summary report

Organize the report into these sections:

#### Overview line
One line with total size and total top-level entries.

#### Category folders table
For each subdirectory:
- Name, size, item count, and a **plain-English description** of what's inside (not just raw stats).
- Example: "20 `.dmg` installer files — macOS software installers" rather than just "20 files"

#### Empty folders
List any empty subdirectories — these are clutter.

#### Root-level loose files
Group by category (large media, installers, documents, configs, orphans). Call out:

- **Large files** — anything >100 MB that might be worth archiving or deleting
- **Duplicates** — files with similar names or content
- **Orphaned resource folders** — web page `_files/` directories left behind after saving HTML

#### Cleanup notes
End with actionable observations an AI or human can act on:

- Biggest space hogs
- Redundant or empty folders
- Files that belong in category folders but are loose in root
- Patterns worth investigating

### 4. Write the output

Save to `.agents/folder-summary.md` relative to the target directory and tell the user the path.

## Output format example

```
# 📁 <dirname> — Full Top-Level Summary
**Generated:** `date +%Y-%m-%d_%H:%M`
**Total:** ~45 GB across 44 entries

## 📂 Category Folders
| Folder | Size | Items | Description |
|--------|------|-------|-------------|
| Apps/ | 1.4 GB | 20 | 20 .dmg installer files — macOS apps |
| Archives/ | 13 GB | 19 | Zipped packages, likely backups |
| ... | | | |

## 📂 Empty Folders
Screenshots/, Receipts/ — 0 items each

## 📄 Root-Level Loose Files
### Large Files
| File | Size | Type |
### Software Installers
| File | Size | Type |
### Documents & Config
| File | Notes |

## 🚨 Cleanup Notes
1. Biggest space hogs
2. Orphaned files
3. Recommended actions
```

## Key principles

- **Describe, don't just list.** A table of raw numbers isn't helpful. Explain what each folder *contains* in plain language.
- **Use system tools.** Prefer `ls`, `du`, `tree`, `find` — they see every file type.
- **Think like a cleanup planner.** Call out what matters: large files, duplicates, empty folders, misplaced items.
- **Output is for AI consumption.** The markdown should be structured so an AI can read it and propose an action plan.

## Self-check

- [ ] Clarified target directory, depth, and goal?
- [ ] Used system tools (ls/du/tree/find)?
- [ ] Described each folder's contents, not just listed stats?
- [ ] Called out large files, duplicates, empty folders?
- [ ] Wrote actionable cleanup notes?
- [ ] Saved output to `.agents/folder-summary.md` and reported path?
