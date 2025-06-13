## **Master ToDo: Resurrecting the ASUS ROG G713QM**
  
**Prompt**: I decided to set up a **Master ToDo** to keep me on track as I spin off branches from my core purpose: **Resurrecting the ASUS ROG G713QM**. 

I already have a few tasks to mention. I'd appreciate you taking my stream of conscious enumeraton and compose it into a formatted checklist. I need to set up a **USB** with the **OEM** image (**G513Q Driver DVD Version 0.09_20H2**) to do a trial install. I have **Rufus Portable**, the ISO and a 32GB USB. I want to know if it will boot and install via **AsusWiz** to set up **Windows 10** with factory drivers and support software. That will tell me what needs to be addressed before going on to customizing the ISO to add up-to-date drivers. In line with that, I need to do an interrogation run on the driver installers to sort out the best way to automate the installation. I may also need to decide what 3rd party software should be included (as opposed to what will do fine installed **after** Windows is solid. I hope I can get this far without tripping over whatever driver conflict sabotages Win11 installs and **OOBE** updates. If I end up needing to use a VM to move forward, then the **Anhdv Boot** needs to be modified to instantiate with **PowerShell** and **VirtualBox** live in the PE.
  
**Copilot**: _I've proposed a formatted checklist on your page based on your stream-of-consciousness notes. It captures your core priorities for resurrecting the G713QM—USB setup, ISO testing, driver automation, and a contingency for VM deployment with Anhdv Boot. Let me know if you want to expand any section into a deeper task tree or connect it to your broader archival and tooling workflows. This already feels like a solid launchpad._

---

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

### High-Value File Inventory

A “High-Value File Inventory” can be produced using:  
```
dir G:\ANHDV\BOOT\* /s /a:-d /b /l \> G:\ASUS\G713QM-ES94\SUPPORT\_RESOURCES\.github\anhdv-boot-content.txt
```
Used in a Command Prompt (the only option working in a WinPE setup) it provides a clean, comprehensive reference anchor for ISO customization or PE repack work. The output is too much for this Page, but is easy enough to trim down in a text editor to key extensions. I was looking for .iso .zip .7z .wim .swm and .esd files in particular. Identifying those should make targeting key drivers and payloads for scripting or automation a snap. Following up by annotating these by category or linking specific files to dependency checks, validation steps, or extraction routines, can turn the list into a living manifest over future iteration.  

Also, .exe files are usually the high-leverage triggers for utilities, installers, and silent routines. To round out your scan for mod-critical or operational payloads, here are a few more extensions worth flagging:

  * .cmd, .bat, .ps1 – Scripts that orchestrate silent setups, driver loads, or startup logic.

  * .inf – Driver setup files: lightweight, but often the entry point for deployment logic.

  * .cfg, .ini, .xml – Configs that define boot parameters, default app behaviors, or language selections.

  * .dll – Shared libraries, especially custom ones embedded in boot kits or driver packs.

  * .bin – Firmware, boot sectors, or raw payloads — sometimes embedded in tools or passed to UEFI routines.

  * .wim, .esd, .swm – Already on your radar, but worth extra scrutiny for nested ISO resources or compressed driver bases.

  * .sys – Low-level driver components, especially in legacy compatibility layers or preloaded boot paths.

---
  
