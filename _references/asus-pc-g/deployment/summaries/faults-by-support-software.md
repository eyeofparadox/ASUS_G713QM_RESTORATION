faults-by-support-software.md

---

# 🧾 Faults by Support Software

**Source:** Event logs from `Microsoft-Windows-Shell-Core`, `AppModel-Runtime`, and provisioning traces  
**Context:** Audit Mode deployment on PC-G with networking disabled  
**Objective:** Identify ASUS tools and system services that failed to initialize or were missing

---

## 🧩 Support Software Fault Summary

| Component | Status | Found in Reset ISO | Notes |
|-----------|--------|---------------------|-------|
| **AsusInsWiz** | Not initialized | ✅ Yes | Core installer for ASUS drivers and tools; must be scripted |
| **Armoury Crate** | Not present | ✅ Yes | May require network or Store provisioning; consider offline installer |
| **MyASUS** | Not present | ✅ Yes | Often bundled with AsusInsWiz; check for dependencies |
| **HAL Extensions** | Partial | ✅ Yes | `hal.inf` flagged for reboot; standard ACPI HAL used |
| **OEM Registry Keys** | Not applied | ✅ Yes | May require AsusInsWiz or manual import |
| **ASUS System Services** | Not running | ✅ Yes | Includes telemetry, hotkey, and fan control services |
| **OEM Branding Assets** | Not applied | ✅ Yes | Wallpapers, OEM info, and recovery branding

---

## 🧠 Interpretation

- **AsusInsWiz is the keystone**: It likely orchestrates driver installation, registry tweaks, and branding. Must be run post-install or scripted via `SetupComplete.cmd`.
- **Armoury Crate and MyASUS**: These may require Store access or AppX provisioning. If unavailable via Winget, use ASUS’s offline installers.
- **HAL and system services**: Standard components flagged for reboot; no critical faults, but branding and telemetry may be missing.

---

## ✅ Recommendations

1. **Script AsusInsWiz execution post-install**
   - Silent mode if available
   - Include in `\sources\$OEM$\$1\Install\` and call from `SetupComplete.cmd`

2. **Include offline installers for Armoury Crate and MyASUS**
   - Extract from reset ISO or download from ASUS support site
   - Avoid Store dependency if possible

3. **Apply OEM registry keys manually if AsusInsWiz doesn’t**
   - Use `.reg` files or PowerShell import

4. **Verify HAL and ACPI extensions**
   - Confirm `hal.inf` is properly ranked and initialized post-reboot

---

## 📁 Suggested Linked Pages

- [`tools/asusinswiz.md`](../tools/asusinswiz.md)
- [`tools/armourycrate.md`](../tools/armourycrate.md)
- [`tools/myasus.md`](../tools/myasus.md)
- [`tools/oem-branding.md`](../tools/oem-branding.md)

---

*This summary is part of the ASUS G713QM Restoration Project. For full context, see the [GitHub repo](https://github.com/eyeofparadox/ASUS_G713QM_RESTORATION).*  
