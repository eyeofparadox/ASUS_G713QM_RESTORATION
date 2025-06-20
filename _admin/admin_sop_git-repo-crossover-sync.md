# SOP: Git Repository Crossover – Clean Sync Between Systems

**Version:** 1.0  
**Author:** EyeOfParadox  
**Date:** 2025-06-16  
**Purpose:**  
Safely migrate and synchronize a structured Git repository from source machine (`Git-G`, G713QM) to target system (`Git-X`, X750JB), resolving file placement inconsistencies while preserving audit traceability and rollback capacity.

---

## Process Flow Overview

1. **Prepare Git-G In-Box**
   - Copy `Git-G` root to `Git-G-In` (staging copy)

2. **Inject Into Target**
   - Drop `Git-G-In` onto `Git-X` repo root  
   - Overwrite contents without purge to permit diff detection

3. **Diff + Extract Delta**
   - Run file difference script  
   - Move unmatched/displaced files to `Git-X-Out`  
   - Review or discard obsolete files as needed

4. **Finalize Sync**
   - Confirm `Git-X` matches `Git-G-In`  
   - Run verification (e.g. hash diff, tree match, snapshot logging)

5. **Archive**
   - Compress `Git-G-In` as `Git-B.7z` (backup)  
   - Compress `Git-X-Out` as `Git-D.7z` (discarded)  
   - Move both to remote/archive storage

6. **Cleanup**
   - Delete `Git-G-In` and `Git-X-Out`  
   - Log operation under `_admin/logs/crossover-[YYYY-MM-DD].txt`

---

## Directory Roles

| Folder        | Role                                         |
|---------------|----------------------------------------------|
| `Git-G-In`    | Incoming snapshot from source system         |
| `Git-X-Out`   | Diff and displaced content from target       |
| `Git-X`       | Final mirror of the canonical structure      |
| `Git-B.7z`    | Archived backup of sync source               |
| `Git-D.7z`    | Archived diff/discards from sync target      |

---

## Tools & Scripts

- `diff-cleanup.cmd` → Identifies unmatched files in `Git-X`  
- `verify-sync.ps1` → Confirms parity between `Git-G-In` and `Git-X`  
- `archive-pack.cmd` → Archives `In` and `Out` artifacts

---

## Notes

- Run under admin to avoid permission snags  
- Ensure no open handles on either repo during sync  
- Recommend tree logging with `tree /f > snapshot.log` pre- and post-sync  

> “Mirroring isn't enough—only traceable symmetry counts in forensic workflows.”

---

## Timeline

This SOP was drafted during the reconstruction of the `in-the-eyeofparadox` archival repo and added to `_admin/SOPs/`. See `Case 045` and `046` for source context.
