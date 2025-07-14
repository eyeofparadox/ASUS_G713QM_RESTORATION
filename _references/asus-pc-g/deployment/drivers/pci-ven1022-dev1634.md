pci-ven1022-dev1634.md

---

# 🔧 Driver Detail: AMD PCI Bridge (DEV_1634)

**Device ID(s):**  
- `PCI\VEN_1022&DEV_1634&SUBSYS_16021043&REV_00\3&11583659&0&12`  
- `PCI\VEN_1022&DEV_1634&SUBSYS_16021043&REV_00\3&11583659&0&11`  

**Driver Name:** `pci.inf`  
**Problem Code:** `0x33`  
**Status:** `0x0`  
**Description:** AMD PCI Express Root Complex

---

## 📋 Fault Summary

These devices were detected but flagged with problem code `0x33`:

```
Event ID: 411
Driver Name: pci.inf
Device Instance ID: PCI\VEN_1022&DEV_1634&...
Problem Code: 0x33
Problem Status: 0x0
```

---

## 🧠 Interpretation

- **Problem Code 0x33** typically indicates a driver mismatch or fallback to a generic PCI driver.
- These bridges are part of AMD’s chipset and require proper initialization order alongside GPIO and I2C controllers.
- The system may have used `pci.inf` from Windows Inbox, which lacks AMD-specific optimizations.

---

## 📁 Source Availability

| Source | Status | Notes |
|--------|--------|-------|
| ASUS Reset ISO | ✅ Present | Confirmed in `ASUS_G513QM_2009_X64_V0.11--Index.txt` |
| Windows Inbox | ✅ Generic only | May cause performance or compatibility issues |
| AMD Chipset Installer | ✅ Recommended | Ensures full feature support and ranking

---

## 🛠️ Suggested Remediation

1. **Inject AMD chipset drivers into custom ISO**
   - Include `.inf`, `.sys`, and `.cat` files for PCI bridge support
   - Use `DISM` to add to `install.wim`

2. **Ensure proper driver ranking**
   - Confirm AMD driver outranks generic `pci.inf`
   - Use:
     ```powershell
     pnputil /enum-drivers | findstr /i "pci"
     ```

3. **Script post-install verification**
   ```powershell
   Get-PnpDevice -FriendlyName "*PCI*" | Select-Object Status, Problem
   ```

---

## 🔗 Related Pages

- [`faults-by-driver.md`](../summaries/faults-by-driver.md)
- [`drivers/amdgpio.md`](amdgpio.md)
- [`drivers/acpi-amdi0010.md`](acpi-amdi0010.md)

---

*This page is part of the ASUS G713QM Restoration Project. For full context, see the [GitHub repo](https://github.com/eyeofparadox/ASUS_G713QM_RESTORATION).*  
