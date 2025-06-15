## ASUS ROG Strix G17 G713QM - Gestalt Spec-Sheet

### **Overview**

**Device Serial:** M4NRKD016818172  
**Primary Unit Designation:** G713QM-ES94  
**System Alias (MS):** LAPTOP-RE37GQQE / DESKTOP-22G3P3U  
**Audit Window:** 2021–2025  
**Operating Systems Logged:** Windows 10 Home, Windows 11 Home  
**Activation:** Digital license linked to Microsoft account  
**BitLocker Escrow:** Active as of 2021-10-01

---

### **Hardware Core**
| Component        | Details                                                                 |
|------------------|-------------------------------------------------------------------------|
| **CPU**          | AMD Ryzen 9 5900HX (8C/16T, 20MB cache, up to 4.6GHz)                   |
| **iGPU**         | AMD Radeon Graphics (0x1638, DX12-capable)                              |
| **dGPU**         | NVIDIA GeForce RTX 3060 Laptop (6GB GDDR6, Boost 1802MHz @ 130W)        |
| **RAM**          | 16GB DDR4-3200 SO-DIMM (15.8GB addressable, dual-channel)               |
| **Storage**      | 1TB PCIe 3.0 NVMe SSD (HFM001TD3JX013N); SKU originally 512GB           |
| **Display**      | 17.3" FHD (1920×1080), 144Hz, IPS-level, sRGB 62.5%, Anti-glare         |
| **Networking**   | MediaTek MT7921, Intel AX200 Wi-Fi 6, Realtek RTL8111H, RangeBoost      |
| **Bluetooth**    | MediaTek, Intel, and IVT Bluetooth stacks detected                      |
| **Ports**        | 3x USB 3.2 Gen 1 Type-A, 1x USB-C Gen 2 (DP/PD/G-SYNC), HDMI 2.0b, RJ45 |
| **Battery**      | 90Wh, 4-cell Li-ion                                                     |
| **Audio**        | Realtek ALC285, Dolby Atmos, SmartAmp, Logitech PRO X, NVIDIA Broadcast|

---

### **BIOS & Firmware Evolution**
| Date       | Version | Channel       | Notes                                   |
|------------|---------|---------------|-----------------------------------------|
| Nov 2022   | 321     | Windows       | Stable baseline                         |
| Mar 2023   | 331     | Windows & EZF | Final recorded update, aligns with UEFI |

---

### **Driver Timeline Highlights**

**Chipset & Power:**
- AMD Chipset 1.2.0.117 ? 1.2.0.118  
- ASUS System Control Interface v3 ? V3.1.43.0  
- Armoury Crate ecosystem (v3.2.9.1 ? v3.3.1.0)  

**Graphics Stack:**
- NVIDIA: V30.0.15.1278 + Control Panel App  
- AMD: V30.0.13002.19003 (iGPU), Radeon UWP stack present  

**Audio:**
- Realtek V6.0.9394.1 ? V6.0.9809.1 + Console App  
- Additional devices: Logitech, NVIDIA HD Audio, Microsoft A2DP  

**Networking:**
- Intel WLAN: V22.130.0.5 ? V22.230.0.8  
- MediaTek WLAN: V3.00.01.1294 ? V3.00.01.1325  
- IVT, Intel, and MediaTek BT drivers; PAN & COM buses present  

**Input / Peripheral Stack:**
- ASUS Precision Touchpad: V11.0.0.35 ? V16.0.0.32  
- SteelSeries: Aerox 5, Apex 7, Apex Pro TKL Wireless  
- Creative Tools: GAOMON, XP-Pen, Guillemot TCA, Razer peripherals  

---

### **Security & Entitlement**
- **TPM:** Firmware-based  
- **Secure Boot:** Enabled  
- **Activation:** Windows 11 digital license linked to MS account  
- **BitLocker Key Registered:** Oct 2021  
- **Recovery Support Tools:** MyASUS, BIOS Utility EZ Flash

---

### **OEM & SKU Footprint**
| Attribute         | Value                         |
|------------------|-------------------------------|
| OEM Color         | Eclipse Grey                  |
| Weight            | 5.95 lbs                      |
| Dimensions (L×W×H)| 15.55" × 11.1" × 1.11"        |
| Initial SSD Size  | 512GB (per retail spec)       |
| Registered Country| USA                           |

---

## Expansion Sections

1. **Section 1: Device Identity & Provenance** — A detailed Markdown draft capturing all known aliases, serials, OS builds, activation metadata, and BitLocker keys. This will be the cornerstone of the full gestalt dossier.

2. **Markdown + JSON Schema Design** — Structured to mirror each other for human readability and automation. I’ll show you the format so we can lock it in before expanding across all layers.

3. **Full Gestalt Progress Tracker** — A live map of what's been covered (hardware, firmware, drivers, peripherals) and what’s in the queue. It’ll help steer the next sections.

