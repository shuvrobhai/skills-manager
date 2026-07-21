# Indexing Rules

## Summary
- Defines structural rules for maintaining `INDEX.md` files.

## Local Index Structure
Each major category directory (e.g., `/projects`, `/playground`, `/tools`) maintains its own `INDEX.md`.

Format rules:
1. **Header**: `# [Category] Index`
2. **List style**: Bulleted list of active sub-projects using canonical format:

   ```
   - `dir/` — Description of purpose.
   ```

3. **Information to track**:
   - Sub-project name (folder name)
   - Brief 1-sentence description/purpose
4. **Exclusions**: Never track files, assets, source directories, or build caches inside the sub-project. Keep boundaries clean.

## Scan Filter Rules
When auto-scanning the filesystem, only consider named (non-hidden) directories for INDEX entries. Ignore all files, dotdirs, meta-files (README.md, AGENTS.md, CLAUDE.md, GEMINI.md, INDEX.md). Do not recurse into sub-project internals.

## Parent Index Structure
The root workspace index (`~/Developer/INDEX.md`) maps the top-level directories only.

Format rules:
1. **Header**: `# Workspace Index`
2. **Core Categories**: Map `/projects`, `/playground`, `/tools`, `/agents`, `/knowledge`, `/local-llm`, `/my-stack`.
3. **Updates**: Only update the parent index if a sub-project directory is added/removed under a top-level category or if a top-level category is created/removed.
