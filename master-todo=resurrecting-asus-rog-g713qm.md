I am going to set up a **Master ToDo** to keep me on track as I spin off branches from my core purpose: **Resurrecting the ASUS ROG G713QM**. 

I already have a few tasks to mention. I'd appreciate you taking my stream of conscious enumeraton and compose them into a formatted checklist. I need to set up a USB with the OEM image (**G513Q Driver DVD Version 0.09_20H2**) to do a trial install. I have **Rufus Portable**, the ISO and a 32GB USB. I want to know if it will boot and install via **AsusWiz** to set up **Windows 10** with factory drivers and support software. That will tell me what needs to be addressed before going on to customizing the ISO to add up-to-date drivers. In line with that, I need to do an interrogation run on the driver installers to sort out the best way to automate the installation. I may also need to decide what 3rd party software should be included (as opposed to what will do fine installed **after** Windows is solid. I hope I can get this far without tripping over whatever driver conflict sabotages Win11 installs and **OOBE** updates. If I end up needing to use a VM to move forward, then the **Anhdv Boot** needs to be modified to instanciate with **PowerShell** and **VirtualBox** live in the PE.


I've proposed a formatted checklist on your page based on your stream-of-consciousness notes. It captures your core priorities for resurrecting the G713QM—USB setup, ISO testing, driver automation, and a contingency for VM deployment with Anhdv Boot. Let me know if you want to expand any section into a deeper task tree or connect it to your broader archival and tooling workflows. This already feels like a solid launchpad.

### **Master ToDo: Resurrecting the ASUS ROG G713QM**

1. **Set up USB with OEM Image**  
   * Use G513Q Driver DVD Version 0.09\_20H2.  
   * Tools: Rufus Portable, the ISO, and a 32GB USB.  
   * Objective: Test if it boots and installs via AsusWiz to set up Windows 10 with factory drivers and support software.  
   * Subtasks:  
     * Download Rufus Portable and verify its version compatibility.  
     * Confirm the integrity of the ISO file.  
     * Format the 32GB USB drive using Rufus.  
     * Configure Rufus settings for bootable USB creation.  
     * Test the USB on the ASUS ROG G713QM to ensure it boots correctly.  
2. **Evaluate Installation Process**  
   * Identify issues during the trial install.  
   * Determine what needs to be addressed before customizing the ISO.  
   * Subtasks:  
     * Document any error messages or installation failures.  
     * Check hardware compatibility with the OEM image.  
     * Verify driver installation during the setup process.  
3. **Customize ISO**  
   * Add up-to-date drivers.  
   * Decide on 3rd party software to include versus installing post-Windows setup.  
   * Subtasks:  
     * Research and download the latest drivers for ASUS ROG G713QM.  
     * Create a list of essential 3rd party software for inclusion.  
     * Test the customized ISO on a virtual machine before deployment.  
4. **Interrogate Driver Installers**  
   * Analyze driver installers to determine the best way to automate installation.  
   * Subtasks:  
     * Extract driver installer packages for analysis.  
     * Identify dependencies and installation order.  
     * Develop scripts for automated driver installation.  
5. **Address Driver Conflicts**  
   * Investigate and resolve driver conflicts that sabotage Windows 11 installs and OOBE updates.  
   * Subtasks:  
     * Research common driver conflicts for ASUS machines.  
     * Test driver compatibility with Windows 11 updates.  
     * Replace problematic drivers with stable versions.  
6. **Prepare for VM Usage (if needed)**  
   * Modify Anhdv Boot to instantiate with PowerShell and VirtualBox live in the PE.  
   * Subtasks:  
     * Download and configure Anhdv Boot.  
     * Integrate PowerShell scripts for VM setup.  
     * Test VirtualBox functionality within the PE environment.


Great! Can you help me break down the tasks further?


Also, what are common driver conflicts when installing Windows 11 on ASUS machines in particular? In my research there have been several mentions of this being a known, and essentially ignored problem. One I've heard is that the March updates and Win11 24H2 both pre-emptively install bad Intel chip drivers. 


Absolutely, David — I’ve expanded your checklist into more granular subtasks on your page to help you track each phase of the G713QM resurrection. It now includes steps like verifying ISO integrity, scripting driver automation, and testing PE-based VM setups. Let me know if you'd like to link any of these to your broader archival or tooling systems.

As for the Windows 11 driver conflicts on ASUS machines — you're right to be cautious. Based on recent reports, here are some of the most common issues:

1. **Intel Chipset Driver Regression**: Windows 11 24H2 and some March updates have been known to overwrite newer Intel chipset drivers with outdated or incompatible versions. This can lead to instability, BSODs, or degraded performance.

2. **ASUS Motherboard Compatibility Blocks**: Some ASUS boards — especially in the TUF and ROG lines — have been flagged as incompatible with 24H2 during Windows Update rollouts, even when hardware meets requirements.

3. **Driver Duplication and Device Conflicts**: Users have reported that Windows Update installs duplicate drivers or reverts to generic versions, causing device manager clutter and erratic behavior.

4. **OOBE Failures**: During Out-of-Box Experience, certain ASUS-specific drivers (like for Armoury Crate or ACPI interfaces) can fail silently or conflict with Windows services, stalling setup or breaking post-install features.

To mitigate this, you might consider:
- Preloading known-stable drivers into your ISO or PE environment.
- Using `PnPUtil` or `DISM` to control driver injection order.
- Blocking automatic driver updates via Group Policy or registry tweaks during setup.

If you’d like, I can help you script a diagnostic pass to log and compare driver versions before and after install — or even build a rollback routine for known-problematic packages. Just say the word.

- [1] [answers.microsoft.com](https://answers.microsoft.com/en-us/windows/forum/all/driver-issues-after-windows-11-24h2-update/b236e1fd-a746-43cd-814f-8dc574b7e022)
- [2] [www.elevenforum.com](https://www.elevenforum.com/t/asus-motherboards-w11-24h2-conflict-block.30599/)

What are the best practices for automating driver installations?

Can you provide specific examples of the subtasks?

What are some solutions to these driver conflicts?

How do these driver conflicts impact system performance after installation?