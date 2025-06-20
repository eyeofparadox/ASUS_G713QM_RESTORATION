manifest.vmwaretools.md

---

# VMware Guest Tools Manifest  
**Assembled:** 2025-06-20  
**Maintainer:** David Bryan Roberson [EyeOfParadox]

---

## - Tool Components
- `vmtoolsd.exe`, `rpctool.exe`, `VMwareToolboxCmd.exe`
- Guest drivers:
  - `vmxnet3`, `vmhgfs`, `vmmouse`, `vmusbmouse` (Win7/8/11)
  - Staged in: `drivers\WinXX\`
- Runtime libraries:
  - `vcredist_x86.exe`, `vcredist_x64.exe` → `_runtime\vcredist\`
- Setup artifacts:
  - `setup.exe`, `VGAuth*`, `_VGAuthService.exe`

---

## - Provenance & Extraction
| File | Source |
|------|--------|
| All drivers | Extracted from `VMware Workstation Player` & `Pro` installs |
| Guest tools binaries | From `Toolbox.cab` and `VMware Tools ISO` |
| Runtime redistributables | From `G:\Archive\Programs\VMware Workstation Player\` |
| Full tool source log | [`.source/software-reference-c.2025-06-20.md`](https://github.com/eyeofparadox/ASUS_G713QM_RESTORATION/blob/main/.source/software-reference-c.2025-06-20.md)

---

## - Directory Layout
```
VM_Tools\
└─ VMware\
   ├─ RunVMTools.cmd
   ├─ manifest.vmwaretools.md
   ├─ _runtime\
   │  └─ vcredist\
   ├─ drivers\
   │  ├─ Win7\
   │  ├─ Win8\
   │  └─ Win11\
   ├─ vmtoolsd.exe
   ├─ rpctool.exe
   ├─ VMwareToolboxCmd.exe
   ├─ VGAuth*.*
   ├─ *.inf / *.sys / *.cat (root-level copies, if present)
```

---

## - File & Dependency Summary

| File | Purpose |
|------|---------|
| `vmtoolsd.exe`, `rpctool.exe`, `VMwareToolboxCmd.exe` | Core guest services |
| `VGAuthService.*`, `_VGAuthService.exe` | Host-auth proxy |
| `vmxnet3.*`, `vmhgfs.*`, `vmmouse.*`, `vmusbmouse.*` | Virtual drivers, routed by OS |
| `pvscsi.*` (in `VMware Tools\Drivers\pvscsi`) | SCSI/boot drivers |
| `vcredist_x86/x64.exe` | Microsoft runtime dependencies |
| `setup.exe` | Full installer preserved for reference |
| `RunVMTools.cmd` | Driver detection and injection script |

---

## - Source Attribution

These tools were harvested under private recovery/research rights from the following archive paths:

- `G:\Archive\Programs\VMware Workstation Player`
- `G:\Archive\Programs\VMware Workstation Pro`
- Original Tools .cab: `VMware Tools\VMware Tools.msi → toolbox.cab`
- Redistributables: from respective VMware installers
- Source metadata reference: [`software-reference-c.2025-06-20.md`](https://github.com/eyeofparadox/ASUS_G713QM_RESTORATION/blob/main/.source/software-reference-c.2025-06-20.md)

---

## <!> Redistribution Notes

This toolkit is **not intended for public redistribution**. All components were extracted for internal archival, research, and system restoration use only. If staging beyond private use, licensing and redistribution rights **must** be re-evaluated.

---

## - Companion Documentation

- `RunVMTools.cmd` — primary execution entrypoint
- `vmware-usb-injection-harvest--*.md` — harvesting rationale and method logs
- `.source/software-reference-c.2025-06-20.md` — complete component lineage
- `_scripts\*.log` — rename, sort, and preflight run logs

---

