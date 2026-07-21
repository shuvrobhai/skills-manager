# Validation Checklist

## Summary
- Steps to verify that workspace indices are fully synced and accurate.

## Verification Steps

### 1. Filesystem Scan
Walk `~/Developer/` to depth 1. Collect all non-hidden directories. Ignore all files and hidden dirs.

### 2. Cross-Reference Local INDEX
For each top-level directory (projects, playground, tools, etc.):
- Check if a local `INDEX.md` exists
- List its entries vs. actual directories on disk
- Report: directories on disk but missing from INDEX (auto-fix candidates)
- Report: INDEX entries without matching directories (stale — ask before removing)

### 3. Cross-Reference Parent INDEX
Compare `~/Developer/INDEX.md` sub-project lists against actual directories:
- Missing entries on disk → auto-fix
- Stale entries in INDEX → report for removal

### 4. Internal Isolations Check
Ensure no internal files of any sub-projects are listed in any INDEX.

### 5. Links Consistency
Verify relative paths or links referenced inside index files are valid.

### 6. Final Sync Confirmation
Confirm no mismatches remain. If auto-fixes were applied, list them. If removals were confirmed, list them.
