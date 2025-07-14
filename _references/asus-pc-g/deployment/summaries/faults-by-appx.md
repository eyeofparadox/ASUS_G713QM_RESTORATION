faults-by-appx.md

---

# 🧾 Faults by AppX Provisioning

**Source:** Event logs from `Microsoft-Windows-Shell-Core`, `AppModel-Runtime`, and provisioning traces  
**Context:** Audit Mode deployment on PC-G with networking disabled  
**Objective:** Identify AppX packages that failed to provision and determine recovery strategy

---

## 📦 AppX Fault Summary

| AppX Package | Entry Point | Status | Recovery Source | Notes |
|--------------|-------------|--------|------------------|-------|
| `Microsoft.WindowsStore` | `App` | Failed | ✅ Winget | Can be preloaded or scripted |
| `microsoft.windowscommunicationsapps` | `microsoft.windowslive.mail` | Failed | ✅ Winget | Includes Mail and Calendar |
| `Microsoft.WindowsCalculator` | `App` | Failed | ✅ Winget | Lightweight, safe to preload |
| `Microsoft.MicrosoftStickyNotes` | `App` | Failed | ✅ Winget | Often fails silently in Audit Mode |
| `Microsoft.People` | `x4c7a3b7dy2188y46d4ya362y19ac5a5805e5x` | Failed | ❌ Not in Winget | May need manual sourcing |
| `Microsoft.WindowsMaps` | `App` | Failed | ❌ Not in Winget | Store-only; consider optional |
| `Microsoft.WindowsFeedbackHub` | `App` | Failed | ✅ Winget | Can be scripted if needed |
| `Microsoft.Getstarted` | `App` | Failed | ❌ Deprecated | No longer supported in 22H2+

---

## 🧠 Interpretation

- **Provisioning failed across the board** due to networking being disabled in Audit Mode.
- **Winget can recover most packages**, especially core utilities like Calculator, Mail, and Feedback Hub.
- **Some packages are deprecated or Store-only**, and may not be worth recovering unless needed for branding or telemetry.

---

## ✅ Recommendations

1. **Build a Winget recovery script**
   ```powershell
   winget install Microsoft.WindowsStore --silent
   winget install Microsoft.WindowsCalculator --silent
   winget install Microsoft.WindowsFeedbackHub --silent
   ```

2. **Embed AppX packages into ISO**
   - Place in `\sources\$OEM$\$1\AppX\`
   - Register via `SetupComplete.cmd` or post-install script:
     ```powershell
     Add-AppxPackage -Path "C:\AppX\Microsoft.WindowsStore.msixbundle"
     ```

3. **Recover from PC-X if Winget fails**
   - Use Everything or Explorer to search `%ProgramFiles%\WindowsApps`
   - Extract `.appx` or `.msixbundle` files for manual registration

4. **Skip deprecated or non-critical apps**
   - `Getstarted`, `People`, and `Maps` can be omitted unless required

---

## 📁 Suggested Linked Pages

- [`apps/windowsstore.md`](../apps/windowsstore.md)
- [`apps/windowscalculator.md`](../apps/windowscalculator.md)
- [`apps/windowsfeedbackhub.md`](../apps/windowsfeedbackhub.md)
- [`apps/windowsmaps.md`](../apps/windowsmaps.md)

---

*This summary is part of the ASUS G713QM Restoration Project. For full context, see the [GitHub repo](https://github.com/eyeofparadox/ASUS_G713QM_RESTORATION).*  
