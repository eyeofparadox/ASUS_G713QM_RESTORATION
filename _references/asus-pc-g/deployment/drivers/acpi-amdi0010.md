acpi-amdi0010.md

---

# 🔧 Driver Detail: ACPI\AMDI0010

**Device ID:** `ACPI\AMDI0010\0`  
**Driver Name:** `oem1.inf`  
**Problem Code:** `0x15`  
**Status:** `0x0`  
**Description:** AMD I2C Controller

---

## 📋 Fault Summary

This device failed to start during Audit Mode. The logs show:

```
Event ID: 411
Driver Name: oem1.inf
Device Instance ID: ACPI\AMDI0010\0
Problem Code: 0x15
Problem Status: 0x0
```

---

## 🧠 Interpretation

- **Problem Code 0x15** indicates a failed start due to missing dependencies or improper initialization.
- This controller is part of AMD’s GPIO/I2C subsystem and often requires:
  - `amdgpio2.sys`
  - `amd_i2c.sys`
  - Proper chipset initialization order

---

## 📁 Source Availability

| Source | Status | Notes |
|--------|--------|-------|
| ASUS Reset ISO | ✅ Present | Confirmed in `ASUS_G513QM_2009_X64_V0.11--Index.txt` |
| Windows Inbox | ❌ Not sufficient | Generic drivers do not support this device |
| AMD Chipset Installer | ✅ Available | Can be sourced from AMD’s support site |

---

## 🛠️ Suggested Remediation

1. **Inject AMD chipset drivers into custom ISO**
   - Include `oem1.inf`, `amdgpio2.sys`, and related `.cat` files
   - Use `DISM` to add to `install.wim` or `boot.wim` if needed

2. **Ensure proper driver ranking**
   - Use `pnputil /enum-drivers` to verify active vs. fallback drivers

3. **Script post-install verification**
   ```powershell
   Get-PnpDevice -FriendlyName "*I2C*" | Select-Object Status, Problem
   ```

---

## 🔗 Related Pages

- [`faults-by-driver.md`](../summaries/faults-by-driver.md)
- [`drivers/amdgpio.md`](amdgpio.md)
- [`tools/asusinswiz.md`](../tools/asusinswiz.md)

---

*This page is part of the ASUS G713QM Restoration Project. For full context, see the [GitHub repo](https://github.com/eyeofparadox/ASUS_G713QM_RESTORATION).*  