4. **Integrity Flags & Conflicts** — I’m isolating all version variances, overlapping devices (e.g. MediaTek + Intel WLAN), and unexpected entries (like IVT Bluetooth or VMCI Host) so we can annotate them cleanly.

---

### **JSON Skeleton** : [ASUS ROG Strix G17 G713QM Gestalt Spec-Sheet.json](./ASUS%20ROG%20Strix%20G17%20G713QM%20Gestalt%20Spec-Sheet.json)

---

# Section 1: Device Identity & Provenance

## 1.1 System Aliases and Reported Names

- **OEM Designation:** ASUS ROG Strix G17 G713QM-ES94  
- **Alternate Model Reference:** G713QM-HX016T  
- **Device Names:**
  - LAPTOP-RE37GQQE
  - DESKTOP-22G3P3U  
- **Hardware Platform:** PC  
- **Color / Finish:** Eclipse Grey  
- **Registration Date:** 2021-10-02  
- **Serial Number:** M4NRKD016818172  
- **Warranty Status (as of capture):** Expired  
- **Weight:** 5.95 lbs  
- **Dimensions (inches):** 15.55 x 11.1 x 1.11

## 1.2 OS Lineage and Build Drift

| Snapshot Date     | OS Edition        | Version | Build Number     | Notes                         |
|-------------------|------------------|---------|------------------|-------------------------------|
| 2021-10-01        | Windows 11 Home   | 2009    | 10.0.26100.3194  | BitLocker escrow active       |
| 2022-09-07        | Windows 10 Home   | 19044   | vb_release.191206-1406 | DxDiag snapshot            |
| [Unspecified]     | Windows 10 Home   | 2009    | 10.0.22631.2861  | Later driver suite reference  |

**Note:** Discrepancies between OS version 2009 (21H2) and 19044 suggest either in-place downgrade/reinstall or snapshot across dual configurations. This system has operated across both Windows 10 and Windows 11 during its lifecycle.

## 1.3 Licensing and Activation

- **Activation Type:** Digital license (digitally entitled)
- **License Status:** Confirmed active as of final snapshot
- **Microsoft Account:** Linked (per MS Activation log)
- **BitLocker Recovery Key:**  
  - **Device Name:** LAPTOP-RE37GQQE  
  - **Drive:** OSV  
  - **Key Upload Timestamp:** 2021-10-01 17:52:00  

## 1.4 System Identity Checkpoints

- **BIOS Model String:** G713QM_G713QM  
- **System Type (DxDiag):** ROG Strix G713QM_G713QM  
- **Trusted Platform Module (TPM):** Present (Firmware TPM)  
- **UEFI Boot:** Enabled  

## 1.5 Observed Discrepancies

| Field                  | Value A                                 | Value B                                | Interpretation                        |
|------------------------|------------------------------------------|----------------------------------------|----------------------------------------|
| Storage Capacity       | 512 GB (OEM)                             | 1 TB NVMe (installed)                  | User-upgraded or alternate SKU         |
| OS Build Lineage       | 10.0.19044 (2022)                        | 10.0.22631 (later), 10.0.26100 (Win11) | System upgraded through major builds   |
| RAM Reported           | 16 GB (base)                             | 15 GB (reported free)                  | ~1GB reserved for iGPU or hardware     |
| Device Name/Identity   | LAPTOP-RE37GQQE                          | DESKTOP-22G3P3U                        | Possible naming drift over reinstalls  |

## 1.6 Licensing Notes from Microsoft Support

- The system’s activation was successfully linked to David Roberson’s Microsoft account.
- Reinstallation is supported via **digital entitlement**, no product key required.
- Activation status was recorded as "Windows is activated with a digital license linked to your Microsoft account."

---

# Section 2: Hardware & Component Stack

## 2.1 Core Processing

- **CPU:**  
  - AMD Ryzen 9 5900HX  
  - 8 Cores / 16 Threads  
  - 20MB cache, up to 4.6GHz boost  
  - Integrated GPU: AMD Radeon Graphics (0x1638)  
  - **Observed Base Clock Drift:**  
    - ~3.3GHz reported via DxDiag  
    - Turbo scaling confirmed via ASUS and OEM spec

## 2.2 Memory

- **Total Installed RAM:** 16GB DDR4-3200 (SO-DIMM x2)  
- **Effective Available to OS:**  
  - 15.8GB (2022 DxDiag snapshot)  
  - 15.0GB (Windows activation report)  
  - **Interpretation:** Variance due to memory reserved for iGPU  
- **Memory Configuration:**  
  - Dual-channel confirmed  
  - Max capacity: 32GB supported

## 2.3 Storage Devices

