armourycrate.md

---

# 🧰 Support Software Detail: Armoury Crate

**Component:** Armoury Crate  
**Status:** Not Present  
**Provisioning:** Failed during Audit Mode  
**Source:** ASUS Reset ISO (partial), ASUS Support Site (full)

---

## 📋 Fault Summary

Armoury Crate was not initialized during Audit Mode. No AppX provisioning or service registration occurred. Logs show:

```
Event ID: 304
Source: AppModel-Runtime
Message: Failed with 0x80073D02 while installing ArmouryCrate.Appx
```

---

## 🧠 Interpretation

- Armoury Crate is ASUS’s unified control center for performance profiles, fan curves, lighting, and device telemetry.
- It often installs via:
  - AppX provisioning (Store or OEM)
  - ASUS Installer (`ArmouryCrateInstaller.exe`)
- Audit Mode with networking disabled blocks both paths unless preloaded.

---

## 📁 Source Availability

| Source | Status | Notes |
|--------|--------|-------|
| ASUS Reset ISO | ✅ Partial | May include `ArmouryCrateInstaller.exe` |
| ASUS Support Site | ✅ Full | Latest offline installer available |
| Microsoft Store | ❌ Blocked | Requires network and user context

---

## 🛠️ Suggested Remediation

1. **Include offline installer in ISO**
   - Place `ArmouryCrateInstaller.exe` in `\sources\$OEM$\$1\Install\`
   - Script execution via `SetupComplete.cmd`:
     ```cmd
     start /wait "" "C:\Install\ArmouryCrateInstaller.exe" /silent
     ```

2. **Verify service registration**
   - Confirm `ArmouryCrateService.exe` is running post-install
   - Check registry:
     ```powershell
     Get-Service | Where-Object {$_.DisplayName -like "*Armoury*"}
     ```

3. **Optional: Preload AppX if available**
   - If `.appx` or `.msixbundle` is found, use:
     ```powershell
     Add-AppxPackage -Path "C:\AppX\ArmouryCrate.appx"
     ```

---

## 🔗 Related Pages

- [`faults-by-support-software.md`](../summaries/faults-by-support-software.md)
- [`tools/asusinswiz.md`](asusinswiz.md)
- [`apps/windowsstore.md`](../apps/windowsstore.md)

---

*This page is part of the ASUS G713QM Restoration Project. For full context, see the [GitHub repo](https://github.com/eyeofparadox/ASUS_G713QM_RESTORATION).*  
