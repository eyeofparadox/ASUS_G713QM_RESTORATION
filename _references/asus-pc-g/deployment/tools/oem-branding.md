oem-branding.md

---

# 🧰 Support Software Detail: OEM Branding Assets

**Component:** ASUS OEM Branding  
**Status:** Not Applied  
**Provisioning:** Blocked during Audit Mode  
**Source:** ASUS Reset ISO

---

## 📋 Fault Summary

OEM branding assets—including wallpapers, recovery info, and registry keys—were not applied during Audit Mode. Logs show:

```
Event ID: 1001
Source: Shell-Core
Message: OEM branding registry keys not found
```

---

## 🧠 Interpretation

- Branding assets typically include:
  - `OEMInformation` registry keys
  - Wallpapers and lock screen images
  - Recovery environment branding
- These are applied via AsusInsWiz or during OOBE provisioning.
- Audit Mode with networking disabled prevents automatic branding.

---

## 📁 Source Availability

| Source | Status | Notes |
|--------|--------|-------|
| ASUS Reset ISO | ✅ Present | Confirmed in `ASUS_G513QM_2009_X64_V0.11--Index.txt` |
| ASUS Support Site | ❌ Not standalone | Usually bundled with OEM installers |
| Microsoft Store | ❌ Not applicable | Not AppX-based

---

## 🛠️ Suggested Remediation

1. **Apply registry branding manually**
   - Create `oem-branding.reg` with:
     ```reg
     [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation]
     "Manufacturer"="ASUSTeK COMPUTER INC."
     "Model"="G713QM"
     "SupportURL"="https://www.asus.com/support/"
     ```

2. **Include wallpapers and assets in ISO**
   - Place in `\sources\$OEM$\$1\Branding\`
   - Copy to `%ProgramData%\ASUS\Branding\` via `SetupComplete.cmd`

3. **Verify branding post-install**
   - Check `System Properties` for OEM info
   - Confirm lock screen and wallpaper assets are applied

---

## 🔗 Related Pages

- [`faults-by-support-software.md`](../summaries/faults-by-support-software.md)
- [`tools/asusinswiz.md`](asusinswiz.md)

---

*This page is part of the ASUS G713QM Restoration Project. For full context, see the [GitHub repo](https://github.com/eyeofparadox/ASUS_G713QM_RESTORATION).*  