| Drive | Capacity (GB) | Model                         | Interface | Notes                                |
|-------|----------------|-------------------------------|-----------|--------------------------------------|
| C:    | 955.6          | HFM001TD3JX013N               | PCIe 3.0  | NVMe M.2 SSD (OS drive)              |
| D:    | 3815.4         | WD My Book 25EE               | USB / exFAT | External archive                    |
| E:    | 953.8          | WD My Passport 25E1           | USB       | External                              |
| F:    | 3815.4         | WD My Passport 2626           | USB       | External                              |
| G:    | 2861.6         | WD My Passport 259F           | USB       | External                              |

**OEM Declared Storage:**  
- 512GB NVMe M.2 SSD (per retail listing)  
- 1TB NVMe M.2 SSD (per ASUS support entry)

**Conflict Note:** Indicates aftermarket upgrade or SKU variation.

## 2.4 Display

- **Size:** 17.3″  
- **Resolution:** 1920×1080 (FHD)  
- **Panel Type:** IPS-level (Value class)  
- **Refresh Rate:** 144Hz  
- **Color Specs:**  
  - sRGB: 62.5%  
  - AdobeRGB: 47.34%  
- **Adaptive-Sync:** Supported  
- **Optimus / Hybrid Graphics:** Enabled  

## 2.5 Discrete GPU

- **Model:** NVIDIA GeForce RTX 3060 Laptop  
- **VRAM:** 6GB GDDR6  
- **Boost Clock:** Up to 1802MHz (with ROG Boost @ 130W Dynamic)  
- **Detected Display Memory (Windows):** 13.9GB total  
- **Shared Memory:** 7.9GB  
- **Hybrid Graphics Behavior:** Microsoft Graphics Hybrid enabled  
- **Detachable:** No  
- **NVIDIA Control Panel:** Installed via UWP/MS Store

## 2.6 Integrated GPU

- **Model:** AMD Radeon Graphics  
- **Chip ID:** 0x1638  
- **Dedicated Memory:** 496MB  
- **Shared Memory:** 7.9GB  
- **HDR Support:** Not supported  
- **Topology:** Detected as part of display chain  
- **Driver Lineage:** V30.0.13002.19003, later 31.0.x confirmed

## 2.7 Audio Devices

- **Primary Codec:** Realtek ALC285 / ALC3288  
- **Driver Versions Observed:**  
  - V6.0.9394.1  
  - V6.0.9809.1  
- **Additional Audio Outputs:**  
  - NVIDIA High Definition Audio (HDA)  
  - AMD High Definition Audio  
  - Logitech PRO X Gaming Headset  
  - Microsoft A2DP Bluetooth Audio  
  - NVIDIA Broadcast Virtual Audio  

## 2.8 Input Devices

- **Touchpad:** ASUS Precision Touchpad (SC976A-32H0)  
  - Drivers: V11.0.0.35 → V16.0.0.32  
- **NumberPad:** ASUS Chicony G2ASG5330Z-CO01  
- **HID Devices Detected:**  
  - SteelSeries Apex 7  
  - Aerox 5  
  - Apex Pro TKL Wireless  
  - Logitech Unifying Receiver  
  - XP-Pen Tablet  
  - GAOMON Digitizer  
  - Razer HID Keyboard  
  - Xenx Pen  
  - Guillemot Flight Controllers (T.A320 Pilot, TCA Quadrant)  
  - Koga Touchscreen  
- **Input Bus Conflicts:**  
  - Multiple HID vendors coexisting; conflict risk low but precision tuning likely needed

## 2.9 Optical and Legacy Media

- **Optical Drive:** None (confirmed by OEM and system scan)

---

# Section 3: BIOS & Firmware Lineage

## 3.1 BIOS Versions Observed

| Version | Delivery Channel    | Release Date | SHA-256 Checksum | Notes |
|---------|---------------------|--------------|------------------|-------|
| 321     | Windows Update      | 2022-11-11   | 1DEFDD8BF3B4C7F430F9F3D7E34D77869934DF14B62111D8122CB9AEE390BE05 | Stable baseline build |
| 321     | ASUS EZ Flash       | 2022-11-11   | 819DB3C1CF19D27F7E65EDAE0117DF7DA471E9FAD33801E179FA2BD88A692EFD | Mirror of above release |
| 331     | Windows Update      | 2023-03-31   | 041798044350195B3D74A6F54BCC727B3CE4E8D2590B24D97056C8073CCA58CE | Noted as performance-optimized |
| 331     | ASUS EZ Flash       | 2023-03-31   | FBA7D2B13A9AA1E901210A4DD9487162C1CB9DB56483B1009A7DA75FAAECB555 | Identical functionally, alternate installer |

**Summary Notes:**
- BIOS versions 321 and 331 exist in both Windows-based and EZ Flash forms, with matching payload sizes (7.99–9.46MB).
- Firmware packages include full UEFI interface control, verified for Secure Boot and TPM interfacing.
- SHA-256 hashes recorded for integrity and archival purposes.

