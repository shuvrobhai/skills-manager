#!/usr/bin/env python3
"""gen-index.sh — Scan skills/ and generate INDEX.json + INDEX.md.

Usage: make index   (or: scripts/gen-index.sh)
"""

import json
import os
import re
import sys
from datetime import datetime, timezone
from pathlib import Path

try:
    import yaml
except ImportError:
    print("Error: PyYAML is required (pip install pyyaml)", file=sys.stderr)
    sys.exit(1)


def parse_frontmatter(path: Path):
    """Parse YAML frontmatter between --- markers. Returns dict or None."""
    text = path.read_text(encoding="utf-8")
    # Match frontmatter between opening --- and closing ---
    m = re.match(r"^---\s*\n(.*?)\n---", text, re.DOTALL)
    if not m:
        return None
    try:
        return yaml.safe_load(m.group(1))
    except yaml.YAMLError as e:
        print(f"  Warning: YAML parse error in {path}: {e}", file=sys.stderr)
        return None


def main():
    monorepo = Path(__file__).resolve().parent.parent
    skills_dir = monorepo / "skills"
    index_json = monorepo / "INDEX.json"
    index_md = monorepo / "INDEX.md"

    skill_files = sorted(skills_dir.rglob("SKILL.md"))

    entries = []
    for sf in skill_files:
        # Skip anything more than 2 levels deep (e.g. evals/something/SKILL.md)
        rel = sf.relative_to(skills_dir)
        if len(rel.parts) > 2:
            continue

        skill_name = rel.parent.name
        fm = parse_frontmatter(sf)

        name = fm.get("name", skill_name) if fm else skill_name
        desc = fm.get("description", "") if fm else ""
        # Normalise: single-line, strip surrounding whitespace
        if isinstance(desc, str):
            desc = desc.strip().replace("\n", " ").replace("\r", "")
        else:
            desc = str(desc).strip()

        source_type = "custom" if skill_name == "_custom" or str(rel.parent).startswith("_custom/") else "upstream"
        path = f"skills/{rel.parent}"

        entries.append({"name": name, "description": desc, "source": source_type, "path": path})

    now = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
    registry = {"version": "1", "updated": now, "skills": entries}

    # Write INDEX.json
    index_json.write_text(json.dumps(registry, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")

    # Build INDEX.md
    lines = ["# Skills Index", "", f"Auto-generated on {datetime.now(timezone.utc).strftime('%Y-%m-%d %H:%M:%S UTC')}.", "",
             "| Name | Description | Source | Path |",
             "|------|-------------|--------|------|"]
    for e in entries:
        desc = e["description"][:120] + "…" if len(e["description"]) > 120 else e["description"]
        # Escape pipe chars in description for markdown table
        desc = desc.replace("|", "\\|")
        lines.append(f'| {e["name"]} | {desc} | {e["source"]} | {e["path"]} |')
    lines.append("")
    index_md.write_text("\n".join(lines), encoding="utf-8")

    print(f"INDEX.json + INDEX.md generated — {len(entries)} skills indexed")


if __name__ == "__main__":
    main()
