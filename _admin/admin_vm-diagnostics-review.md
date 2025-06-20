admin-vm-diagnostics-review.md
---
> I'm trying to get Git and GitHub Desktop deployed on my X750JB, and am in the middle of syncing the local forks on it and my G713QM. Between the two systems, and a number of external USB drives, my repo was literaly all over the place. Once I have a single master, I'll update the online repos. Once that's done, it will be under proper version control and we can afford to make changes again.
>
> I do have one concern, however. The X750JB developed an issue with VM support enabled. I've had it turned off in the BIOS so I can actually boot, but it was on without issues before I tried to set up a VM and was prompted to change something in Settings first. I have to did into it, but it seemed to have loaded something incompatible and it's probably still lurking in the background waiting to brick my laptop if I dare to re-enable VM support.

That’s a valid concern, David—and it sounds like your X750JB may have tripped over a low-level conflict between virtualization extensions (VT-x/AMD-V) and either a misconfigured hypervisor, a rogue driver, or a firmware-level incompatibility introduced during that VM setup attempt.

Here’s a breakdown of what might be happening and how we can approach it safely:

---

### **What Might’ve Gone Wrong**
- **Hyper-V or Windows Subsystem for Linux (WSL2)** may have been enabled or partially configured, introducing kernel-level hooks that conflict with legacy BIOS behavior.
- **VM platform features** (like Memory Integrity, Credential Guard, or Core Isolation) could have been toggled on via Windows Security or Settings → Apps → Optional Features.
- A **VM platform update or driver** (e.g., VirtualBox, VMware, or Hyper-V) may have installed a low-level service that doesn’t cleanly disengage when VM support is disabled in BIOS.

---

### **Suggested Recovery Steps (Non-Destructive)**

1. **Inventory VM-Related Features**
   - Run in PowerShell:
     ```powershell
     Get-WindowsOptionalFeature -Online | Where-Object {$_.FeatureName -like "*Hyper*"}
     ```
   - Also check:
     ```powershell
     systeminfo | findstr /i "Hyper-V"
     ```

2. **Check Core Isolation / Memory Integrity**
   - Go to *Windows Security → Device Security → Core Isolation Details*
   - If **Memory Integrity** is on, try disabling it and rebooting.

3. **Audit Installed Hypervisors**
   - Look for remnants of:
     - Hyper-V (`bcdedit /enum`)
     - VMware Workstation or Player
     - VirtualBox
   - If any are installed, check their services and uninstall or disable them temporarily.

4. **Safe VM Re-Enablement Strategy**
   - Once the above is clean, try:
     - Powering off completely
     - Re-enabling VM support in BIOS
     - Booting into Safe Mode first to test stability
     - Then normal boot

---

### Optional: Use MSINFO32 to Check Virtualization Stack
- Run `msinfo32` and look under **System Summary**:
  - *Virtualization-based Security Services Running*
  - *Hyper-V - VM Monitor Mode Extensions*

If anything looks active while VM support is off, that’s a red flag.

---

Would you like me to prep a diagnostic script to scan for these flags and log the results? We can also snapshot the current state before you re-enable VM support—just in case we need to roll back.

You’re right to tread carefully. But we can absolutely corner this gremlin.  

> Sure. I can send the script over the cross-over cable to the X750JB (which *can* run PowerShell) and I'll see what it reports, following up with any of the checks you just presented that might drill down deeper.

Perfect—this will give us a solid foundation to trace whatever VM-related residue may be lingering beneath the surface. Here’s a tailored diagnostic script you can run on the X750JB. It checks for Hyper-V flags, core isolation status, VM-related optional features, and Windows Update virtualization components that might be stuck in a half-enabled state:

---

### `Check-VirtualizationStack.ps1`

```powershell
# Check Hyper-V Optional Features
Write-Host "`n=== Hyper-V Feature Flags ==="
Get-WindowsOptionalFeature -Online |
    Where-Object { $_.FeatureName -match "Hyper" } |
    Select-Object FeatureName, State

# Check Device Guard / VBS
Write-Host "`n=== Virtualization-Based Security (VBS) ==="
Get-CimInstance -ClassName Win32_DeviceGuard |
    Select-Object -ExpandProperty SecurityServicesConfigured

# Check Core Isolation (Memory Integrity) State
Write-Host "`n=== Core Isolation / Memory Integrity ==="
$regPath = "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity"
$ciState = Get-ItemProperty -Path $regPath -ErrorAction SilentlyContinue
if ($ciState) {
    $ciState | Select-Object Enabled
} else {
    Write-Host "Memory Integrity not configured in registry."
}

# Systeminfo Hyper-V Summary
Write-Host "`n=== systeminfo Hyper-V Line Items ==="
systeminfo | findstr /i "Hyper-V"

# Check for VM drivers and services
Write-Host "`n=== Installed Services Related to VMs ==="
Get-Service | Where-Object { $_.Name -match "vm" -or $_.DisplayName -match "virtual" }

# Check bcdedit entries that enable hypervisorlaunchtype
Write-Host "`n=== Boot Configuration (bcdedit) Hypervisor State ==="
bcdedit | findstr /i "hypervisorlaunchtype"
```

---

You can send this over the crossover cable, then run it in an elevated PowerShell prompt. It’ll give us a readout of:

- Which hypervisor hooks are active or dangling  
- Whether core isolation (HVCI) is trying to assert control  
- If boot settings still reference the hypervisor stack  
- Any VM-associated services lurking in the background

Once you have the output, drop it into a report and we can evaluate whether your X750JB is safe to re-enable VM support—or if something’s lying in wait, as you rightly suspect.

Let me know if you'd like a cleanup script queued behind it that reverses common hypervisor hooks without touching unrelated components.  

