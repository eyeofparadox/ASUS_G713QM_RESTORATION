VBoxTools-Pick.manifest.md

---

# VBoxTools-Pick.manifest.md  
**Toolkit:** VirtualBox Guest Tools Integration  
**Prepared for:** ASUS_G713QM_RESTORATION  
**Author:** David Bryan Roberson [EyeOfParadox]  
**Last Updated:** 2025-06-20

---

## - Toolkit Overview

This bundle supports guest integration within Oracle VirtualBox environments during PE sessions or post-restore. It mirrors the VMware packaging conventions for parity across hypervisors.

### Contents
- `RunVBoxTools.cmd` - guest detection and tool loader
- `VBoxService.exe` and core guest utilities
- Guest drivers: `VBoxGuest.sys`, `VBoxMouse.sys`, etc.
- Integration artifacts: `VBoxCertUtil.exe`, `*.reg` tweaks
- ISO-based installer: `VBoxWindowsAdditions.iso`
- Extension support: `Oracle_VirtualBox_Extension_Pack-*.vbox-extpack`

---

## - Directory Layout
```
VM_Tools\
└─ VBox\
   ├─ RunVBoxTools.cmd
   ├─ VBoxService.exe
   ├─ VBox*.sys
   ├─ VBoxCertUtil.exe
   ├─ VBoxWindowsAdditions-*.exe
   ├─ VBoxWindowsAdditions.iso
   ├─ windows11-bypass.reg
   ├─ AUTORUN.INF
   ├─ Oracle_VirtualBox_Extension_Pack-*.vbox-extpack
   └─ VBoxTools-Pick.manifest.md
```


---

## - File & Dependency Summary

| File | Purpose |
|------|---------|
| `VBoxService.exe` | Core guest service |
| `VBoxGuest.sys`, `VBoxMouse.sys`, etc. | Guest drivers |
| `VBoxCertUtil.exe` | Certificate import tool |
| `VBoxWindowsAdditions.iso` | Optional full guest installer |
| `windows11-bypass.reg` | Registry shim for guest compatibility |
| `vcredist_x86/x64.exe` | If needed, pulled from `_runtime\vcredist\` (shared path) |
| `RunVBoxTools.cmd` | Tool launcher with guest detection logic |

---

## - Source Attribution

Harvested components originate from:

- `G:\Archive\Programs\VirtualBox`
- VirtualBox Guest Additions ISO
- Related drivers and utilities extracted via offline staging
- Source list reference: [`software-reference-c.2025-06-20.md`](https://github.com/eyeofparadox/ASUS_G713QM_RESTORATION/blob/main/.source/software-reference-c.2025-06-20.md)

---

## <!> Redistribution Notes

This toolkit is provided for **private PE and recovery purposes only**. Redistribution should be evaluated under Oracle’s VirtualBox licensing terms prior to wider use or publishing.

---

## - Companion Documentation

- `RunVBoxTools.cmd` — guest execution entrypoint
- `.source/software-reference-c.2025-06-20.md` — version and harvest metadata
- Optional driver install logs — see `_scripts\` or preload checks
- `RunHypervisorTools.cmd` (if present) — orchestrator for multi-hypervisor dispatch
