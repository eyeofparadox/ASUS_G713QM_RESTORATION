myasus.md

---

# 🧰 Support Software Detail: MyASUS

**Component:** MyASUS  
**Status:** Not Present  
**Provisioning:** Failed during Audit Mode  
**Source:** ASUS Reset ISO (partial), ASUS Support Site (full)

---

## 📋 Fault Summary

MyASUS was not installed or registered during Audit Mode. No AppX provisioning or service initialization occurred. Logs show:

```
Event ID: 304
Source: AppModel-Runtime
Message: Failed with 0x80073D02 while installing MyASUS.Appx
```

---

## 🧠 Interpretation

- MyASUS provides system diagnostics, support links, and device-specific utilities.
- It is often bundled with AsusInsWiz or installed via:
  - AppX provisioning (Store or OEM)
  - Standalone installer (`MyASUSInstaller.exe`)
- Audit Mode blocks both paths unless preloaded.

---

## 📁 Source Availability

| Source | Status | Notes |
|--------|--------|-------|
| ASUS Reset ISO | ✅ Partial | May include installer or AppX bundle |
| ASUS Support Site | ✅ Full | Latest offline installer available |
| Microsoft Store | ❌ Blocked | Requires network and user context

---

## 🛠️ Suggested Remediation

1. **Include offline installer in ISO**
   - Place `MyASUSInstaller.exe` in `\sources\$OEM$\$1\Install\`
   - Script execution via `SetupComplete.cmd`:
     ```cmd
     start /wait "" "C:\Install\MyASUSInstaller.exe" /silent
     ```

2. **Verify service and AppX registration**
   - Confirm `MyASUS.exe` is present and functional
   - Check AppX status:
     ```powershell
     Get-AppxPackage -Name "*MyASUS*"
     ```

3. **Optional: Extract AppX bundle**
   - If `.appx` or `.msixbundle` is found, use:
     ```powershell
     Add-AppxPackage -Path "C:\AppX\MyASUS.appx"
     ```

---

## 🔗 Related Pages

- [`faults-by-support-software.md`](../summaries/faults-by-support-software.md)
- [`tools/asusinswiz.md`](asusinswiz.md)
- [`tools/armourycrate.md`](armourycrate.md)

---

*This page is part of the ASUS G713QM Restoration Project. For full context, see the [GitHub repo](https://github.com/eyeofparadox/ASUS_G713QM_RESTORATION).*  
