windowsfeedbackhub.md

---

# 📦 AppX Detail: Windows Feedback Hub

**Package Name:** `Microsoft.WindowsFeedbackHub`  
**Entry Point:** `App`  
**Status:** Provisioning Failed  
**Source:** Winget, Microsoft Store

---

## 📋 Fault Summary

Feedback Hub failed to provision during Audit Mode. Logs show:

```
Event ID: 304
Source: AppModel-Runtime
Message: Failed with 0x80073D02 while installing Microsoft.WindowsFeedbackHub
```

---

## 🧠 Interpretation

- Feedback Hub is a UWP app used for submitting diagnostics and feedback to Microsoft.
- It’s non-critical for offline recovery but may be useful for telemetry or completeness.
- Available via Winget and can be scripted for recovery.

---

## 📁 Source Availability

| Source | Status | Notes |
|--------|--------|-------|
| Winget | ✅ Available | `winget install Microsoft.WindowsFeedbackHub` |
| Microsoft Store | ✅ Available | Requires network and user context |
| PC-X | ✅ Present | Can be extracted from `WindowsApps` folder if needed

---

## 🛠️ Suggested Remediation

1. **Install via Winget**
   ```powershell
   winget install Microsoft.WindowsFeedbackHub --silent
   ```

2. **Embed AppX bundle in ISO (optional)**
   - Place `.appx` or `.msixbundle` in `\sources\$OEM$\$1\AppX\`
   - Register via post-install script:
     ```powershell
     Add-AppxPackage -Path "C:\AppX\Microsoft.WindowsFeedbackHub.appx"
     ```

3. **Verify installation**
   ```powershell
   Get-AppxPackage -Name "Microsoft.WindowsFeedbackHub"
   ```

---

## 🔗 Related Pages

- [`faults-by-appx.md`](../summaries/faults-by-appx.md)
- [`apps/windowscalculator.md`](windowscalculator.md)
- [`apps/windowsstore.md`](windowsstore.md)

---

*This page is part of the ASUS G713QM Restoration Project. For full context, see the [GitHub repo](https://github.com/eyeofparadox/ASUS_G713QM_RESTORATION).*  
