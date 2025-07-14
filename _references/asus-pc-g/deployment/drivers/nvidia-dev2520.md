nvidia-dev2520.md

---

# 🔧 Driver Detail: NVIDIA GPU (DEV_2520)

**Device ID:** `PCI\VEN_10DE&DEV_2520&SUBSYS_107C1043&REV_A1\4&1ba6dc09&0&0009`  
**Driver Name:** `display.inf`  
**Problem Code:** `0x1F`  
**Status:** `0xC01E0438`  
**Description:** NVIDIA GeForce RTX 3060 Laptop GPU

---

## 📋 Fault Summary

This device failed to load its OEM driver and defaulted to BasicDisplay:

```
Event ID: 411
Driver Name: display.inf
Device Instance ID: PCI\VEN_10DE&DEV_2520&SUBSYS_107C1043&REV_A1\4&1ba6dc09&0&0009
Problem Code: 0x1F
Problem Status: 0xC01E0438
```

---

## 🧠 Interpretation

- **Problem Code 0x1F** indicates a driver load failure.
- **Status 0xC01E0438** suggests the driver was incompatible, missing, or blocked by policy.
- The system fell back to `BasicDisplay.sys`, limiting resolution and GPU features.

---

## 📁 Source Availability

| Source | Status | Notes |
|--------|--------|-------|
| ASUS Reset ISO | ✅ Present | Confirmed in `ASUS_G513QM_2009_X64_V0.11--Index.txt` |
| Windows Inbox | ❌ Basic only | Includes fallback driver only |
| NVIDIA OEM Installer | ✅ Available | Use ASUS-specific version for best compatibility |

---

## 🛠️ Suggested Remediation

1. **Inject OEM NVIDIA driver into custom ISO**
   - Include `nv_disp.inf`, `nvlddmkm.sys`, and related `.cat` files
   - Use `DISM` to add to `install.wim`

2. **Verify driver ranking**
   - Ensure `nv_disp.inf` outranks `basicdisplay.inf`
   - Use:
     ```powershell
     pnputil /enum-drivers | findstr /i "nv_disp"
     ```

3. **Script post-install verification**
   ```powershell
   Get-PnpDevice -FriendlyName "*NVIDIA*" | Select-Object Status, Problem
   ```

4. **Optional: Include NVIDIA Control Panel**
   - May require AppX provisioning or separate installer

---

## 🔗 Related Pages

- [`faults-by-driver.md`](../summaries/faults-by-driver.md)
- [`tools/asusinswiz.md`](../tools/asusinswiz.md)

---

*This page is part of the ASUS G713QM Restoration Project. For full context, see the [GitHub repo](https://github.com/eyeofparadox/ASUS_G713QM_RESTORATION).*  
