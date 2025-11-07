Did ASUS **ROG Strix G713QM** originally come with **Windows 10 version 1903 (10.0.18362.86)?**

Today

I'm trying to identify the windows version of a backup. What files in/under Windows would tell me?

Thursday, May 22

If you have a backup and want to determine the Windows version it belongs to, there are a few files that can help:

1. `C:\Windows\System32\winver.exe` – Running this executable (on a system where the backup is restored) will show the Windows version.  
2. `C:\Windows\System32\license.rtf` – This text file often contains information about the Windows version.  
3. `C:\Windows\System32\ntoskrnl.exe` – Examining this file’s version details can help pinpoint the Windows version.  
4. `C:\Windows\System32\hal.dll` – Another system file whose version details indicate the Windows release.  
5. `C:\Windows\System32\kernel32.dll` – Checking the properties of this DLL can show the OS version.  
6. `C:\Windows\System32\osver.ini` (if present) may also contain details about the installed Windows version.

To find version details, right-click any of these files, go to **Properties**, and check the **Details** tab. Alternatively, if you can boot into the backup, running `winver` from the **Run** dialog (`Win + R`) will also show the version.

Are you working with an old backup, or is this for a recent recovery project?

Today

Okay, what iso would likely have installed v.10.0.18362.86?

Thursday, May 22

The Windows version **10.0.18362.86** corresponds to **Windows 10, version 1903 (May 2019 Update)**. This build was released to Windows Insiders in April 2019 and later rolled out more broadly2. If you're looking for an ISO that would have installed this version, you'd need the **Windows 10 version 1903 ISO**.

If you're searching for a legitimate download, Microsoft may no longer provide direct access to older ISOs, but you can check official sources like the Microsoft Community Hub for guidance on obtaining Windows 10 ISOs in 2025\.

Are you trying to restore an older system or troubleshoot compatibility issues?

Edit this response

Today

Hmm. I think I just identified the version pre-installed on my ASUS G713QM. If I can track down that iso and inject the ASUS drivers (most are 2019-2022 era), it might produce a stable OS.

Thursday, May 22

That sounds like a solid plan\! If your ASUS **ROG Strix G713QM** originally came with **Windows 10 version 1903 (10.0.18362.86)**, finding the corresponding ISO and integrating the ASUS drivers could help ensure stability.

To track down the correct ISO:

* **Official Microsoft Sources**: Microsoft may not provide direct downloads for older Windows 10 versions, but you can check their support page or use the **Media Creation Tool** to see available versions.  
* **ASUS Support**: ASUS may have recovery images or guidance on reinstalling the original OS. You can check their support page for details.  
* **Third-Party Archives**: Some reputable sites archive older Windows ISOs, but be cautious and ensure authenticity.

Once you have the ISO, injecting ASUS drivers (especially chipset, GPU, and storage drivers) should help optimize performance. You can use tools like **NTLite** to integrate drivers before installation.

Are you aiming for a clean install, or do you want to preserve some existing configurations?

Today

I may have to do a clean install. My previous attempts to install Windows have wiped out the original partitions. I found an OEM image that is supposed to cover my model, but don't know for certain until I can try it.

Thursday, May 22

That makes sense—sometimes a clean install is the only way to truly reset things, especially when previous installations have altered partition structures. Since you've found an OEM image that *should* match your ASUS **G713QM**, that's promising\!

To maximize your chances of success:

* **Check for ASUS Pre-Installed Software** – Some OEM images come bundled with factory software and drivers. If yours does, it could save time on post-installation setup.  
* **Compare the Build Number** – Before installing, see if the OEM image contains **Windows 10 version 1903 (10.0.18362.86)** or something close to what originally came with your system.  
* **Verify Drivers Compatibility** – If the OEM image lacks drivers, manually integrating ASUS chipset, GPU, and storage drivers before installation could help stability.  
* **Backup Critical Data** – If the installation requires formatting, make sure any essential data is backed up first.  
* **Test Boot Stability** – After installation, running stress tests on core components (GPU, storage, RAM) will help confirm stability.

Since you've already wiped the original partitions, this fresh install could be the best path forward. Are you aiming for stock ASUS software, or do you prefer a fully stripped-down system?

Today

The Minimum OS Version listed for Windows 10 64-bit is 20H1 or 20H2.

Thursday, May 22

