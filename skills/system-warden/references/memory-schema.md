# system-warden Memory Schema

Reference for `~/.agents/system-warden-memory.yaml`.

## Top-level structure

```yaml
preferences:      # User preferences (key-value)
known_areas:      # Folders the skill has scanned
decisions:        # Past decisions made about file organization
patterns:         # Recurring patterns worth flagging
exclusions:       # Files/folders the user wants left alone
```

## preferences

General preferences the user has expressed across sessions.

```yaml
preferences:
  preferred_tools_location: ~/Developer
  preferred_media_location: ~/Media
  archive_drive: /Volumes/Archive
```

Keys are descriptive, values are paths or strings. Add new keys as needed.

## known_areas

Each folder the skill has scanned or been told about.

```yaml
known_areas:
  <path>:
    last_inventoried: <YYYY-MM-DD>
    summary_path: <path to full summary file>   # optional
    notes: <free text — what's in here, notable finds>
    habit: <description of how this folder behaves>  # optional
```

### Fields

| Field | Required | Description |
|-------|----------|-------------|
| `last_inventoried` | Yes | Date of last scan |
| `summary_path` | No | Path to a detailed report file (e.g. folder-summary.md) |
| `notes` | No | Free-text notes about contents, issues, organization |
| `habit` | No | How this folder typically behaves (e.g. "gets messy, needs monthly review", "stays clean") |

## decisions

Architecture decisions about the system — conclusions reached after discussion.

```yaml
decisions:
  - date: <YYYY-MM-DD>
    topic: <short description>
    resolution: <what was decided>
    context: <optional — why this decision was made>
```

### Fields

| Field | Required | Description |
|-------|----------|-------------|
| `date` | Yes | When the decision was made |
| `topic` | Yes | Short label for what the decision covers |
| `resolution` | Yes | What was decided |
| `context` | No | Why this decision was made, for future reference |

## patterns

Recurring patterns worth flagging proactively.

```yaml
patterns:
  - <description of the pattern>
```

Each pattern is a single string describing something the skill noticed recurring. These are checked at the start of each session so the skill can proactively flag matching situations.

## exclusions

Files or folders the user explicitly wants the skill to never touch.

```yaml
exclusions:
  - <path>
```

Paths can be absolute or relative. These are checked before any move/delete operation.
