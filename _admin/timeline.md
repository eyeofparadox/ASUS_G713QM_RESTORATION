# Incident Timeline – in-the-eyeofparadox Archive

Documenting significant events, recoveries, and anomalies across archival environments. Entries are sorted chronologically and link to full casefiles where available.

---

## 2025-06-16 – Case 045: The Ellipsis Massacre  
Bulk folder rename via Windows Explorer (`...`) stripped semantic identity from ~20 `WinSxS` folders, leaving only hash suffixes.  
Recovered using DLL cleanup logs and suffix-matching. Script-assisted renaming restored canonical structure.  
[Casefile 045](./_casefiles/045-ellipsis-massacre.md)

---

## 2025-06-16 – Case 046: DISM Resonance Flush  
`.wim` mount failed due to a non-empty `MountDir` (`Error 0xc1420114`), yet inadvertently cleared unremovable ghost folders.  
Reparse stubs became deletable post-failure. Suggested pre-mount operations may trigger hidden NTFS cleanup cycles.  
[Casefile 046](./_casefiles/046-dism-resonance-flush.md)

---

## [Next Case Placeholder]  
[Add future anomalies, system rescues, or surgical events here.]