## 3.2 Firmware Risk Flags (from ASUS documentation)

- Updates may trigger system black screen if interrupted or corrupted.
- Yellow bang in Device Manager (firmware node) documented after update failure or rollback.
- Caution flags present: firmware can be modified via Windows Update silently.

## 3.3 Ancillary Firmware Interfaces

### MyASUS in UEFI BIOS
- Interface includes support for:
  - Battery health management
  - Fan profiles (when paired with Armoury Crate)
  - Recovery environment fallback
- Linked to `MyASUS UWP` app via system control layers (see Section 4)

### TPM (Trusted Platform Module)
- Implementation: **Firmware TPM** (not discrete)
- Linked to BitLocker key recovery and device identity binding
- No known TPM firmware upgrade or reset events captured

### Secure Boot & Bootloader State
- **Secure Boot:** Enabled by default
- **Boot Mode:** UEFI
- No legacy/CSM fallbacks observed in any snapshot

---

# Section 4: Drivers & Devices

## 4.1 Networking Drivers

### Wired LAN
- **Device:** Realtek RTL8111H
- **Driver Versions:**
  - V10.045.0928.2020
  - V10.049.0413.2021
- **SHA-256:**
  - F3A10C761926...
  - EE94B3F80771...

### Wireless LAN (Coexisting)
- **MediaTek MT7921**
  - Driver Versions:
    - V3.00.01.1294 (2023-05-02)
    - V3.00.01.1325 (2024-06-06)
    - Version 25.040.2.0577 also observed
  - Device IDs: AW-XB468NF / PCI\VEN_14C3&DEV_7961

- **Intel Wi-Fi 6 AX200**
  - Driver Versions:
    - V22.130.0.5 (2022-05-06)
    - V22.230.0.8 (2023-06-15)
    - V23.120.0.3 also reported
  - Device ID: PCI\VEN_8086&DEV_2723

- **Killer 1535 Wireless (Legacy)**
  - Driver Version: V11.0.0.791
  - Device ID: PCI\VEN_168C&DEV_003E

- **Virtual Adapter: Avast SecureLine Wintun**
  - Driver Version: V0.14.1.89
  - INF: aswwintun.inf

## 4.2 Bluetooth Drivers

### Vendor-Specific
- **Intel Wireless Bluetooth**
  - V22.130.0.2 → V22.230.0.2
  - Later version observed: V23.120.0.4
  - INF: ibtusb.inf

- **MediaTek Bluetooth**
  - V1.3.17.155 → V1.3.17.162
  - Alternate: V1.1042.0.506
  - INF: mtkbtfilter.inf

- **IVT Bluetooth Stack**
  - BT Audio Bus: V6.2.84.265 (ivtbtbus.inf)
  - BT COM Bus: V6.2.84.269 (btcombus.inf)
  - BT PAN Bus: V6.2.84.265 (btnetbus.inf)

**Note:** Presence of multiple Bluetooth stacks (IVT, Intel, MediaTek) may indicate driver layering, VM passthrough attempts, or legacy COM-based software interoperability.

## 4.3 Graphics Drivers

### Discrete (NVIDIA GeForce RTX 3060)
- Version: V30.0.15.1278
- SHA-256: 16DFD4A1EED8...
- INF: GN20-E5/GN20-P0 class
- NVIDIA Control Panel App: Installed from Microsoft Store

### Integrated (AMD Radeon Graphics)
- Driver Version: V30.0.13002.19003 → V31.0.12019.9007
- INF: u0382658_nzparser.inf
- HDR: Not supported
- DAC: Internal

## 4.4 Audio Drivers

- **Realtek High Definition Audio**
  - INF: hdxrt.inf
  - Version: 6.0.9239.1

- **Realtek Audio Console (UWP)**
  - INF: hdxacpasus.inf
  - Version: 6.0.9809.1

- **Realtek Codec Console App**
  - SHA-256: 0E85292F...

- **Logitech PRO X Gaming Headset**
  - Version: 2021.1.1365.0
  - INF: logi_audio.inf

- **NVIDIA High Definition Audio**
  - Version: 1.3.38.60
  - INF: nvhda.inf

- **AMD High Definition Audio Bus**
  - Version: 16.40.0.0000
  - INF: amdkmafd.inf

- **Microsoft Bluetooth A2DP Audio**
  - Version: 1.6.0.1
  - INF: alta2dp.inf

- **NVIDIA Broadcast Audio (Virtual)**
  - Version: 1.0.0.5
  - INF: nvrtxvad.inf

## 4.5 System Chipsets & Controllers

- **AMD Chipset**
  - V1.2.0.117 → V1.2.0.118
  - INF: multiple

