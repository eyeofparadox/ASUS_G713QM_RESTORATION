045-ellipsis-massacre.md
---
# Case File 045 – The Ellipsis Massacre

**Date:** 2025-06-16  
**System:** ASUS_G713QM / Recovery Scaffold  
**Actor:** David [EyeOfParadox]  
**Incident Tag:** `rename-collapse-event`

---

## Summary

During archival cleanup of a deconstructed `.wim` capture directory, a bulk right-click rename using `...` via Windows Explorer was applied to ~20 `WinSxS` subfolders. This unintentionally truncated *only the middle section* of each folder name, preserving the prefix (`amd64_...`) and suffix (`none_<hash>`) while silently discarding the namespace core.

> “Like if Borges wrote a filesystem—stripped of content, but still locatable by its index.”

---

## Trigger Chain

1. User selected multiple deeply-nested folders in `Windows\WinSxS`
2. Applied right-click rename using `...`
3. Explorer auto-truncated each name, preserving only start+end structure
4. Folder identities lost; future delete/overwrite operations began to fail
5. Ghost reparse points became inaccessible

---

## Resolution

- Original folder identities recovered via prior metadata log:
  - `=== DLL Force-Cleanup Log ===` provided accurate paths
- Scripted `ren` operations mapped hash suffixes to full canonical names
- Folder names restored deterministically
- Filesystem reparse logic successfully bypassed during later cleanup

---

## Lessons Learned

- **Explorer rename + wildcard is filesystem roulette**
- `WinSxS` metadata names carry semantic payload—not just storage structure
- Logging cleanup operations **before** execution is a critical failsafe
- Ghost reparse points can be traced back to malformed `.wim` composition

---

## Follow-Up

- `restore-folder-names.cmd` added to recovery toolkit  
- Case indexed in `timeline.md` as `Case 045`  
- Ghost cleanup methodology archived for future regression tooling

---

> “If the folder has no name, the file within can no longer speak its truth.”