Ah, I see—so it looks like ASUS lists **Windows 10 20H1 (version 2004\) or 20H2 (version 2009\)** as the minimum supported versions for your **G713QM**. That might mean the OEM image you found, if it's for **version 1903**, could be too old to work optimally with ASUS's official drivers.

If you're aiming for a stable installation:

* **Finding the Right ISO** – You might want to look for a **Windows 10 20H1 or 20H2** ISO instead of 1903\.  
* **Driver Compatibility** – If you install an older Windows version (like 1903), some ASUS drivers might refuse to install, affecting stability.  
* **ASUS Support** – Checking their driver download page could confirm which OS versions they officially support.

Are you still considering testing the OEM image, or would you prefer finding an ISO that matches 20H1/20H2?

Today

Ah. I guess that means the archive was from an older computer, then. Good to know.

Thursday, May 22

Yeah, that makes sense—it was likely an image from a different system with an earlier Windows version. At least now you can focus on tracking down an ISO that matches **Windows 10 20H1 or 20H2** for the best compatibility with your **G713QM**.

If you go the clean install route, injecting those **2019-2022 ASUS drivers** should help stabilize things, especially chipset and storage drivers. Hopefully, this install works out smoothly\!

Do you have a backup of any ASUS software you wanted to keep, or are you aiming for a fresh, no-frills setup?

Today

I want to get close to factory settings to avoid all the pitfalls I've hit using non-asus install media.

Thursday, May 22

That’s a smart approach—using **ASUS-provided install media** ensures proper driver integration and avoids compatibility issues that can come with generic Windows installations.

To get as close as possible to **factory settings**, here’s what you can try:

1. **Locate ASUS Official Recovery Media** – Some ASUS models allow users to download their original recovery image through the ASUS support site. If available, this will include all factory-installed drivers and software.  
2. **Use ASUS EZ Flash / MyASUS Tools** – ASUS sometimes provides recovery utilities within the BIOS or their **MyASUS** app. If your system has these tools, they might restore the original factory setup.  
3. **Integrate ASUS Drivers Before Installing** – If you need to use a standard Windows 10 ISO, manually injecting ASUS-specific drivers (chipset, storage, GPU, networking) before installation can help replicate factory stability.  
4. **Check for ASUS Recovery Partition** – Some ASUS laptops have a hidden recovery partition that allows restoring factory settings. If it’s still intact, it might be accessible via boot options or BIOS recovery tools.

Since non-ASUS install media has caused issues before, sticking to a setup closest to what ASUS intended should help avoid unexpected glitches.

Are you hoping to bring back any ASUS pre-installed software, or just focusing on hardware stability?

Today

I checked for 1 and 2 and neither exists for my model. I need as much pre-installed software to achieve hardware stability.

Thursday, May 22

That makes sense—getting as close to the original ASUS setup as possible should help ensure stability. Since your model doesn’t have official recovery media or built-in ASUS restoration tools, here’s how you can manually restore pre-installed software:

1. **ASUS Download Center** – You can find drivers, firmware, and ASUS utilities for your **G713QM** on the ASUS Download Center.  
2. **MyASUS App** – If your system supports it, the MyASUS Service Center can help manage ASUS-specific software and updates.  
3. **ASUS Support Page for G713QM** – The official ASUS support page for your model may have additional troubleshooting guides and software recommendations.  
4. **Microsoft Community Guide** – There’s a helpful discussion on restoring ASUS pre-installed apps after a clean Windows install.

Once you’ve downloaded the necessary ASUS software, installing them in the correct order (chipset, storage, GPU, then utilities) should help replicate the factory setup as closely as possible.

Today

I'm trying to identify the windows version of a backup. What files in/under Windows would tall me?

Thursday, May 22

If you have a backup and want to determine the Windows version it belongs to, there are a few files that can help:

1. `C:\Windows\System32\winver.exe` – Running this executable (on a system where the backup is restored) will show the Windows version.  
2. `C:\Windows\System32\license.rtf` – This text file often contains information about the Windows version.  
3. `C:\Windows\System32\ntoskrnl.exe` – Examining this file’s version details can help pinpoint the Windows version.  
4. `C:\Windows\System32\hal.dll` – Another system file whose version details indicate the Windows release.  
5. `C:\Windows\System32\kernel32.dll` – Checking the properties of this DLL can show the OS version.  
6. `C:\Windows\System32\osver.ini` (if present) may also contain details about the installed Windows version.

