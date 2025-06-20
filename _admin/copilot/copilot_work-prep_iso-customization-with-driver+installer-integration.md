## Copilot - How to Create a Custom Windows Install ISO

> This is where my research has gotten me:

#### Prep Checklist: (from multiple online sources)

> [1] **Stage**  
> - F:\Win11_24H2_English_x64.iso copied to:  
> - D:\Win11_24H2_English_x64  

> [2] **Mount**  
> - mkdir D:\Mount  
> - dism /Mount-WIM /WimFile:D:\Win11_24H2_English_x64\sources\install.wim /Index:1 /MountDir:D:\Mount  

> [3] **Add drivers**  
> - dism /Image:D:\Mount /Add-Driver /Driver:D:\ASUS_G17_G713QM\_DRIVERS /Recurse  

> [4] **Dismount**  
> - dism /Unmount-WIM /MountDir:D:\Mount /Commit  

> [5] **Verify and Name**  
> - D:\ASUS_G713QM_Win11H_24H2_E_x64

---

### **Next Steps**

> This condenses our initial chat expanding on that checklist:

1. **Remount Your Windows 11 ISO**:
   - Insert the ISO or mount it virtually (right-click > Mount on the `.iso` file).
   - Ensure you locate the `install.wim` file, typically found in the `sources` folder of the mounted ISO.

2. **Revisit the DISM Injection Process**:
   - Common issues during driver injection might relate to:
     - **Driver format**: Ensure the unpacked drivers are `.inf` files. EXEs won't work directly but can be repacked as drivers using a third-party tool if needed.
     - **Path errors**: Double-check all paths for typos or missing files.
     - **Index number mismatch**: Windows images can have multiple indices (e.g., Home, Pro). You need the correct index number for your intended edition.
   - Mount the WIM file:
     ```powershell
     dism /Mount-WIM /WimFile:D:\Sources\install.wim /Index:1 /MountDir:D:\Mount
     ```
   - Identify existing Drivers:
     ```powershell
	 dism /Image:D:\Mount /Get-Drivers
     ```
   - Inject the drivers:
     ```powershell
     dism /Image:D:\Mount /Add-Driver /Driver:D:\DRIVERS /Recurse
     ```
   - Commit the changes:
     ```powershell
     dism /Unmount-WIM /MountDir:D:\Mount /Commit
     ```
   - Verify the Drivers:
     ```powershell
	 dism /Image:D:\Mount /Get-Drivers
     ```

4. **Confirm Installation**:
   - After injecting drivers, verify that the updated ISO can correctly install Windows along with drivers by testing it in a virtual environment.

---

> Task and chat resumed after a bit. The above summaries were used to refresh Copilot on the topic.

Ah, that clears things up perfectly! So, you're assembling a custom Windows 11 ISO specific to your G713QM device, and the goal is to integrate both drivers and installers into your working folder `D:\ASUS_G713QM_Win11H_24H2_E_x64` before finalizing the ISO. 

Here's a detailed step-by-step process to ensure a smooth and efficient workflow:

---

### **1. Mount the Windows 11 Donor ISO**
- **Mount the original Windows 11 ISO**:
   - Right-click the ISO file and select **Mount**.
   - Identify the `install.wim` file, usually located in the `sources` folder of the mounted ISO (e.g., `E:\sources\install.wim`).

---

### **2. Mount the Windows Image for Editing**
1. **Create a Mount Directory**:
   - Make a subdirectory for mounting:  
     ```powershell
     mkdir D:\ASUS_G713QM_Win11H_24H2_E_x64\Mount
     ```

2. **Mount the Desired Index**:
   - Mount the Windows image (Index 1 corresponds to Home; adjust the `Index` if necessary for a different edition):  
     ```powershell
     dism /Mount-WIM /WimFile:E:\sources\install.wim /Index:1 /MountDir:D:\ASUS_G713QM_Win11H_24H2_E_x64\Mount
     ```

---

### **3. Integrate Drivers**
1. **Add Drivers to the Mounted Image**:
   - Use DISM to add drivers from your dedicated driver folder:  
     ```powershell
     dism /Image:D:\ASUS_G713QM_Win11H_24H2_E_x64\Mount /Add-Driver /Driver:D:\DRIVERS /Recurse
     ```

2. **Verify the Drivers**:
   - Confirm the drivers were added successfully:  
     ```powershell
     dism /Image:D:\ASUS_G713QM_Win11H_24H2_E_x64\Mount /Get-Drivers
     ```

---

### **4. Add Unattended Installers**
1. **Prepare the Installers**:
   - Copy all files from `D:\INSTALLERS` into the working folder:  
     ```powershell
     mkdir D:\ASUS_G713QM_Win11H_24H2_E_x64\Installers
     copy D:\INSTALLERS\* D:\ASUS_G713QM_Win11H_24H2_E_x64\Installers
     ```

2. **Automate Installer Execution**:
   - Write a `SetupComplete.cmd` file that will run after Windows installation completes.  
     Create the following directory in your mounted image:
     ```powershell
     mkdir D:\ASUS_G713QM_Win11H_24H2_E_x64\Mount\Windows\Setup\Scripts
     ```
   - Save this batch script (`SetupComplete.cmd`) in the `Scripts` folder:
     ```batch
     @echo off
     REM Silent installation of apps
     start /wait %WINDIR%\Setup\Installers\Installer1.exe /silent
     start /wait %WINDIR%\Setup\Installers\Installer2.exe /quiet
     REM Add other installers here
     ```

3. **Copy Installers into the Mounted Image**:
   - Place all the installers into the appropriate folder in the mounted image:  
     ```powershell
     mkdir D:\ASUS_G713QM_Win11H_24H2_E_x64\Mount\Windows\Setup\Installers
     copy D:\INSTALLERS\* D:\ASUS_G713QM_Win11H_24H2_E_x64\Mount\Windows\Setup\Installers
     ```

---

### **5. Commit and Unmount the Image**
- Save the changes and unmount the image:
   ```powershell
   dism /Unmount-WIM /MountDir:D:\ASUS_G713QM_Win11H_24H2_E_x64\Mount /Commit
   ```

---

### **6. Create the Custom ISO**
1. **Rebuild the Bootable ISO**:
   - Use the following `oscdimg` command to create the bootable ISO:
     ```powershell
     oscdimg -m -o -u2 -bD:\ASUS_G713QM_Win11H_24H2_E_x64\boot\etfsboot.com D:\ASUS_G713QM_Win11H_24H2_E_x64 D:\ASUS_G713QM_Win11H_24H2_E_x64.iso
     ```

   - Ensure the **`etfsboot.com`** file from the original Windows ISO is placed correctly in `boot`.

2. **Burn or Use the ISO**:
   - Burn the ISO to a USB stick or DVD using tools like Rufus, or mount it directly for installation.

---

### **Potential Issues to Watch For**
- **Path Errors**: Double-check all paths, especially when transferring files to the mounted image.
- **Silent Install Flags**: Test the flags for each installer separately to ensure they work as expected.
- **Driver Compatibility**: Ensure the drivers match your target hardware (G713QM) and Windows version.

---

Let me know if you hit any snags—you're well on your way to completing this custom build for your G713QM!