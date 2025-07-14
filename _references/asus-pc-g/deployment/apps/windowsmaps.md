windowsmaps.md

---

# 📦 AppX Detail: Windows Maps

**Package Name:** `Microsoft.WindowsMaps`  
**Entry Point:** `App`  
**Status:** Provisioning Failed  
**Source:** Microsoft Store (only)

---

## 📋 Fault Summary

Windows Maps failed to provision during Audit Mode. Logs show:

```
Event ID: 304
Source: AppModel-Runtime
Message: Failed with 0x80073D02 while installing Microsoft.WindowsMaps
```

---

## 🧠 Interpretation

- Windows Maps is a UWP app that relies on location services and online map data.
- It is not available via Winget or as a standalone `.appx` from Microsoft.
- Provisioning failure is expected in offline Audit Mode.

---

## 📁 Source Availability

| Source | Status | Notes |
|--------|--------|-------|
| Winget | ❌ Not available | Not listed in Winget repository |
| Microsoft Store | ✅ Available | Requires network and user context |
| PC-X | ❌ Not present | No cached `.appx` or `.msixbundle` found

---

## 🛠️ Suggested Remediation

1. **Skip unless required**
   - Windows Maps is non-essential for recovery
   - Can be omitted unless needed for branding or location services

2. **Optional: Install via Store post-recovery**
   - Requires network and user login
   - Use:
     ```powershell
     Start-Process "ms-windows-store://pdp/?productid=9WZDNCRFJ3PR"
     ```

3. **Document omission**
   - Flag in `faults-by-appx.md` as intentionally excluded

---

## 🔗 Related Pages

- [`faults-by-appx.md`](../summaries/faults-by-appx.md)
- [`apps/windowscalculator.md`](windowscalculator.md)
- [`apps/windowsfeedbackhub.md`](windowsfeedbackhub.md)

---

*This page is part of the ASUS G713QM Restoration Project. For full context, see the [GitHub repo](https://github.com/eyeofparadox/ASUS_G713QM_RESTORATION).*  