To find version details, right-click any of these files, go to **Properties**, and check the **Details** tab. Alternatively, if you can boot into the backup, running `winver` from the **Run** dialog (`Win + R`) will also show the version.

Are you working with an old backup, or is this for a recent recovery project?

Today

Okay, what iso would likely have installed v.10.0.18362.86?

Thursday, May 22

The Windows version **10.0.18362.86** corresponds to **Windows 10, version 1903 (May 2019 Update)**. This build was released to Windows Insiders in April 2019 and later rolled out more broadly2. If you're looking for an ISO that would have installed this version, you'd need the **Windows 10 version 1903 ISO**.

If you're searching for a legitimate download, Microsoft may no longer provide direct access to older ISOs, but you can check official sources like the Microsoft Community Hub for guidance on obtaining Windows 10 ISOs in 2025\.

Are you trying to restore an older system or troubleshoot compatibility issues?

Edit this response

Today

Hmm. I think I just identified the version pre-installed on my ASUS G713QM. If I can track down that iso and inject the ASUS drivers (most are 2019-2022 era), it might produce a stable OS.

Thursday, May 22

That sounds like a solid plan\! If your ASUS **ROG Strix G713QM** originally came with **Windows 10 version 1903 (10.0.18362.86)**, finding the corresponding ISO and integrating the ASUS drivers could help ensure stability.

To track down the correct ISO:

* **Official Microsoft Sources**: Microsoft may not provide direct downloads for older Windows 10 versions, but you can check their support page or use the **Media Creation Tool** to see available versions.  
* **ASUS Support**: ASUS may have recovery images or guidance on reinstalling the original OS. You can check their support page for details.  
* **Third-Party Archives**: Some reputable sites archive older Windows ISOs, but be cautious and ensure authenticity.

Once you have the ISO, injecting ASUS drivers (especially chipset, GPU, and storage drivers) should help optimize performance. You can use tools like **NTLite** to integrate drivers before installation.

Are you aiming for a clean install, or do you want to preserve some existing configurations?

Today

I may have to do a clean install. My previous attempts to install Windows have wiped out the original partitions. I found an OEM image that is supposed to cover my model, but don't know for certain until I can try it.

Thursday, May 22

That makes sense—sometimes a clean install is the only way to truly reset things, especially when previous installations have altered partition structures. Since you've found an OEM image that *should* match your ASUS **G713QM**, that's promising\!

To maximize your chances of success:

* **Check for ASUS Pre-Installed Software** – Some OEM images come bundled with factory software and drivers. If yours does, it could save time on post-installation setup.  
* **Compare the Build Number** – Before installing, see if the OEM image contains **Windows 10 version 1903 (10.0.18362.86)** or something close to what originally came with your system.  
* **Verify Drivers Compatibility** – If the OEM image lacks drivers, manually integrating ASUS chipset, GPU, and storage drivers before installation could help stability.  
* **Backup Critical Data** – If the installation requires formatting, make sure any essential data is backed up first.  
* **Test Boot Stability** – After installation, running stress tests on core components (GPU, storage, RAM) will help confirm stability.

Since you've already wiped the original partitions, this fresh install could be the best path forward. Are you aiming for stock ASUS software, or do you prefer a fully stripped-down system?

Today

The Minimum OS Version listed for Windows 10 64-bit is 20H1 or 20H2.

Thursday, May 22

Ah, I see—so it looks like ASUS lists **Windows 10 20H1 (version 2004\) or 20H2 (version 2009\)** as the minimum supported versions for your **G713QM**. That might mean the OEM image you found, if it's for **version 1903**, could be too old to work optimally with ASUS's official drivers.

If you're aiming for a stable installation:

* **Finding the Right ISO** – You might want to look for a **Windows 10 20H1 or 20H2** ISO instead of 1903\.  
* **Driver Compatibility** – If you install an older Windows version (like 1903), some ASUS drivers might refuse to install, affecting stability.  
* **ASUS Support** – Checking their driver download page could confirm which OS versions they officially support.

Are you still considering testing the OEM image, or would you prefer finding an ISO that matches 20H1/20H2?

Today

Ah. I guess that means the archive was from an older computer, then. Good to know.

Thursday, May 22

Yeah, that makes sense—it was likely an image from a different system with an earlier Windows version. At least now you can focus on tracking down an ISO that matches **Windows 10 20H1 or 20H2** for the best compatibility with your **G713QM**.

