windowscalculator.md

---

# 📦 AppX Detail: Windows Calculator

**Package Name:** `Microsoft.WindowsCalculator`  
**Entry Point:** `App`  
**Status:** Provisioning Failed  
**Source:** Winget, Microsoft Store

---

## 📋 Fault Summary

Windows Calculator failed to provision during Audit Mode. Logs show:

```
Event ID: 304
Source: AppModel-Runtime
Message: Failed with 0x80073D02 while installing Microsoft.WindowsCalculator
```

---

## 🧠 Interpretation

- Calculator is a lightweight UWP app often provisioned during OOBE.
- Audit Mode with networking disabled blocks AppX provisioning.
- The app is available via Winget and can be scripted for recovery.

---

## 📁 Source Availability

| Source | Status | Notes |
|--------|--------|-------|
| Winget | ✅ Available | `winget install Microsoft.WindowsCalculator` |
| Microsoft Store | ✅ Available | Requires user context and network |
| PC-X | ✅ Present | Can be extracted from `WindowsApps` folder if needed

---

## 🛠️ Suggested Remediation

1. **Install via Winget**
   ```powershell
   winget install Microsoft.WindowsCalculator --silent
   ```

2. **Embed AppX bundle in ISO (optional)**
   - Place `.appx` or `.msixbundle` in `\sources\$OEM$\$1\AppX\`
   - Register via post-install script:
     ```powershell
     Add-AppxPackage -Path "C:\AppX\Microsoft.WindowsCalculator.appx"
     ```

3. **Verify installation**
   ```powershell
   Get-AppxPackage -Name "Microsoft.WindowsCalculator"
   ```

---

## 🔗 Related Pages

- [`faults-by-appx.md`](../summaries/faults-by-appx.md)
- [`apps/windowsstore.md`](windowsstore.md)
- [`apps/windowsfeedbackhub.md`](windowsfeedbackhub.md)

---

*This page is part of the ASUS G713QM Restoration Project. For full context, see the [GitHub repo](https://github.com/eyeofparadox/ASUS_G713QM_RESTORATION).*  