..\advmgr  
..\bootmgr  
..\bootmgr.efi  
..\bt.md5  
..\g2ldr  
..\grldr  
..\_oot.md5  
..\apps\export_wifi.cmd  
..\apps\tempdelete.cmd  
..\apps\windows.exe  
..\apps\windows.xml  
..\apps\drivers\load_drivers\amd\raid_sata\rcraid.cat  
..\apps\drivers\load_drivers\amd\raid_sata\rcraid.inf  
..\apps\drivers\load_drivers\amd\raid_sata\rcraid.sys  
..\apps\drivers\load_drivers\intel_gen13\iastorvd.cat  
..\apps\drivers\load_drivers\intel_gen13\iastorvd.inf  
..\apps\drivers\load_drivers\intel_gen13\iastorvd.sys  
..\apps\drivers\load_drivers\intel_gen13\rstmweventlogmsg.dll  
..\apps\drivers\load_drivers\intel_gen13\rstmwservice.exe  
..\apps\drivers\load_drivers\intel_gen14\iastorvd.cat  
..\apps\drivers\load_drivers\intel_gen14\iastorvd.inf  
..\apps\drivers\load_drivers\intel_gen14\iastorvd.sys  
..\apps\drivers\load_drivers\intel_gen14\rstmweventlogmsg.dll  
..\apps\drivers\load_drivers\intel_gen14\rstmwservice.exe  
..\apps\drivers\load_drivers\intel_old\intel_gen11\iastorafs.sys  
..\apps\drivers\load_drivers\intel_old\intel_gen11\iastorafsnative.exe  
..\apps\drivers\load_drivers\intel_old\intel_gen11\iastorafsservice.exe  
..\apps\drivers\load_drivers\intel_old\intel_gen11\iastorvd.cat  
..\apps\drivers\load_drivers\intel_old\intel_gen11\iastorvd.inf  
..\apps\drivers\load_drivers\intel_old\intel_gen11\iastorvd.sys  
..\apps\drivers\load_drivers\intel_old\intel_gen11\optane.dll  
..\apps\drivers\load_drivers\intel_old\intel_gen11\optaneeventlogmsg.dll  
..\apps\drivers\load_drivers\intel_old\intel_gen11\rstmweventlogmsg.dll  
..\apps\drivers\load_drivers\intel_old\intel_gen11\rstmwservice.exe  
..\apps\drivers\load_drivers\intel_old\intel_gen12\iastorvd.cat  
..\apps\drivers\load_drivers\intel_old\intel_gen12\iastorvd.inf  
..\apps\drivers\load_drivers\intel_old\intel_gen12\iastorvd.sys  
..\apps\drivers\load_drivers\intel_old\intel_gen12\rstmweventlogmsg.dll  
..\apps\drivers\load_drivers\intel_old\intel_gen12\rstmwservice.exe  
..\apps\drivers\load_drivers\intel_old\intel_gen9-10\hfcdisableservice.exe  
..\apps\drivers\load_drivers\intel_old\intel_gen9-10\iaahcic.cat  
..\apps\drivers\load_drivers\intel_old\intel_gen9-10\iaahcic.inf  
..\apps\drivers\load_drivers\intel_old\intel_gen9-10\iastorac.cat  
..\apps\drivers\load_drivers\intel_old\intel_gen9-10\iastorac.inf  
..\apps\drivers\load_drivers\intel_old\intel_gen9-10\iastorac.sys  
..\apps\drivers\load_drivers\intel_old\intel_gen9-10\iastorafs.sys  
..\apps\drivers\load_drivers\intel_old\intel_gen9-10\iastorafsnative.exe  
..\apps\drivers\load_drivers\intel_old\intel_gen9-10\iastorafsservice.exe  
..\apps\drivers\load_drivers\intel_old\intel_gen9-10\optane.dll  
..\apps\drivers\load_drivers\intel_old\intel_gen9-10\optaneeventlogmsg.dll  
..\apps\drivers\load_drivers\intel_old\intel_gen9-10\rstmweventlogmsg.dll  
..\apps\drivers\load_drivers\intel_old\intel_gen9-10\rstmwservice.exe  
..\apps\drivers\load_drivers\intel_old\intel_raid\hfcdisableservice.exe  
..\apps\drivers\load_drivers\intel_old\intel_raid\iaahcic.cat  
..\apps\drivers\load_drivers\intel_old\intel_raid\iaahcic.inf  
..\apps\drivers\load_drivers\intel_old\intel_raid\iastorac.cat  
..\apps\drivers\load_drivers\intel_old\intel_raid\iastorac.inf  
..\apps\drivers\load_drivers\intel_old\intel_raid\iastorac.sys  
..\apps\drivers\load_drivers\intel_old\intel_raid\iastorafs.sys  
..\apps\drivers\load_drivers\intel_old\intel_raid\iastorafsnative.exe  
..\apps\drivers\load_drivers\intel_old\intel_raid\iastorafsservice.exe  
..\apps\drivers\load_drivers\intel_old\intel_raid\optane.dll  
..\apps\drivers\load_drivers\intel_old\intel_raid\optaneeventlogmsg.dll  
..\apps\drivers\load_drivers\intel_old\intel_raid\rstmweventlogmsg.dll  
..\apps\drivers\load_drivers\intel_old\intel_raid\rstmwservice.exe  
..\apps\drivers\net\1inet.anhdv  
..\apps\drivers\net\sdi.cfg  
..\apps\drivers\net\sdi.exe  
..\apps\drivers\net\drivers\l10x64.7z  
..\apps\drivers\net\drivers\lx32.7z  
..\apps\drivers\net\drivers\lx64.7z  
..\apps\drivers\net\drivers\w0x32.7z  
..\apps\drivers\net\drivers\w1x32.7z  
..\apps\drivers\net\drivers\w1x64.7z  
..\apps\drivers\net\drivers\w2x32.7z  
..\apps\drivers\net\drivers\w2x64.7z  
..\apps\drivers\net\drivers\w3x32.7z  
..\apps\drivers\net\drivers\w3x64.7z  
..\apps\drivers\net\drivers\w4x64.7z  
..\apps\drivers\net\drivers\w5x64.7z  
..\apps\drivers\net\drivers\wax32.7z  
..\apps\drivers\net\drivers\wax64.7z  
..\apps\drivers\net\indexes\sdi\l10x64.bin  
..\apps\drivers\net\indexes\sdi\lx32.bin  
..\apps\drivers\net\indexes\sdi\lx64.bin  
..\apps\drivers\net\indexes\sdi\w0x32.bin  
..\apps\drivers\net\indexes\sdi\w1x32.bin  
..\apps\drivers\net\indexes\sdi\w1x64.bin  
..\apps\drivers\net\indexes\sdi\w2x32.bin  
..\apps\drivers\net\indexes\sdi\w2x64.bin  
..\apps\drivers\net\indexes\sdi\w3x32.bin  
..\apps\drivers\net\indexes\sdi\w3x64.bin  
..\apps\drivers\net\indexes\sdi\w4x64.bin  
..\apps\drivers\net\indexes\sdi\w5x64.bin  
..\apps\drivers\net\indexes\sdi\wax32.bin  
..\apps\drivers\net\indexes\sdi\wax64.bin  
..\apps\drivers\net\tools\sdi\settings.cfg  
..\apps\drivers\net\tools\sdi\langs\sdi_anhdv.cfg  
..\apps\drivers\rst\irst.anhdv  
..\apps\drivers\rst\sdi.cfg  
..\apps\drivers\rst\sdi.exe  
..\apps\drivers\rst\drivers\dp_massstorage_23120.7z  
..\apps\drivers\rst\indexes\sdi\dp_massstorage_23120.bin  
..\apps\drivers\rst\tools\sdi\settings.cfg  
..\apps\drivers\rst\tools\sdi\langs\sdi_anhdv.cfg  
..\apps\ppapps\24.4.anhdv  
..\apps\ppapps\antivirus\powertool_x32.7z  
..\apps\ppapps\antivirus\powertool_x64.7z  
..\apps\ppapps\antivirus\wget.exe  
..\apps\ppapps\backup\7z.dll  
..\apps\ppapps\backup\7z.exe  
..\apps\ppapps\backup\acph_x32.7z  
..\apps\ppapps\backup\acph_x64.7z  
..\apps\ppapps\backup\atih14.7z  
..\apps\ppapps\backup\atih21.7z  
..\apps\ppapps\backup\backupper_x32.7z  
..\apps\ppapps\backup\backupper_x64.7z  
..\apps\ppapps\backup\macriumreflect_x32.7z  
..\apps\ppapps\backup\macriumreflect_x64.7z  
..\apps\ppapps\backup\tbosdtw.7z  
..\apps\ppapps\harddisk\7z.dll  
..\apps\ppapps\harddisk\7z.exe  
..\apps\ppapps\harddisk\diskmark.7z  
..\apps\ppapps\harddisk\diskmark.cmd  
..\apps\ppapps\harddisk\hddllf4.7z  
..\apps\ppapps\harddisk\hddllf4.cmd  
..\apps\ppapps\harddisk\hdsentinel.7z  
..\apps\ppapps\harddisk\hdsentinel.cmd  
..\apps\ppapps\harddisk\hpusbdisk.7z  
..\apps\ppapps\harddisk\hpusbdisk.cmd  
..\apps\ppapps\harddisk\ssd-z.7z  
..\apps\ppapps\harddisk\ssd-z.cmd  
..\apps\ppapps\harddisk\st.7z  
..\apps\ppapps\info\7z.dll  
..\apps\ppapps\info\7z.exe  
..\apps\ppapps\info\aida64.7z  
..\apps\ppapps\info\aida64.cmd  
..\apps\ppapps\info\batteryinfoview.7z  
..\apps\ppapps\info\batteryinfoview.cmd  
..\apps\ppapps\info\batterymon.7z  
..\apps\ppapps\info\batterymon.cmd  
..\apps\ppapps\info\coretemp.cmd  
..\apps\ppapps\info\coretemp_x32.7z  
..\apps\ppapps\info\coretemp_x64.7z  
..\apps\ppapps\info\cpuz.cmd  
..\apps\ppapps\info\cpuz_x32.7z  
..\apps\ppapps\info\cpuz_x64.7z  
..\apps\ppapps\info\memtest.7z  
..\apps\ppapps\info\memtest.cmd  
..\apps\ppapps\info\memtest64.7z  
..\apps\ppapps\info\memtest64.cmd  
..\apps\ppapps\info\quickmemorytestok.cmd  
..\apps\ppapps\info\quickmemorytestok_x32.7z  
..\apps\ppapps\info\quickmemorytestok_x64.7z  
..\apps\ppapps\info\usbtreeview.7z  
..\apps\ppapps\info\usbtreeview.cmd  
..\apps\ppapps\iom\7z.dll  
..\apps\ppapps\iom\7z.exe  
..\apps\ppapps\iom\fscapture.7z  
..\apps\ppapps\iom\fscapture.cmd  
..\apps\ppapps\iom\ghostexp_x32.7z  
..\apps\ppapps\iom\ghostexp_x64.7z  
..\apps\ppapps\iom\idm.7z  
..\apps\ppapps\iom\iso2dics.7z  
..\apps\ppapps\iom\iso2disc.7z  
..\apps\ppapps\iom\iso2disc.cmd  
..\apps\ppapps\iom\ocam.7z  
..\apps\ppapps\iom\ocam.cmd  
..\apps\ppapps\iom\officex32.7z  
..\apps\ppapps\iom\officex64.7z  
..\apps\ppapps\iom\penetwork_x32.7z  
..\apps\ppapps\iom\penetwork_x64.7z  
..\apps\ppapps\iom\sumatrapdf.7z  
..\apps\ppapps\iom\sumatrapdf.cmd  
..\apps\ppapps\iom\tbiview_x32.7z  
..\apps\ppapps\iom\tbiview_x64.7z  
..\apps\ppapps\iom\ultraiso.7z  
..\apps\ppapps\iom\ultraiso.cmd  
..\apps\ppapps\iom\vlc.7z  
..\apps\ppapps\iom\vlc.cmd  
..\apps\ppapps\partition\7z.dll  
..\apps\ppapps\partition\7z.exe  
..\apps\ppapps\partition\ntfstofat32wizard.7z  
..\apps\ppapps\partition\ntfstofat32wizard.cmd  
..\apps\ppapps\partition\partassist.7z  
..\apps\ppapps\partition\partitionguru.7z  
..\apps\ppapps\partition\partitionguru.cmd  
..\apps\ppapps\partition\partitionwizard10.7z  
..\apps\ppapps\partition\partitionwizard10.cmd  
..\apps\ppapps\partition\partitionwizard_x32.7z  
..\apps\ppapps\partition\partitionwizard_x64.7z  
..\apps\ppapps\password\7z.dll  
..\apps\ppapps\password\7z.exe  
..\apps\ppapps\password\ntpwedit.7z  
..\apps\ppapps\password\wlu.7z  
..\apps\ppapps\recovery\7datarecoverysuite.7z  
..\apps\ppapps\recovery\7datarecoverysuite.cmd  
..\apps\ppapps\recovery\7z.dll  
..\apps\ppapps\recovery\7z.exe  
..\apps\ppapps\recovery\diskgetor.7z  
..\apps\ppapps\recovery\diskgetor.cmd  
..\apps\ppapps\recovery\doubledriver.7z  
..\apps\ppapps\recovery\doubledriver.cmd  
..\apps\ppapps\recovery\edrw.7z  
..\apps\ppapps\recovery\getdatabackfat.7z  
..\apps\ppapps\recovery\getdatabackntfs.7z  
..\apps\ppapps\recovery\getdatabackpro_x32.7z  
..\apps\ppapps\recovery\getdatabackpro_x64.7z  
..\apps\ppapps\recovery\powerdatarecovery.7z  
..\apps\ppapps\recovery\powerdatarecovery.cmd  
..\apps\ppapps\system\78setup.7z  
..\apps\ppapps\system\7z.dll  
..\apps\ppapps\system\7z.exe  
..\apps\ppapps\system\bootice.7z  
..\apps\ppapps\system\bootsectgui.7z  
..\apps\ppapps\system\bootsectgui.cmd  
..\apps\ppapps\system\easyuefi.7z  
..\apps\ppapps\system\easyuefi.cmd  
..\apps\ppapps\system\easyuefix64.7z  
..\apps\ppapps\system\everything.7z  
..\apps\ppapps\system\everything.cmd  
..\apps\ppapps\system\freevk.7z  
..\apps\ppapps\system\freevk.cmd  
..\apps\ppapps\system\nt6x_fast_installer_x32.7z  
..\apps\ppapps\system\nt6x_fast_installer_x64.7z  
..\apps\ppapps\system\ntbootautofix.7z  
..\apps\ppapps\system\winntsetup_nv.7z  
..\apps\ppapps\system\winntsetup_v4.7z  
..\apps\ppapps\win\7z.dll  
..\apps\ppapps\win\7z.exe  
..\boot\boot.sdi  
..\boot\bootfix.bin  
..\boot\bootpe  
..\boot\bootsect.exe  
..\boot\chain.c32  
..\boot\etfsboot.com  
..\boot\memtest.exe  
..\boot\pe  
..\boot\grub\antivirus.cfg  
..\boot\grub\antivirus.lst  
..\boot\grub\backup.cfg  
..\boot\grub\backup.lst  
..\boot\grub\bootra1n.cfg  
..\boot\grub\dos.cfg  
..\boot\grub\dos.lst  
..\boot\grub\dosuefi.cfg  
..\boot\grub\g2ldr  
..\boot\grub\g2ldr.mbr  
..\boot\grub\g2ldrmbr  
..\boot\grub\grldr  
..\boot\grub\grldr.mbr  
..\boot\grub\grub.cfg  
..\boot\grub\harddisk.cfg  
..\boot\grub\harddisk.lst  
..\boot\grub\kali.cfg  
..\boot\grub\linux.cfg  
..\boot\grub\linux.lst  
..\boot\grub\main.cfg  
..\boot\grub\memdisk  
..\boot\grub\menu.lst  
..\boot\grub\mtp86.cfg  
..\boot\grub\osdetect.cfg  
..\boot\grub\osdetect.lst  
..\boot\grub\partition.cfg  
..\boot\grub\partition.lst  
..\boot\grub\phoenixos.cfg  
..\boot\grub\pmagic.cfg  
..\boot\grub\poweroff.cfg  
..\boot\grub\poweroff.lst  
..\boot\grub\primeos.cfg  
..\boot\grub\system.cfg  
..\boot\grub\system.lst  
..\boot\grub\locale\vi\grub.mo  
..\efi\boot\bootia32.efi  
..\efi\boot\bootx64.efi  
..\efi\boot\grub.cfg  
..\efi\boot\konbootdxeia32.efi  
..\efi\boot\konbootdxex64.efi  
..\efi\boot\konbootx32.efi  
..\efi\boot\konbootx64.efi  
..\efi\boot\memtest  
..\efi\boot\memtestx32.efi  
..\efi\boot\memtestx64.efi  
..\efi\boot\winpex32.efi  
..\efi\boot\winpex64.efi  
..\efi\microsoft\boot\b32  
..\efi\microsoft\boot\bcd  
..\efi\microsoft\boot\cdboot.efi  
..\efi\microsoft\boot\efisys.bin  
..\efi\microsoft\boot\memtest.efi  
..\iso\dlg5.iso  
..\iso\ghost115.iso  
..\iso\hdsdos.iso  
..\iso\memtest32.bin  
..\iso\mhdd.iso  
..\iso\plpbt.bin  
..\iso\pwh.wim  
..\iso\vcr35r.iso  
..\sstr\78setup\78setup.cfg  
..\sstr\78setup\78setup.exe  
..\sstr\78setup\78setup64.exe  
..\sstr\78setup\utilites\dartex.exe  
..\sstr\78setup\utilites\dartex64.exe  
..\sstr\78setup\utilites\sources.7z  
..\sstr\78setup\utilites\sources64.7z  
..\sstr\driverpacks\drvindex_x32.cmd  
..\sstr\driverpacks\drvindex_x32.exe  
..\sstr\driverpacks\drvindex_x64.cmd  
..\sstr\driverpacks\drvindex_x64.exe  
..\sstr\driverpacks\massstorage\drvindexmassstorage_x32.cmd  
..\sstr\driverpacks\massstorage\drvindex_x32.exe  
..\sstr\driverpacks\massstorage\nt6x32\1.7z  
..\sstr\driverpacks\massstorage\nt6x32\1.index  
..\sstr\driverpacks\massstorage\nt6x32\2.7z  
..\sstr\driverpacks\massstorage\nt6x32\2.index  
..\sstr\driverpacks\networkdriver\drvindexlan_x32.cmd  
..\sstr\driverpacks\networkdriver\drvindexlan_x64.cmd  
..\sstr\driverpacks\networkdriver\drvindex_x32.exe  
..\sstr\driverpacks\networkdriver\drvindex_x64.exe  
..\sstr\driverpacks\networkdriver\nt6x32\lan1_x86(1703).7z  
..\sstr\driverpacks\networkdriver\nt6x32\lan1_x86(1703).index  
..\sstr\driverpacks\networkdriver\nt6x32\lan2_x86(1602).7z  
..\sstr\driverpacks\networkdriver\nt6x32\lan2_x86(1602).index  
..\sstr\driverpacks\networkdriver\nt6x32\lan3_x86(1605).7z  
..\sstr\driverpacks\networkdriver\nt6x32\lan3_x86(1605).index  
..\sstr\driverpacks\networkdriver\nt6x64\lan1_x64(1703).7z  
..\sstr\driverpacks\networkdriver\nt6x64\lan1_x64(1703).index  
..\sstr\driverpacks\networkdriver\nt6x64\lan2_x64(2010).7z  
..\sstr\driverpacks\networkdriver\nt6x64\lan2_x64(2010).index  
..\sstr\driverpacks\networkdriver\nt6x64\lan3_x64(1605).7z  
..\sstr\driverpacks\networkdriver\nt6x64\lan3_x64(1605).index  
..\sstr\driverpacks\videodriver\drvindexvideo_x32.cmd  
..\sstr\driverpacks\videodriver\drvindexvideo_x64.cmd  
..\sstr\driverpacks\videodriver\drvindex_x32.exe  
..\sstr\driverpacks\videodriver\drvindex_x64.exe  
..\sstr\driverpacks\videodriver\nt5x32\sound_ac97_5x86(2006).7z  
..\sstr\driverpacks\videodriver\nt5x32\sound_ac97_5x86(2006).index  
..\sstr\driverpacks\videodriver\nt6x32\video_at1_x86(1307).7z  
..\sstr\driverpacks\videodriver\nt6x32\video_at1_x86(1307).index  
..\sstr\driverpacks\videodriver\nt6x32\video_at2_x86(1410).7z  
..\sstr\driverpacks\videodriver\nt6x32\video_at2_x86(1410).index  
..\sstr\driverpacks\videodriver\nt6x32\video_at3_x86(1601).7z  
..\sstr\driverpacks\videodriver\nt6x32\video_at3_x86(1601).index  
..\sstr\driverpacks\videodriver\nt6x32\video_in0_x86(1805).7z  
..\sstr\driverpacks\videodriver\nt6x32\video_in0_x86(1805).index  
..\sstr\driverpacks\videodriver\nt6x32\video_in1_x86(1805).7z  
..\sstr\driverpacks\videodriver\nt6x32\video_in1_x86(1805).index  
..\sstr\driverpacks\videodriver\nt6x32\video_in2_x86(1805).7z  
..\sstr\driverpacks\videodriver\nt6x32\video_in2_x86(1805).index  
..\sstr\driverpacks\videodriver\nt6x32\video_in3_x86(1702).7z  
..\sstr\driverpacks\videodriver\nt6x32\video_in3_x86(1702).index  
..\sstr\driverpacks\videodriver\nt6x32\video_in4_x86(1706).7z  
..\sstr\driverpacks\videodriver\nt6x32\video_in4_x86(1706).index  
..\sstr\driverpacks\videodriver\nt6x32\video_nv0_x86(1601).7z  
..\sstr\driverpacks\videodriver\nt6x32\video_nv0_x86(1601).index  
..\sstr\driverpacks\videodriver\nt6x32\video_nv1_x86(1410).7z  
..\sstr\driverpacks\videodriver\nt6x32\video_nv1_x86(1410).index  
..\sstr\driverpacks\videodriver\nt6x32\video_nv2_x86(1710).7z  
..\sstr\driverpacks\videodriver\nt6x32\video_nv2_x86(1710).index  
..\sstr\driverpacks\videodriver\nt6x32\video_nv3_10x86(1810).7z  
..\sstr\driverpacks\videodriver\nt6x32\video_nv3_10x86(1810).index  
..\sstr\driverpacks\videodriver\nt6x32\video_nv3_x86(1810).7z  
..\sstr\driverpacks\videodriver\nt6x32\video_nv3_x86(1810).index  
..\sstr\driverpacks\videodriver\nt6x32\video_vmx_6x86.7z  
..\sstr\driverpacks\videodriver\nt6x32\video_vmx_6x86.index  
..\sstr\driverpacks\videodriver\nt6x64\sound_all_x64(2212).7z  
..\sstr\driverpacks\videodriver\nt6x64\sound_all_x64(2212).index  
..\sstr\driverpacks\videodriver\nt6x64\video_at1_x64(1307).7z  
..\sstr\driverpacks\videodriver\nt6x64\video_at1_x64(1307).index  
..\sstr\driverpacks\videodriver\nt6x64\video_at2_x64(2008).7z  
..\sstr\driverpacks\videodriver\nt6x64\video_at2_x64(2008).index  
..\sstr\driverpacks\videodriver\nt6x64\video_at3_x64(2008).7z  
..\sstr\driverpacks\videodriver\nt6x64\video_at3_x64(2008).index  
..\sstr\driverpacks\videodriver\nt6x64\video_in0_x64(1805).7z  
..\sstr\driverpacks\videodriver\nt6x64\video_in0_x64(1805).index  
..\sstr\driverpacks\videodriver\nt6x64\video_in1_x64(1805).7z  
..\sstr\driverpacks\videodriver\nt6x64\video_in1_x64(1805).index  
..\sstr\driverpacks\videodriver\nt6x64\video_in2_x64(1805).7z  
..\sstr\driverpacks\videodriver\nt6x64\video_in2_x64(1805).index  
..\sstr\driverpacks\videodriver\nt6x64\video_in3_x64(1702).7z  
..\sstr\driverpacks\videodriver\nt6x64\video_in3_x64(1702).index  
..\sstr\driverpacks\videodriver\nt6x64\video_in4_x64(1706).7z  
..\sstr\driverpacks\videodriver\nt6x64\video_in4_x64(1706).index  
..\sstr\driverpacks\videodriver\nt6x64\video_in5_10x64(2306).7z  
..\sstr\driverpacks\videodriver\nt6x64\video_in5_10x64(2306).index  
..\sstr\driverpacks\videodriver\nt6x64\video_inb_x64(2007).7z  
..\sstr\driverpacks\videodriver\nt6x64\video_inb_x64(2007).index  
..\sstr\driverpacks\videodriver\nt6x64\video_nv1-sstr_x64(2103).7z  
..\sstr\driverpacks\videodriver\nt6x64\video_nv1-sstr_x64(2103).index  
..\sstr\driverpacks\videodriver\nt6x64\video_nv2-sstr_10x64(2103).7z  
..\sstr\driverpacks\videodriver\nt6x64\video_nv2-sstr_10x64(2103).index  
..\sstr\driverpacks\videodriver\nt6x64\video_nv3_10x64(2306).7z  
..\sstr\driverpacks\videodriver\nt6x64\video_nv3_10x64(2306).index  
..\sstr\driverpacks\videodriver\nt6x64\video_sis_6x64.7z  
..\sstr\driverpacks\videodriver\nt6x64\video_sis_6x64.index  
..\sstr\driverpacks\videodriver\nt6x64\vm3d_amd64.7z  
..\sstr\driverpacks\videodriver\nt6x64\vm3d_amd64.index  
..\sstr\driverpacks\wlandriver\7z.exe  
..\sstr\driverpacks\wlandriver\7za.dll  
..\sstr\driverpacks\wlandriver\devcon.exe  
..\sstr\driverpacks\wlandriver\devcon64.exe  
..\sstr\driverpacks\wlandriver\devinst.exe  
..\sstr\driverpacks\wlandriver\dpinst.exe  
..\sstr\driverpacks\wlandriver\dpinst64.exe  
..\sstr\driverpacks\wlandriver\nt6x32\1.7z  
..\sstr\driverpacks\wlandriver\nt6x32\usb_netx86.7z  
..\sstr\driverpacks\wlandriver\nt6x32\wlan1_x86(2202).7z  
..\sstr\driverpacks\wlandriver\nt6x32\wlan2_x86(1602).7z  
..\sstr\driverpacks\wlandriver\nt6x32\wlan3_x86(2102).7z  
..\sstr\driverpacks\wlandriver\nt6x32\wlan4_x86(1602).7z  
..\sstr\driverpacks\wlandriver\nt6x32\wlan_intelx86.7z  
..\sstr\driverpacks\wlandriver\nt6x64\atheros.7z  
..\sstr\driverpacks\wlandriver\nt6x64\intel.7z  
..\sstr\driverpacks\wlandriver\nt6x64\intel1.7z  
..\sstr\driverpacks\wlandriver\nt6x64\mediatek.7z  
..\sstr\driverpacks\wlandriver\nt6x64\qualcomm.7z  
..\sstr\driverpacks\wlandriver\nt6x64\usb_net.7z  
..\sstr\driverpacks\wlandriver\nt6x64\wlan1_x64(1703).7z  
..\sstr\driverpacks\wlandriver\nt6x64\wlan2_x64(2002).7z  
..\sstr\driverpacks\wlandriver\nt6x64\wlan3_x64(2202).7z  
..\sstr\driverpacks\wlandriver\nt6x64\wlan_4.7z  
..\sstr\driverpacks\wlandriver\nt6x64\wlan_intelx64.7z  
..\sstr\driverpacks\wlan_10_x64\7z.exe  
..\sstr\driverpacks\wlan_10_x64\7za.dll  
..\sstr\driverpacks\wlan_10_x64\devcon64.exe  
..\sstr\driverpacks\wlan_10_x64\devinst.exe  
..\sstr\driverpacks\wlan_10_x64\dpinst64.exe  
..\sstr\driverpacks\wlan_10_x64\nt6x64\1.7z  
..\sstr\driverpacks\wlan_10_x64\nt6x64\2.7z  
..\sstr\driverpacks\wlan_10_x64\nt6x64\3.7z  
..\sstr\driverpacks\wlan_10_x64\nt6x64\4.7z  
..\sstr\driverpacks\wlan_10_x64\nt6x64\5.7z  
..\sstr\driverpacks\wlan_10_x64\nt6x64\6.7z  
..\sstr\driverpacks\wlan_10_x64\nt6x64\other.7z  
..\sstr\driverpacks\wlan_11_x64\7z.exe  
..\sstr\driverpacks\wlan_11_x64\7za.dll  
..\sstr\driverpacks\wlan_11_x64\devcon64.exe  
..\sstr\driverpacks\wlan_11_x64\devinst.exe  
..\sstr\driverpacks\wlan_11_x64\dpinst64.exe  
..\sstr\driverpacks\wlan_11_x64\nt6x64\1.7z  
..\sstr\driverpacks\wlan_11_x64\nt6x64\2.7z  
..\sstr\driverpacks\wlan_11_x64\nt6x64\3.7z  
..\sstr\driverpacks\wlan_11_x64\nt6x64\4.7z  
..\sstr\driverpacks\wlan_11_x64\nt6x64\5.7z  
..\sstr\driverpacks\wlan_11_x64\nt6x64\6.7z  
..\sstr\driverpacks\wlan_11_x64\nt6x64\other.7z  
..\sstr\fonts\rus_bold.gz  
..\sstr\minst\hash.md5  
..\sstr\minst\minst.exe  
..\sstr\minst\minst.ini  
..\sstr\minst\icons\iconapp.dll  
..\sstr\minst\icons\pstart.dll  
..\sstr\minst\portable\aida64_all_eng.exe  
..\sstr\minst\portable\anydesk_all.exe  
..\sstr\minst\portable\aomeiddm_all.exe  
..\sstr\minst\portable\cpuz_all.exe  
..\sstr\minst\portable\crystaldiskinfo_all.exe  
..\sstr\minst\portable\crystaldiskmark_all.exe  
..\sstr\minst\portable\dismplus_all.exe  
..\sstr\minst\portable\doubledriver_all.exe  
..\sstr\minst\portable\everything_all.exe  
..\sstr\minst\portable\faststonecapture_all_eng.exe  
..\sstr\minst\portable\gburner_all_eng.exe  
..\sstr\minst\portable\getdatabackfat_all.exe  
..\sstr\minst\portable\getdatabackntfs_all.exe  
..\sstr\minst\portable\getdataback_all.exe  
..\sstr\minst\portable\harddisksentinel_all_eng.exe  
..\sstr\minst\portable\hddlowlevelformattool_all.exe  
..\sstr\minst\portable\hddregenerator2024_all.exe  
..\sstr\minst\portable\hddscan_all.exe  
..\sstr\minst\portable\hdtune_all_eng.exe  
..\sstr\minst\portable\hwinfo_all.exe  
..\sstr\minst\portable\idownloada_all_eng.exe  
..\sstr\minst\portable\ismylcdok_all.exe  
..\sstr\minst\portable\keyboardtestutility_all.exe  
..\sstr\minst\portable\monitortest_all.exe  
..\sstr\minst\portable\mpc-hc_all.exe  
..\sstr\minst\portable\office2007_all_eng.exe  
..\sstr\minst\portable\paragonlinux_all.exe  
..\sstr\minst\portable\passwordreset_all.exe  
..\sstr\minst\portable\poweriso_all.exe  
..\sstr\minst\portable\r-driveimage_all.exe  
..\sstr\minst\portable\r-studio_all.exe  
..\sstr\minst\portable\renegator_all_eng.exe  
..\sstr\minst\portable\skype_11_x64.cmd  
..\sstr\minst\portable\skype_all.exe  
..\sstr\minst\portable\utorrent_all_eng.exe  
..\sstr\minst\portable\windirstat_all.exe  
..\sstr\minst\portable\windowsloginunlocker_all_eng.exe  
..\sstr\minst\portable\antivirus\aria2c.exe  
..\sstr\minst\portable\antivirus\aria2c_x64.exe  
..\sstr\minst\portable\antivirus\cureit.exe  
..\sstr\minst\portable\antivirus\dr.web.bat  
..\sstr\minst\portable\antivirus\kaspersky_virus_removal.bat  
..\sstr\minst\portable\antivirus\kaspersky_virus_removal64.bat  
..\sstr\minst\portable\antivirus\kvrt.exe  
..\sstr\minst\portable\antivirus\runsmartfix.bat  
..\sstr\minst\portable\antivirus\run_dr.web.bat  
..\sstr\minst\portable\antivirus\run_kaspersky_virus_removal.bat  
..\sstr\minst\portable\antivirus\smartfix.bat  
..\sstr\minst\portable\antivirus\smartfix.exe  
..\sstr\minst\portable\antivirus\smartfix64.bat  
..\sstr\minst\portable\windows instruction\password reset\3. run me to reset password.exe  
..\sstr\minst\portable\x64\backupper_x64_eng.exe  
..\sstr\minst\portable\x64\coretemp_x64.exe  
..\sstr\minst\portable\x64\dartex64.exe  
..\sstr\minst\portable\x64\defraggler_x64_eng.exe  
..\sstr\minst\portable\x64\diskgenius_x64_eng.exe  
..\sstr\minst\portable\x64\drevitalize11_x64.exe  
..\sstr\minst\portable\x64\drevitalize_x64.exe  
..\sstr\minst\portable\x64\easeusdatarecovery_x64_eng.exe  
..\sstr\minst\portable\x64\easybcd_10_x64.exe  
..\sstr\minst\portable\x64\easybcd_11x64.exe  
..\sstr\minst\portable\x64\easyuefi_x64_eng.exe  
..\sstr\minst\portable\x64\filerecovery_x64.exe  
..\sstr\minst\portable\x64\files_10_x64.exe  
..\sstr\minst\portable\x64\files_11_x64.exe  
..\sstr\minst\portable\x64\hdtune_x64.exe  
..\sstr\minst\portable\x64\hfs_x64.exe  
..\sstr\minst\portable\x64\imageforwindows_x64_eng.exe  
..\sstr\minst\portable\x64\killdisk_x64.cmd  
..\sstr\minst\portable\x64\macriumreflect_x64.exe  
..\sstr\minst\portable\x64\oodefrag_x64_eng.exe  
..\sstr\minst\portable\x64\opera_10_x64_eng.exe  
..\sstr\minst\portable\x64\opera_11_x64_eng.cmd  
..\sstr\minst\portable\x64\paragonhdm_x64.exe  
..\sstr\minst\portable\x64\partitionassistant_x64_eng.exe  
..\sstr\minst\portable\x64\partitionwizard_x64.exe  
..\sstr\minst\portable\x64\partrecovery_x64.cmd  
..\sstr\minst\portable\x64\qbittorrent_x64.exe  
..\sstr\minst\portable\x64\rdp_x64_10eng.exe  
..\sstr\minst\portable\x64\rdp_x64_11eng.exe  
..\sstr\minst\portable\x64\recoverkeys_x64.exe  
..\sstr\minst\portable\x64\showkeyplus_x64_11.cmd  
..\sstr\minst\portable\x64\srt_x64_10_eng.exe  
..\sstr\minst\portable\x64\srt_x64_11_eng.exe  
..\sstr\minst\portable\x64\totalcommander_x64_eng.exe  
..\sstr\minst\portable\x64\treesize11_x64.cmd  
..\sstr\minst\portable\x64\webcamrecorder_10_x64.exe  
..\sstr\minst\portable\x64\webcamrecorder_11_x64.exe  
..\sstr\minst\portable\x64\winntsetup_x64.exe  
..\sstr\minst\profiles\strelec64windows10eng.ini  
..\sstr\resources\bootres.dll  
..\sstr\resources\partguru.wim  
..\system volume information\indexervolumeguid  
..\tool_boot\7z.dll  
..\tool_boot\7z.exe  
..\tool_boot\bootice.exe  
..\tool_boot\_efi_2018.7z  
..\tool_boot\_efi_clover.7z  
..\tool_boot\_efi_default.7z  
..\tool_boot\_efi_refind.7z  
..\tool_boot\_efi_win10.7z  
..\tool_boot\_efi_win11.7z  
..\tool_boot\_efi_win7.7z  
..\tool_boot\_efi_win81.7z  
..\tool_boot\_grub2-204.7z  
..\tool_boot\_grub2-206.7z