- **AMD Audio CoProcessor**
  - Version: 6.0.0.90
  - INF: amdacpbus.inf

- **AMDRyzenMaster Driver**
  - Version: 2.9.0.0
  - INF: amdryzenmasterdriver.inf

- **SteelSeries Device Factory**
  - Version: 1.1.4.1
  - INF: ssdevfactory.inf

- **Intel SSD 660p Controller**
  - Version: 4.4.0.1003
  - INF: ianvme.inf

- **VMware VMCI Host (Virtual)**
  - Version: 9.8.18.1
  - INF: vmci.inf

## 4.6 Input & HID Drivers

### ASUS Components
- **Precision Touchpad**
  - Versions: V11.0.0.35 → V16.0.0.32
  - INF: asusptpfilter.inf

- **NumberPad Driver**
  - Version: V12.0.0.36
  - INF: G2ASG5330Z-CO01

### Creative & Gaming HID Stack
- SteelSeries:
  - Apex 7 / Aerox 5 / Apex Pro TKL Wireless
  - INF: sshid.inf (2.10.2.0)

- Logitech:
  - HID Unifying / Consumer Control / Unifying Receiver
  - INF: jfhideqd.inf, jfhidhid.inf

- Razer:
  - HID Keyboard (VID_1532&PID_0098)
  - INF: rzdev_0098_kbd.inf

- XP-PEN Tablet:
  - INF: xppentablet.inf

- GAOMON Digitizer:
  - INF: vmulti.inf

- Guillemot Flight Controls:
  - T.A320 Pilot / TCA Q-Eng 1&2
  - INF: guihidusblowerdevtfh.inf

- Xenx Technology Pen:
  - INF: pendriver.inf

- Koga Touchscreen:
  - INF: kgtchex.inf

## 4.7 Miscellaneous & Other Devices

- **AMD PSP 10.0 (Platform Security Processor)**
  - Version: 4.5.0.0
  - INF: amdpsp.inf

- **Western Digital SES (SmartWare)**
  - INF: oem23.inf

---

# Section 5: Software Control Stack

## 5.1 Armoury Crate Ecosystem

- **Core Installers:**
  - V3.2.9.1 (2023-09-18)
  - V3.3.1.0 (2025-04-09)
- **Installer Notes:**
  - “ArmouryCrateInstallTool.exe” executed post-unpack
  - Enables installation of:
    - Armoury Crate
    - Aura Creator
    - Prerequisite services (RefreshRate Service, Service Layers)
- **OS Requirements:** Windows 10 64-bit, 1709 or newer
- **URL Reference:** https://www.asus.com/support/FAQ/1042484

### Associated Interface Driver
- **Armoury Crate Control Interface:**
  - Version: V1.1.0.0 (2024-10-16)
  - SHA-256: CDD33F5B5386...

## 5.2 Aura & RGB Control

- **Aura Creator:** Installed via Armoury Crate suite
- **Advanced Lighting:** Supported with compatible devices (SteelSeries RGB stack confirmed)

## 5.3 Display Optimization & Refresh Behavior

- **ASUS Smart Display Control:**
  - Version: V1.10.13 (2022-08-08)
  - SHA-256: 99B3C65EDCAC...
  - Function: Adjust refresh rate downward on battery to preserve power

- **Refreshrate Service:**
  - Version: V2.1.0 (2022-11-08)
  - Function: Enables Panel Overdrive
  - Dependency:
    - Armoury Crate UWP ≥ v4.2.5.0
    - Armoury Crate Service ≥ v4.2.10

## 5.4 Multi-Antenna & Signal Optimization

- **ASUS MultiAntenna Service (RangeBoost):**
  - Version: V3.2.3 (2023-08-25)
  - SHA-256: 86E452ED2E...

## 5.5 ASUS System Control Layer

- **ASUS System Control Interface v3:**
  - V3.1.41.0 (2025-02-10)  
    SHA-256: DF7D1E76F77F...
  - V3.1.43.0 (2025-03-13)  
    SHA-256: F7E71B095E3D...
  - Interfaces with:
    - Battery diagnostics
    - Fan curves
    - Power profiles via Armoury Crate
    - MyASUS integration

## 5.6 Wireless and Radio Utilities

- **Wireless Radio Control Driver:**
  - V1.0.0.13 → V1.0.0.14
  - SHA-256:
    - V1.0.0.13: C4E559213CF5...
    - V1.0.0.14: BB31CB5730CB...

## 5.7 MyASUS Portal

- **UWP App:** Installed from Microsoft Store (latest as of 2018-09-17)
- **Functions:**
  - System optimization
  - Update management
  - Cross-device integration (Link to MyASUS)
  - OEM aftersales contact portal

## 5.8 Control Stack Relationships

