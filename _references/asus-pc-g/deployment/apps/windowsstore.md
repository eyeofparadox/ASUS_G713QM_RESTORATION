windowsstore.md

---

# 📦 AppX Detail: Microsoft Store

**Package Name:** `Microsoft.WindowsStore`  
**Entry Point:** `App`  
**Status:** Provisioning Failed  
**Source:** Winget, Microsoft Store, PC-X

---

## 📋 Fault Summary

Microsoft Store failed to provision during Audit Mode. Logs show:

```
Event ID: 304
Source: AppModel-Runtime
Message: Failed with 0x80073D02 while installing Microsoft.WindowsStore
```

---

## 🧠 Interpretation

- The Store is a core UWP app used for AppX provisioning, updates, and user-installed software.
- Its absence blocks access to other Store-only apps (e.g., Maps, MyASUS).
- Recovery is possible via Winget or manual AppX registration.

---

## 📁 Source Availability

| Source | Status | Notes |
|--------|--------|-------|
| Winget | ✅ Available | `winget install Microsoft.WindowsStore` |
| Microsoft Store | ✅ Available | Requires network and user context |
| PC-X | ✅ Present | Can be extracted from `WindowsApps` folder

---

## 🛠️ Suggested Remediation

1. **Install via Winget**
   ```powershell
   winget install Microsoft.WindowsStore --silent
   ```

2. **Embed AppX bundle in ISO**
   - Place `.appx` or `.msixbundle` in `\sources\$OEM$\$1\AppX\`
   - Register via post-install script:
     ```powershell
     Add-AppxPackage -Path "C:\AppX\Microsoft.WindowsStore.appx"
     ```

3. **Verify installation**
   ```powershell
   Get-AppxPackage -Name "Microsoft.WindowsStore"
   ```

4. **Optional: Restore Store dependencies**
   - Some apps (e.g., MyASUS) may require Store services to function
   - Consider restoring `Microsoft.NET.Native.Framework.*` and `Microsoft.VCLibs.*` if flagged

---

## 🔗 Related Pages

- [`faults-by-appx.md`](../summaries/faults-by-appx.md)
- [`apps/windowscalculator.md`](windowscalculator.md)
- [`apps/windowsfeedbackhub.md`](windowsfeedbackhub.md)

---

*This page is part of the ASUS G713QM Restoration Project. For full context, see the [GitHub repo](https://github.com/eyeofparadox/ASUS_G713QM_RESTORATION).*  