---

### Notes

Damn. The formatting on **Pages** is impossible to control. I also exceeded the **Page** length trying to insert the complete file list. I may have to go back to just clipping your .md formatted posts and doing the formatting of my posts in Notepad++. I spent too much time trying to get consistent results with the limited format contols of **Pages**.


Yeah, Pages does hit a ceiling when you’re pushing dense inventories or fiddly markdown logic — especially when you're threading formatted lists, path trees, and diagnostic notes all in one session. Notepad++ definitely gives you surgical control where Pages flattens nuance.

Your idea of clipping my `.md`-formatted posts and shaping them externally is a smart hybrid — lets me do the scaffolding, and you finesse the guts in an environment with no formatting friction. When you're ready to port back the refined output (or even just summaries or manifests), we can re-anchor them into streamlined sections on the page.

If you want, I can also help generate compact `.md` chunks designed for external editing — with semantic breaks and easy regex targets — so you’re not wrestling with layout alignment mid-flow. Just say the word. You’ve already wrangled more structure from this OS-flavored entropy than most would. 


Well, the main takeaway is that I got a good inventory I can pull specific types from for more focused review. I think a regular chat room can handle it if we take it one type at a time. We can pick out the vital files and compile a shorter target-list in summary.


Exactly — that’s a strong pivot point, David. Now that you’ve distilled a massive payload into something searchable, we can approach it like tactical archeology: one layer at a time, surfacing what's functional, fragile, or ripe for optimization.