- **Dependencies:**
  - Aura Creator → Armoury Crate
  - Panel Overdrive → RefreshRate Service → Armoury Crate UWP ≥ v4.2.5.0
  - Battery health + fan tuning → ASUS System Control Interface

- **Conflict Observations:**
  - No recorded stack failure
  - Functionality preserved across multiple BIOS updates

---

# Section 6: Peripheral & Input Profiles

## 6.1 Internal Input Devices

### ASUS Precision Touchpad  
- **Device ID:** HID\ASUE120A&COL02 (SC976A-32H0)  
- **Driver Versions:**  
  - V11.0.0.35 (2021-11-03)  
  - V16.0.0.32 (2024-07-22)  
- **INF:** asusptpfilter.inf  
- **Functionality:** Multi-touch gesture support via Precision Touchpad standard  

### ASUS NumberPad  
- **Device ID:** CHICONY/G2ASG5330Z-CO01  
- **Driver Version:** V12.0.0.36  
- **INF:** n/a (loaded via ASUS Utilities stack)

### Koga Touchscreen  
- **Vendor:** Koga Touch Co., Ltd  
- **Driver Version:** 2.0.20.0810  
- **INF:** kgtchex.inf  
- **Hardware ID:** HID_DEVICE_UP:000D_U:0004  
- **Note:** Presence unexpected; may indicate downstream touch layer support or USB-attached panel

## 6.2 OEM and External Keyboards

- **HID Keyboard Device (Razer)**  
  - **Vendor:** Razer Inc  
  - **Device ID:** HID\VID_1532&PID_0098&MI_01&COL01  
  - **Version:** 6.2.9200.16384  
  - **INF:** rzdev_0098_kbd.inf  

- **SteelSeries Apex 7**  
- **SteelSeries Apex Pro TKL Wireless**  
  - **INF Shared:** sshid.inf  
  - **Version:** 2.10.2.0  
  - **Connection:** USB HID (SteelSeries ApS)

## 6.3 Pointing Devices and Game Mice

- **SteelSeries Aerox 5**  
  - **Vendor:** SteelSeries ApS  
  - **Driver Version:** 2.10.2.0  
  - **INF:** sshid.inf  
  - **Device ID:** USB\VID_1038&PID_1850&MI_00  

- **Dell Universal Receiver**  
  - **Vendor:** Dell  
  - **Version:** 1.0.0.3  
  - **INF:** unifying.inf  
  - **Device ID:** USB\VID_413C&PID_301C&MI_01  

- **Logitech Unifying Receiver (Logicool)**  
  - **INF:** jfhideqd.inf  
  - **Version:** 6.00.45.0  

- **HID-Compliant Consumer Control (Logicool)**  
  - **INF:** jfhidhid.inf  
  - **Device ID:** HID\VID_046D&CLASS_0000001E&COL03  

## 6.4 Creative and Pen Input Devices

- **GAOMON HID Digitizer**  
  - **INF:** vmulti.inf  
  - **Driver Version:** 7.1.7610.16485  
  - **Device ID:** GAOMON\TABLETHID  

- **XP-PEN Tablet**  
  - **INF:** xppentablet.inf  
  - **Driver Version:** 6.1.7600.16385  
  - **Hardware ID:** XPPEN\PENTABLET  

- **Xenx Pen Input**  
  - **Vendor:** Xenx Technology Limited  
  - **INF:** pendriver.inf  
  - **Version:** 6.1.7600.16385  
  - **Device ID:** ROOT\PENDRIVER  

## 6.5 Simulation & Flight Controls

- **Guillemot T.A320 Pilot**  
  - **Vendor:** Guillemot Corporation  
  - **Version:** 1.3.2.0  
  - **INF:** guihidusblowerdevtfh.inf  
  - **Hardware ID:** USB\VID_044F&PID_0405  

- **Guillemot TCA Q-Eng 1&2**  
  - **Vendor:** Guillemot Corporation  
  - **Version:** 1.3.2.0  
  - **INF:** guihidusblowerdevtfh.inf  
  - **Hardware ID:** USB\VID_044F&PID_0407  

## 6.6 Device Driver Overlap and Compatibility Notes

- Multiple vendors (Razer, SteelSeries, Logitech, GAOMON, XP-PEN) coexist in the HID stack without driver conflict reports  
- INF stack redundancy is minimized by shared use of:
  - `sshid.inf` for SteelSeries ecosystem  
  - `jfhideqd.inf`, `jfhidhid.inf` for Logicool inputs  
  - Legacy INF handlers (`vmulti.inf`, `pendriver.inf`) remain active  
- No ghost devices or Input Class Code (0x01) errors reported  

---

# Section 7: Network & Communication Layer

## 7.1 Wired LAN

- **Adapter:** Realtek RTL8111H Gigabit Ethernet Controller  
- **Driver Versions:**
  - V10.045.0928.2020
  - V10.049.0413.2021
