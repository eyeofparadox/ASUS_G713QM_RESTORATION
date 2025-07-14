amdgpio.md

---

# 🔧 Driver Detail: AMD GPIO Controller

**Device ID:** `ACPI\AMDI0030\0`  
**Driver Name:** `oem0.inf`  
**Status:** `Requires Reboot`  
**Description:** AMD GPIO Controller

---

## 📋 Fault Summary

This device was detected and its driver installed, but flagged as pending reboot:

```
Event ID: 400
Driver Name: oem0.inf
Device Instance ID: ACPI\AMDI0030\0
Problem Code: Reboot Required
Problem Status: 0x0
```

---

## 🧠 Interpretation

- The GPIO controller is part of AMD’s chipset suite and often paired with:
  - `amdgpio2.sys`
  - `amd_i2c.sys`
- The reboot requirement suggests the driver was staged correctly but not initialized due to Audit Mode constraints.

---

## 📁 Source Availability

| Source | Status | Notes |
|--------|--------|-------|
| ASUS Reset ISO | ✅ Present | Confirmed in `ASUS_G513QM_2009_X64_V0.11--Index.txt` |
| Windows Inbox | ❌ Not sufficient | Generic GPIO drivers do not support AMD-specific extensions |
| AMD Chipset Installer | ✅ Available | Can be sourced from AMD’s support site |

---

## 🛠️ Suggested Remediation

1. **Inject AMD GPIO driver into custom ISO**
   - Include `oem0.inf`, `amdgpio2.sys`, and related `.cat` files
   - Use `DISM` to add to `install.wim`

2. **Ensure reboot occurs post-install**
   - Use `SetupComplete.cmd` to trigger a controlled reboot
   - Confirm device status with:
     ```powershell
     Get-PnpDevice -FriendlyName "*GPIO*" | Select-Object Status, Problem
     ```

3. **Verify driver ranking**
   - Use `pnputil /enum-drivers` to confirm `oem0.inf` is active

---

## 🔗 Related Pages

- [`faults-by-driver.md`](../summaries/faults-by-driver.md)
- [`drivers/acpi-amdi0010.md`](acpi-amdi0010.md)
- [`tools/asusinswiz.md`](../tools/asusinswiz.md)

---

*This page is part of the ASUS G713QM Restoration Project. For full context, see the [GitHub repo](https://github.com/eyeofparadox/ASUS_G713QM_RESTORATION).*  
