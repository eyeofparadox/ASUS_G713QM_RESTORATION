copilot_diagnostics_windows-vs-asus=known-issues.txt

---

### Diagnostics - Windows vs ASUS: Known Issues & Remediations

#### • System Degredation > Run in PowerShell:

> sfc /scannow
> dism /Online /Cleanup-image /Restorehealth

#### <!> Update Graphics and Networking Drivers:
- GeForce RTX 3060
- AMD Ryzen  
- Manual Update > System Properties > Hardware > Device Manager

#### <!> Update BIOS:
There are two methods to update BIOS:
- Update BIOS in BIOS Utility (with ASUS Firmware Update/EZ Flash)
- Update BIOS in Windows

> **ASUS > FAQ > [How to Update BIOS with ASUS Firmware Update/EZ Flash](https://www.asus.com/us/support/faq/1008859/)**
> Last Update : 2025/02/11 23:49
> 
> Since some models are not able to update BIOS in Windows, this article will introduce how to update BIOS in BIOS Utility.
> 
> **Note**:
> - It is not allowed to downgrade the BIOS version.
> - Please back up your personal file before upgrading BIOS to prevent any unexpected issue.
> - The operation interface may be different because of the model version.
> - Please keep the power supply / AC adapter connected during the BIOS update process.
> - If you have any issue about the content below, please consult with ASUS Service Center.

#### • Getting dump files for accurate analysis of BSODs

Dump files are crash logs from BSODs. If you can get into Windows normally or through Safe Mode, check `C:\Windows\Minidump` for any dump files. If you have **any** dump files, copy the folder to the desktop, zip the folder and upload it. If you don't have any zip software installed, right click on the folder and select Send to → Compressed (Zipped) folder.

Upload to any easy to use file sharing site. On reddit, the best practice is to prepare multiple dump files for troubleshooting assistance. Upload the files you collect and then follow [this guide](https://www.tenforums.com/tutorials/5560-configure-windows-10-create-minidump-bsod.html) to change the dump type to Small Memory Dump. The Overwrite dump file option will be grayed out since small memory dumps never overwrite.

For a Windows 11 version of this tutorial, see:  
[Change BSOD Crash Memory Dump File Type in Windows 11](https://www.elevenforum.com/t/change-bsod-crash-memory-dump-file-type-in-windows-11.8056/)


#### Additional Notes :

Queries on many forums, presenting the same symptoms during Windows installation were often told: 

> It looks like it is an incompatible driver issue. Uncheck box where it offers to look for and download updates.
> 
> There was an acknowledgement by Microsoft in regard to some compatibility issues with some Asus motherboards , don't know if it is yours or not and recommendation was do not install Windows 11 release 24H2. So if you are attempting to install 24H2 - try an older release 23H2 or even Windows 10 as a test.



---

#### • System & Administrative Tools

**Toolkit Tip**: Create a `Control` folder with `%SystemRoot%\*.exe` shortcuts to these apps. This folder can then be a portable, task-specific tool kit that can be stored on a rescue USB and dropped anywhere you are working on a PC with at least WindowsPE or WindowsRE. Very useful when diagnosing problems that lock up a system soon after boot when you have little time to probe.  

C:\WINDOWS\system32\cmd.exe  
C:\WINDOWS\system32\compmgmt.exe  
C:\WINDOWS\system32\control.exe  
C:\WINDOWS\system32\diskmgmt.exe  
C:\WINDOWS\system32eventvwr.exe  
C:\WINDOWS\system32\msinfo32.exe  
C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe  
C:\WINDOWS\system32\resmon.exe  
C:\WINDOWS\system32\systeminfo.exe  
C:\WINDOWS\system32\SystemPropertiesAdvanced.exe  
C:\WINDOWS\system32\SystemPropertiesComputerName.exe  
C:\WINDOWS\system32\SystemPropertiesDataExecutionPrevention.exe  
C:\WINDOWS\system32\SystemPropertiesHardware.exe  
C:\WINDOWS\system32\SystemPropertiesPerformance.exe  
C:\WINDOWS\system32\SystemPropertiesProtection.exe  
C:\WINDOWS\system32\SystemPropertiesRemote.exe  
C:\WINDOWS\system32\Taskmgr.exe  

**You can also use**:  
[SetupDiag](https://download.microsoft.com/download/1/1/1/111c347e-b7de-4510-8e62-a2f046efcc48/SetupDiag.exe). To use it, you need [Microsoft .NET Framework 4.7.2 offline installer for Windows](https://download.microsoft.com/download/f/3/a/f3a6af84-da23-40a5-8d1c-49cc10c8e76f/NDP472-KB4054530-x86-x64-AllOS-ENU.exe). It is a strongly recommended addition to any custom WinRE Boot USB you might need to create though. 