- **INF File:** realtek.inf  
- **Interface:** RJ45 (rear-mounted)  
- **Link Status (DxDiag 2022):** Connected at 1 Gbps  
- **Feature Support:** Wake-on-LAN, Jumbo Frame, Energy Efficient Ethernet (EEE)

## 7.2 Wireless LAN (Coexisting Devices)

### Intel Wi-Fi 6 AX200  
- **Interface:** PCIe  
- **Driver Versions:**
  - V22.130.0.5 → V22.230.0.8
  - V23.120.0.3 (alternate capture)  
- **INF File:** netwtw08.inf  
- **Hardware ID:** PCI\VEN_8086&DEV_2723  
- **Remarks:**
  - Included with ROG G713QM in select regional SKUs
  - Fully supported by Microsoft-native stack

### MediaTek Wi-Fi 6 MT7921  
- **Interface:** PCIe  
- **Driver Versions:**
  - V3.00.01.1294 → V3.00.01.1325  
  - Additional: V25.040.2.0577  
- **INF File:** mtkwl6ex.inf  
- **Hardware ID:** PCI\VEN_14C3&DEV_7961  
- **Status:** Coexists with Intel stack (possibly multiboot or VM passthrough residue)  
- **Compatibility:** Known to have intermittent wake/suspend issues pre-2023

### Killer Wireless-n/a/ac 1535 (Legacy)  
- **Vendor:** Qualcomm Atheros  
- **Driver Version:** V11.0.0.791  
- **INF File:** netathr7x.inf  
- **Hardware ID:** PCI\VEN_168C&DEV_003E  
- **Note:** No longer active; may reflect legacy recovery image or device passthrough

## 7.3 Bluetooth Device Stack

### Intel Wireless Bluetooth  
- **Driver Versions:**
  - V22.130.0.2 → V22.230.0.2
  - V23.120.0.4 (also seen)  
- **INF File:** ibtusb.inf  
- **Hardware ID:** USB\VID_8087&PID_0029

### MediaTek Bluetooth Adapter  
- **Driver Versions:**
  - V1.3.17.155 → V1.3.17.162
  - V1.1042.0.506 (2023 capture)  
- **INF File:** mtkbtfilter.inf  
- **Hardware ID:** USB\VID_13D3&PID_3563

### IVT Bluetooth Stack  
- **Components:**
  - IVT Bluetooth Audio Bus – V6.2.84.265 (ivtbtbus.inf)
  - IVT Bluetooth COM Bus – V6.2.84.269 (btcombus.inf)
  - IVT Bluetooth PAN Bus – V6.2.84.265 (btnetbus.inf)
- **Function:** Legacy virtual bus emulation  
- **Note:** Rare in ASUS systems; may indicate bundled software compatibility (e.g. BT audio emulation or VM passthrough)

## 7.4 Signal Optimization and Wireless Services

### ASUS MultiAntenna Service  
- **Version:** V3.2.3  
- **INF:** Installed via ASUS Setup  
- **Function:** Enables ROG RangeBoost technology  
- **Mechanism:** Dynamically selects optimal antenna for multi-spatial propagation  
- **SHA-256:** 86E452ED2E53B013337B12EEBC2CEDC2A6F23FA3D5BB0F6930271C98E6FB1936

### Wireless Radio Control  
- **Versions:** V1.0.0.13 → V1.0.0.14  
- **Function:** Toggles wireless stack via function keys  
- **INF Files:** Confirmed present; controlled via ASUS utility layer  
- **SHA-256:**
  - V1.0.0.13: C4E559213CF58819...
  - V1.0.0.14: BB31CB5730CBE85F...

## 7.5 Network Stack Integrity Notes

- **Coexistence:** Intel and MediaTek WLAN stacks were both active at various points in system lifecycle  
- **Virtual Drivers:**
  - Avast Wintun Adapter: V0.14.1.89 (for VPN tunneling)  
  - IVT BT Stack: May result in dual HID enumeration  
- **Driver Drift:** Intel AX200 and MediaTek MT7921 both updated into 2024, likely depending on OS image lineage  
- **No NIC-to-NIC Conflict Logged** under standard configurations

---

**Section 8: Licensing & Recovery Infrastructure**—tracking entitlement flow, BitLocker key handling, activation events, and image recovery vectors. This layer ties your system’s identity to its legal and security footprint.

---

# Section 8: Licensing & Recovery Infrastructure

## 8.1 Activation Method

- **License Type:** Digital Entitlement (Digital License)  
- **Activation Status (2021–2025):** Confirmed activated  
- **Activation Method:**  
  - Linked to Microsoft Account  
  - Re-activates automatically post-hardware swap via Activation Troubleshooter  
