asusinswiz.md

---

# 🧰 Support Software Detail: AsusInsWiz

**Component:** Asus Installation Wizard (`AsusInsWiz.exe`)  
**Status:** Not Initialized  
**Provisioning:** Blocked during Audit Mode  
**Source:** ASUS Reset ISO

---

## 📋 Fault Summary

AsusInsWiz did not execute during Audit Mode. No drivers, registry keys, or branding assets were applied. Logs show:

```
Event ID: 1001
Source: Shell-Core
Message: OEM installer AsusInsWiz.exe not launched
```

---

## 🧠 Interpretation

- AsusInsWiz is ASUS’s master installer for:
  - Drivers (chipset, GPU, audio, etc.)
  - Support software (MyASUS, Armoury Crate)
  - Registry branding and telemetry
- It typically runs during OOBE or first boot, but Audit Mode with networking disabled prevents execution.

---

## 📁 Source Availability

| Source | Status | Notes |
|--------|--------|-------|
| ASUS Reset ISO | ✅ Present | Confirmed in `ASUS_G513QM_2009_X64_V0.11--Index.txt` |
| ASUS Support Site | ❌ Not standalone | Usually bundled in recovery image |
| Microsoft Store | ❌ Not applicable | Not an AppX package

---

## 🛠️ Suggested Remediation

1. **Include AsusInsWiz in ISO**
   - Place `AsusInsWiz.exe` in `\sources\$OEM$\$1\Install\`
   - Script execution via `SetupComplete.cmd`:
     ```cmd
     start /wait "" "C:\Install\AsusInsWiz.exe" /silent
     ```

2. **Verify driver and software installation**
   - Check `C:\Program Files (x86)\ASUS` and `C:\Windows\System32\DriverStore`
   - Confirm registry keys under:
     ```
     HKLM\SOFTWARE\ASUS\
     ```

3. **Optional: Extract individual installers**
   - Use 7-Zip or PE Explorer to unpack `AsusInsWiz.exe`
   - Run components selectively if full wizard fails

---

## 🔗 Related Pages

- [`faults-by-support-software.md`](../summaries/faults-by-support-software.md)
- [`tools/armourycrate.md`](armourycrate.md)
- [`tools/myasus.md`](myasus.md)

---

*This page is part of the ASUS G713QM Restoration Project. For full context, see the [GitHub repo](https://github.com/eyeofparadox/ASUS_G713QM_RESTORATION).*  
