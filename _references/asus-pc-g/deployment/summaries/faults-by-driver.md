faults-by-driver.md

---

# 🧾 Faults by Driver

**Source:** Event logs from `Microsoft-Windows-Kernel-PnP%4Configuration`  
**Context:** Audit Mode deployment on PC-G with networking disabled  
**Objective:** Identify driver-related failures to inform custom ISO injection strategy

---

## 🔧 Driver Fault Summary

| Device ID | Driver Name | Problem Code | Status | Description | Found in Reset ISO | Notes |
|-----------|-------------|--------------|--------|-------------|---------------------|-------|
| `ACPI\AMDI0010\0` | `oem1.inf` | `0x15` | `0x0` | AMD I2C Controller | ✅ Yes | Likely missing GPIO dependency |
| `PCI\VEN_10DE&DEV_2520&SUBSYS_107C1043&REV_A1\4&1ba6dc09&0&0009` | `display.inf` | `0x1F` | `0xC01E0438` | NVIDIA GPU | ✅ Yes | Fallback to BasicDisplay; OEM driver needed |
| `PCI\VEN_1022&DEV_1634&SUBSYS_16021043&REV_00\3&11583659&0&12` | `pci.inf` | `0x33` | `0x0` | AMD PCI Bridge | ✅ Yes | Chipset driver mismatch or missing |
| `PCI\VEN_1022&DEV_1634&SUBSYS_16021043&REV_00\3&11583659&0&11` | `pci.inf` | `0x33` | `0x0` | AMD PCI Bridge | ✅ Yes | Same as above |
| `ACPI\AMDI0030\0` | `oem0.inf` | `Requires Reboot` | `0x0` | AMD GPIO Controller | ✅ Yes | Installed but pending reboot |
| `ROOT\VOLMGR\0000` | `volmgr.inf` | `Requires Reboot` | `0x0` | Volume Manager | ✅ Yes | Standard Microsoft driver |
| `ROOT\ACPI_HAL\0000` | `hal.inf` | `Requires Reboot` | `0x0` | ACPI HAL | ✅ Yes | Standard Microsoft driver |

---

## 🧠 Interpretation

- **GPU fallback**: NVIDIA device failed to load OEM driver, defaulted to BasicDisplay. Confirm presence of `nv_disp.inf` or equivalent in reset ISO.
- **AMD chipset gaps**: Multiple AMD devices show failed starts or pending configuration. Ensure injection of full chipset suite including GPIO, I2C, and PCI bridge support.
- **HAL and volume manager**: Standard system components flagged for reboot but not updated—normal during early boot phases.

---

## ✅ Recommendations

1. **Inject verified OEM drivers into custom ISO**
   - AMD chipset (PCI, GPIO, I2C)
   - NVIDIA GPU (matching `DEV_2520`)
   - Any `.inf` files referenced (`oem0.inf`, `oem1.inf`)

2. **Reboot after driver injection**
   - Several devices are pending configuration and won’t stabilize until reboot completes

3. **Verify driver ranks and matching IDs**
   - Use `pnputil /enum-drivers` and `driverquery` to confirm active vs. outranked drivers

4. **Document driver provenance**
   - Include a manifest of injected drivers and their source (ASUS reset ISO, extracted from factory image, etc.)

---

## 📁 Suggested Linked Pages

- [`drivers/acpi-amdi0010.md`](../drivers/acpi-amdi0010.md)
- [`drivers/pci-ven1022-dev1634.md`](../drivers/pci-ven1022-dev1634.md)
- [`drivers/nvidia-dev2520.md`](../drivers/nvidia-dev2520.md)
- [`drivers/amdgpio.md`](../drivers/amdgpio.md)

---

*This summary is part of the ASUS G713QM Restoration Project. For full context, see the [GitHub repo](https://github.com/eyeofparadox/ASUS_G713QM_RESTORATION).*  