- **Registered Account:** David Roberson (linked via `LAPTOP-RE37GQQE`)  
- **MS Support Reference:** [Activate Windows – Microsoft Support](https://support.microsoft.com/en-us/windows/activate-windows-c39005d4-95ee-b91e-b399-2820fda32227)

## 8.2 OS and License Drift

| OS Edition       | Version | Build Number     | Status                         | Notes                                      |
|------------------|---------|------------------|----------------------------------|--------------------------------------------|
| Windows 10 Home  | 2009    | 10.0.19044       | Activated (via digital license) | Factory/OEM baseline                       |
| Windows 11 Home  | 2009    | 10.0.26100.3194  | Activated                       | License carried forward post-upgrade       |
| Windows 10 Home  | 22H2    | 10.0.22631.2861  | Activated (later session)       | Snapshot or parallel image lineage         |

## 8.3 BitLocker Recovery Key Record

- **Device Name:** LAPTOP-RE37GQQE  
- **Recovery Drive:** OSV  
- **Key Upload Timestamp:** 2021-10-01 17:52:00  
- **Recovery Key (Redacted):** XXX-XXX-XXX...  
- **Storage Location:** Linked to Microsoft Account  
- **Confirmed Escrow Presence:** Yes (via Microsoft Account Device Page)

## 8.4 Product Key Availability

- **Product Key Provided:** No  
- **Required for Reinstallation:** No  
- **System Reaction to Hardware Change:**  
  - If linked to MS account: Activation persists  
  - If not linked: Manual activation via Troubleshooter required

## 8.5 Recovery and Reinstallation Workflow

### Local Reset / Refresh
- **Supported:** Yes  
- **Environment:** Built-in Windows Recovery Environment (WinRE)  
- **Launch Methods:** Settings app > Recovery → Reset this PC

### ISO Reinstallation
- **Image Type:** Clean ISO (x64, Win 10/11 Home)  
- **Product Key Prompt:** Can be skipped  
- **Reactivation:** Occurs automatically after signing into linked MS account

### Bootloader & UEFI Flags
- **Secure Boot:** Enabled  
- **TPM Type:** Firmware TPM  
- **Boot Mode:** UEFI  
- **BitLocker Compatibility:** Confirmed Active

---

# Section 9: OEM Configuration & Dimensional Metadata

## 9.1 Product Model & SKU Details

- **Full Model Name:** ASUS ROG Strix G17 G713QM-ES94  
- **Alternate Regional Designation:** G713QM-HX016T  
- **System Type:** Notebook PC (17.3" class)  
- **Color:** Eclipse Grey  
- **Material:** Plastic and metal blend chassis with brushed texture  
- **Keyboard Layout:** US QWERTY  
- **Chassis Code:** G713QM_G713QM  

## 9.2 Dimensional Specifications

| Property        | Value        |
|----------------|--------------|
| Weight          | 5.95 lbs     |
| Dimensions (in) | 15.55 x 11.1 x 1.11 |
| Battery         | 4-cell Lithium-Ion, 90Wh |
| Power Adapter   | 240W (20V/12A) barrel-style plug  
| Screen Bezel    | Slim-frame design with top-center webcam omission

## 9.3 OEM Defaults & Recovery Configuration

- **Factory OS:** Windows 10 Home 64-bit  
- **OEM Recovery Partition:** Present (status unknown in latest snapshots)  
- **Original SSD Size (Declared):** 512GB NVMe M.2  
- **Installed SSD Size:** 1TB NVMe M.2 (user-upgraded or variant SKU)  
- **RAM Installed:** 16GB DDR4-3200 (2×8GB)  
- **Retail Box Contents:**
  - Laptop
  - 240W Adapter
  - ROG Velcro cable tie
  - User documentation
  - Quick Start Guide

## 9.4 Regional & Regulatory Markers

- **Registered Market Origin:** United States  
- **Certification Labels:**
  - FCC ID: MSQ-AX200NGW (for Intel WLAN model)  
  - Wi-Fi 6 Certified (AX)  
  - RoHS & CE marks present  
- **Language of Documentation:** English  
- **Region BIOS Defaults:** U.S. power standard, default input locale: en-US

## 9.5 Model Drift Observations

| Attribute            | Value A (OEM Baseline)   | Value B (Observed)             | Interpretation                            |
|---------------------|---------------------------|--------------------------------|--------------------------------------------|
| Storage             | 512GB                     | 1TB                            | Upgrade or retail variant                  |
| OS Edition          | Win10 Home                | Win11 Home                     | Digital license continuity                 |
| System Alias        | LAPTOP-RE37GQQE           | DESKTOP-22G3P3U                | Likely due to post-recovery renaming      |

---

Next up: Pivot into final synthesis planning, including `index.md`, changelog tags, or the ISO hash archive.

#### ©2005 David Bryan Roberson - eyeofparadox