If you go the clean install route, injecting those **2019-2022 ASUS drivers** should help stabilize things, especially chipset and storage drivers. Hopefully, this install works out smoothly\!

Do you have a backup of any ASUS software you wanted to keep, or are you aiming for a fresh, no-frills setup?

Today

I want to get close to factory settings to avoid all the pitfalls I've hit using non-asus install media.

Thursday, May 22

That’s a smart approach—using **ASUS-provided install media** ensures proper driver integration and avoids compatibility issues that can come with generic Windows installations.

To get as close as possible to **factory settings**, here’s what you can try:

1. **Locate ASUS Official Recovery Media** – Some ASUS models allow users to download their original recovery image through the ASUS support site. If available, this will include all factory-installed drivers and software.  
2. **Use ASUS EZ Flash / MyASUS Tools** – ASUS sometimes provides recovery utilities within the BIOS or their **MyASUS** app. If your system has these tools, they might restore the original factory setup.  
3. **Integrate ASUS Drivers Before Installing** – If you need to use a standard Windows 10 ISO, manually injecting ASUS-specific drivers (chipset, storage, GPU, networking) before installation can help replicate factory stability.  
4. **Check for ASUS Recovery Partition** – Some ASUS laptops have a hidden recovery partition that allows restoring factory settings. If it’s still intact, it might be accessible via boot options or BIOS recovery tools.

Since non-ASUS install media has caused issues before, sticking to a setup closest to what ASUS intended should help avoid unexpected glitches.

Are you hoping to bring back any ASUS pre-installed software, or just focusing on hardware stability?

Today

I checked for 1 and 2 and neither exists for my model. I need as much pre-installed software to achieve hardware stability.

Thursday, May 22

That makes sense—getting as close to the original ASUS setup as possible should help ensure stability. Since your model doesn’t have official recovery media or built-in ASUS restoration tools, here’s how you can manually restore pre-installed software:

1. **ASUS Download Center** – You can find drivers, firmware, and ASUS utilities for your **G713QM** on the ASUS Download Center.  
2. **MyASUS App** – If your system supports it, the MyASUS Service Center can help manage ASUS-specific software and updates.  
3. **ASUS Support Page for G713QM** – The official ASUS support page for your model may have additional troubleshooting guides and software recommendations.  
4. **Microsoft Community Guide** – There’s a helpful discussion on restoring ASUS pre-installed apps after a clean Windows install.

Once you’ve downloaded the necessary ASUS software, installing them in the correct order (chipset, storage, GPU, then utilities) should help replicate the factory setup as closely as possible.

Are there any specific ASUS apps or features you’re hoping to restore?

Today

 This is what I found last night:

 

G513Q Driver DVD Version 0.09\_20H2

 

 File name: G513QM\_2009\_X64\_V0.09.7z

 Creation date: 13.06.2021

Date changed: September 22, 2023

System: Windows 10

MD5 checksum: 206e5a3f20e4626babd7985e26b4f4bd

Changelog

Driver DVD for Windows 10

Valid for the following models:

G513QC, G513QE, G513QM, G513QR, G533QM, G533QR, G533QS, G713QC, G713QE, G713QM, G713QR, G733QM, G733QR, G733QS, G713QH, G513QH, G733QSA

I will test it tonight or tomorrow, but I'm not sure what to start it up with. The first executable in the iso is \`P:\\AsusInsWiz.exe\`, so I can just install from the mounted image, right? I can boot from my generic WinPE/Anhdv Boot USB already, so there seems to be no need to reconstruct the original RESTORE partition. AFIK, anyway.

Thursday, May 22

That sounds like a promising find\! Since the **G513Q Driver DVD Version 0.09\_20H2** covers your **G713QM**, it should contain the correct drivers for your hardware.

### **Installation Approach:**

* **Mount the ISO** – Yes, you should be able to install directly from the mounted image.  
* **Run** `AsusInsWiz.exe` – If this is ASUS’s installation wizard, it may automate driver and software setup.  
* **Manual Installation** – If the wizard doesn’t work, manually install drivers by extracting the contents and running setup files for each driver.

### **Restore Partition Considerations:**

* Since you already have **WinPE/Anhdv Boot USB**, reconstructing the original RESTORE partition likely isn't necessary unless you're aiming for **factory-style recovery**.  
* If stability issues arise, you might consider creating a backup image after installing everything successfully.

Let me know how your test goes\! Hopefully, this gets you closer to a rock-solid setup. 

