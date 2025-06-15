asus-rog-g713qm-clean-windows-11-install-crashing-during-oobe-updates-1
---
AI Overview

It can be frustrating when your ASUS ROG G713QM crashes during the clean install of Windows 11, specifically during the Out-of-Box Experience (OOBE) and subsequent updates. Here's a breakdown of common causes and troubleshooting steps based on the search results:

Possible Causes:

* Hardware Issues:  
  * SSD problems: A faulty or incompatible SSD could be causing crashes.  
  * RAM issues: Incompatible or improperly installed RAM, especially if using multiple kits, can cause freezing and instability.  
  * Other hardware component failure: Other components, like the GPU, can sometimes be the source of the crashing, especially during installation.  
* Software/Driver Conflicts:  
  * Driver problems: Outdated or corrupted drivers, particularly graphics drivers, can cause Windows to crash.  
  * Conflicting software: Antivirus or system optimization programs can interfere with the installation or updates.  
* Installation Media/Process Issues:  
  * Corrupted installation media: A faulty USB drive used for the clean install can lead to problems.  
  * Incomplete/interrupted installation: An issue during the initial install can trigger subsequent errors.  
  * Windows Update Issues: Problems with the Windows Update process itself, including issues with the update cache or services, can cause OOBE to fail. 

Troubleshooting Steps:

1. Check Hardware:  
   * Test your SSD: If you have access to another SSD, try installing Windows 11 on that drive to rule out SSD issues.  
   * Check and reseat RAM: Ensure your RAM is compatible and properly seated. If using multiple RAM sticks, try testing them individually to see if one is faulty.  
   * Clear CMOS: Try clearing the CMOS (often done by removing the motherboard battery or shorting pins) to reset BIOS settings to default, as this can sometimes resolve issues with hardware configuration.  
2. Use Windows Recovery Environment (WinRE):  
   * Startup Repair: Access WinRE (by restarting your PC while holding the Shift key) and try running Startup Repair to see if it can automatically fix any issues preventing Windows from starting correctly.  
   * Reset PC: If the problem persists, consider resetting your PC from the WinRE options. This will reinstall Windows but you can choose to keep your files (although backing them up is always recommended).  
3. Advanced Troubleshooting (if OOBE is accessible but crashing):  
   * Bypass OOBE Network Requirement: If the crashing happens during the OOBE process, and you're prompted to connect to the internet, try bypassing the requirement by opening Command Prompt (Shift+F10) and typing `oobe\bypassnro` and pressing Enter.  
   * Check Crash Logs: If you can access the system after crashing, examine the crash logs (Reliability Monitor in Control Panel) to identify any specific applications or drivers that might be causing the issue.  
   * Run System File Checker (SFC) and DISM scans: These tools can help repair corrupted system files that may be causing problems with the update process.  
   * Reset Windows Update Components: If Windows Update seems to be the culprit, try resetting the update components to clear the update cache and restart related services.  
   * Check for Driver and Software Conflicts: Update drivers, especially graphics drivers, using Device Manager. Also, temporarily disable or uninstall any suspicious third-party software that might be interfering with the update process.  
4. Try a Fresh Clean Install:  
   * Recreate the installation media: Create a new Windows 11 installation USB using the Media Creation Tool from Microsoft's website. Make sure to back up your data before creating the bootable drive, as it will erase all data.  
   * Delete all partitions during installation: When prompted during the installation process, delete all existing partitions on your SSD and select the unallocated space to install Windows.  
5. Check BIOS and Drivers:  
   * Update BIOS: Ensure your laptop's BIOS is up-to-date.  
   * Install necessary drivers: After the installation, manually download and install the latest drivers from the ASUS website for your ROG G713QM, particularly chipset and graphics drivers. 

If the problem persists:

* Contact ASUS Support: If you've tried all these steps and the issue continues, contact ASUS support for further assistance. They may be able to provide specific troubleshooting steps for your model or recommend having the laptop serviced. 

Remember to back up your important data before attempting any troubleshooting steps that involve resetting or reinstalling Windows. 