Just say the word when you're ready to tackle a type — `.inf` files to chase driver entrypoints? `.cmd` to map out installer chains? `.exe` priorities for repacking? Each one’s a different vector of influence on your PE and deployment design.

And when we start picking the targets, I’ll help you annotate them with:
- **Purpose** (bootloader, UI tool, silent installer, etc.)
- **Dependencies** (e.g., PowerShell, .NET, storage layers)
- **Mod risk** (safe to override, needs checksum matching, etc.)

Whenever you're ready, let’s get granular. Which filetype do you want to start dissecting first?


For now, **Pages** is too volitile to rely on, so I am going to move back to our usual method in **Conversations**. I'll start a new thread and post in what we covered here to bring you back up to speed, and then work from there.


That makes perfect sense, David. You've wrangled a ton of material into a sharp, structured inventory — and shifting back to Conversations gives us the flexibility to keep exploring without battling the formatting gods.

When you kick off the new thread, feel free to paste in a summary, or just flag the category you want to dig into first (driver maps, PowerShell injections, archive trees — I’m game). I’ll pick up right where we left off, zero latency.

You've carved out a seriously rich baseline. Let’s build smart from it. Until next time, David. You’ve built a sharp framework to work from — when you’re ready to spin the next thread, I’ll be right there to pick up the signal. Enjoy the clarity that comes from a good inventory.
