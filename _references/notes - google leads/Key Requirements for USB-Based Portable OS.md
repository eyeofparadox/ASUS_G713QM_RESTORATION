## **Key Requirements for USB-Based Portable OS**

Your **USB mirror** can serve as a **portable OS**, provided certain conditions are met. Here’s what needs to be in place:

### **Key Requirements for USB-Based Portable OS**

1. **Windows To Go Setup** (or similar custom bootable environment)  
   * **Windows To Go** was Microsoft’s official portable Windows solution, though now discontinued.  
   * You can use tools like **Rufus** or **WinToUSB** to create a full Windows installation on your **USB drive**.  
2. **Bootable Setup**  
   * Your USB must have a **bootable partition** with all necessary system files.  
   * Use **diskpart** or a tool like **EasyBCD** to configure your USB for booting.  
3. **Mirror Strategy**  
   * The **ROBOCOPY mirrored archive** must contain **all necessary OS files**, including **EFI boot files and critical system drivers**.  
   * If the archive contains **Windows system files**, it can be restored onto a secondary drive, making it usable.  
4. **BIOS/UEFI Compatibility**  
   * Ensure the **PC BIOS or UEFI** supports **USB booting** (secure boot may need adjustments).  
   * Some older systems may require **Legacy Boot Mode**.

### **How to Confirm USB is Bootable**

Once the mirror is created:

1. Restart your PC.  
2. Enter **BIOS/UEFI setup** (usually by pressing **F2, F12, DEL, or ESC** at startup).  
3. Choose **USB drive** as the first boot option.  
4. If successful, Windows should launch from your USB drive.

### **Final Verdict**

Your **ARCHIVE USB mirror** can serve as a portable OS **IF** it includes bootable system files and is properly configured. If you want this functionality guaranteed, I can help refine your process further—just let me know how deep you want to go. 🚀

Key Requirements for USB-Based Portable OS; 1\. ✔ I have Rufus handy. 2\. ✔ I manually mirrored the boot and recovery portions, of equal size (data copied over manually). 3\. ✔ A manual back has already been created. The ARCHIVE script will maintain it. 4\. I may have an issue on my X750JB (circa 2013-2019) which fails to boot from my UEFI rescue USBs, though it could be booted from an older HP (MBR, with HPLAUNCHER virtual CD) USB drive.

You've got a solid foundation for a **portable OS**, and your **ARCHIVE system** is well-structured\! The main issue appears to be **UEFI boot compatibility** on your X750JB. Here are some things to check:

### **Troubleshooting UEFI Boot Failures**

Since your older **HP MBR-based USB** boots successfully, but your **UEFI rescue USB fails**, consider the following fixes:

1. **BIOS/UEFI Mode Check**  
   * Enter BIOS (**F2 or DEL** at startup).  
   * Look for an option like **Boot Mode** → If set to **UEFI-only**, try enabling **Legacy (CSM) Mode**.  
   * Ensure **Secure Boot** is disabled (it can block non-certified boot sources).  
2. **Partition Scheme Alignment**  
   * Your ASUS X750JB likely expects **GPT** formatted USB drives.  
   * Your HP booted an **MBR-based USB**, meaning it may use **Legacy Boot Mode**.  
3. **Solution:** Re-create your rescue USB using **GPT \+ UEFI boot** in **Rufus**:  
   * **Partition Scheme:** GPT  
   * **File System:** FAT32 (For UEFI compatibility)  
   * **Boot Mode:** UEFI (No CSM)  
4. **Check Boot Order**  
   * Some ASUS models prioritize **internal drives over USB**.  
   * Go into BIOS and ensure **USB Drive** is at the top in **Boot Priority**.  
5. **Bootloader Issue**  
   * If your **USB rescue media** uses Windows PE, ensure it includes **bootx64.efi** in the EFI partition.  
   * If missing, manually copy it from a working Windows installation.

### **Next Steps**

Try these adjustments and let me know if your X750JB can boot successfully from the **UEFI rescue USB**. If it still refuses to boot but your HP works fine, we may need a deeper **bootloader fix**. You’re definitely on the right track\! 

I think I get it. Unless there's more I should know about \*\*Legacy Boot Mode\*\*, and maybe expand on how it differs from \*\*GPT\*\*. I have had mixed results using Rufus, or trying to replicate USB keys. Block out how to re-create a rescue USB using \*\*GPT \+ UEFI boot\*\* in \*\*Rufus\*\*, would you? I may also have run into a \*\*Bootloader Issue\*\* on the RESTORE partition of my G713QM. I created RESTORE, MYASUS and OEM partitions for it from that HP USB Restore drive (created at the OOBE's prompting when I first got the laptop). I had a spare 250GB external available and was a bit miffed when the setup left only the ESD-USB partition and the VCD accessible (about 32GB)\! I recovered a lot of data when I learned how to use partitioning tools.

You’ve got a solid understanding of how boot modes work, but let’s expand on **Legacy Boot Mode vs. GPT**, tackle Rufus usage for **GPT \+ UEFI boot**, and dig into the **Bootloader Issue** you encountered with the RESTORE partition.

### **Legacy Boot Mode vs. GPT (and UEFI Boot)**

The **main difference** between Legacy and UEFI boot modes is how they handle the **partitioning scheme** and boot process.

#### **Legacy (BIOS) Boot Mode**

* Uses **MBR (Master Boot Record)**.  
* Limited to **4 primary partitions** per disk (max size: **2TB**).  
* Stores bootloader in the **first sector (512 bytes) of the disk**.  
* Compatible with older systems that don’t support **UEFI firmware**.

#### **UEFI Boot Mode (GPT)**

* Uses **GPT (GUID Partition Table)**, allowing **128 partitions per disk**.  
* Can boot from **disks larger than 2TB**.  
* Stores bootloader in the **EFI partition**, NOT the first sector.  
* Required for **Secure Boot and fast boot optimization**.  
* Improves reliability, because GPT includes **redundant partition tables**.

So, if your ASUS **X750JB** won’t boot USB rescue disks, **it may default to Legacy Boot Mode or need Secure Boot disabled**.

### **Creating a Rescue USB with GPT \+ UEFI Boot in Rufus**

Since Rufus sometimes produces **mixed results**, here’s the **proper setup**:

#### **1️⃣ Insert USB and Open Rufus**

* Plug in a **USB drive** (at least **8GB, preferably 16GB+**).  
* Open **Rufus**.

#### **2️⃣ Select ISO & Partition Scheme**

* Choose your **Windows Rescue ISO**.  
* Set **Partition Scheme: GPT**.  
* **File System: FAT32** (UEFI requires FAT32; NTFS may cause boot failures).  
* **Boot Mode: UEFI (No CSM)**.

#### **3️⃣ Format USB with Proper Bootloader**

* Enable **"Create extended label and icon files."**  
* Select **"Standard Windows Installation"** (not Windows To Go).  
* Click **"Start"**, then confirm formatting.

#### **4️⃣ Verify Boot Files Exist**

After Rufus completes:

* Ensure **EFI folder** exists on the USB.  
* Confirm presence of **bootx64.efi** in EFI \> Boot.  
* Test USB by booting into your **BIOS/UEFI**, selecting the USB drive.

### **Bootloader Issue on Your G713QM (RESTORE Partition)**

It sounds like the **HP Restore Drive** only exposed **ESD-USB (setup files) and the VCD partition (virtual CD)**, restricting direct access to your **RESTORE, MYASUS, and OEM partitions**.

**Possible cause?**

* **OEM partitions may be hidden** by HP’s custom firmware.  
* The bootloader may point **only to the ESD-USB partition**.

#### **Fixing Accessibility Issues**

Since you successfully recovered data using **partitioning tools**, you can:

1. **Make partitions visible**  
   * Open **Disk Management** (`diskmgmt.msc`).  
   * Locate hidden partitions \> Assign drive letters.  
2. **Reconfigure Bootloader (If Needed)**  
   * Use **bcdedit** to confirm if boot entries exist.  
   * Manually restore boot files to the EFI partition if missing.

### **Next Steps**

Since you've already **replicated partitions**, let me know if you need: ✔ Bootloader fixes to ensure **OEM recovery works** on your G713QM. ✔ A deeper dive into **UEFI partition recovery** if Rufus results remain inconsistent.

You've got a **strong technical grip on all this**, but let's refine it further for seamless execution.

The first eye-opener is recognizing that part of the issue relates to the fact that the G713QM lists MBR as the local boot option, even though I was working on the assumption the laptop used UEFI to boot. In spite of the fact that I confirmed it had the most recent BIOS update (331).

That’s an intriguing revelation\! The **G713QM** should be fully capable of **UEFI boot**, especially with BIOS **version 331**, but if it's defaulting to **MBR boot**, that suggests one of a few possibilities:

### **Potential Causes & Fixes**

 ✔ **BIOS Boot Mode Misconfiguration**

* Even with the latest BIOS, some ASUS models **default to MBR Boot Mode** unless **UEFI Boot** is explicitly selected.  
* Enter BIOS (`F2 or DEL` at startup) → Check **Boot Mode** → Ensure it’s set to **UEFI Only** (not UEFI \+ Legacy).

 ✔ **Partition Scheme Mismatch**

* If your rescue USB or local disk is formatted as **MBR**, the system **may prioritize MBR boot** even if UEFI is enabled.  
* Recreating your rescue USB as **GPT** could resolve this.

 ✔ **Hidden BIOS Settings (OEM Defaults)**

* Some ASUS models have BIOS settings like **CSM Mode** (Compatibility Support Module) that allow **MBR booting** even if UEFI is enabled.  
* If **CSM is ON**, try turning it **OFF**, ensuring Secure Boot is disabled (temporarily, if needed).

 ✔ **Bootloader Conflict on Restore Partition**

* Since you **manually created RESTORE, MYASUS, and OEM partitions**, the **bootloader may still reference MBR boot files** instead of GPT/UEFI.  
* **Checking the boot entries** (`bcdedit /enum`) could confirm which boot method the system is defaulting to.

Would you like a **bcdedit repair method** or a way to **force UEFI boot recognition** from BIOS? You’ve already uncovered a critical clue, so the solution may be close\! 🚀

I've been using a lot of newer online help geared toward UEFI.

That’s a smart move\! UEFI has become the standard for modern systems, and focusing on newer online resources will ensure you're troubleshooting with the **most relevant methods**. Since you're already deep into **UEFI boot processes**, you likely know about tools like **BCDEDIT, Diskpart, and Bootrec**—but if anything feels unclear, I can refine those topics for you.

Do you want to **focus on fixing bootloader issues** (like the one on your G713QM) or **optimize your UEFI rescue setup further**? You're already ahead of the curve on this.

I had a followup question about using diskpart or a tool like EasyBCD to configure your USB for booting. I'm getting used to Powershell and DISKPART, so show me what I need to do for that, would you?

Absolutely\! Since you're working with **PowerShell** and **DISKPART**, I'll guide you through the process of setting up your **USB drive for booting** using **DISKPART**. If you also want an **EasyBCD** walkthrough afterward, I can provide that too\!

### **🚀 Configuring USB for Booting via DISKPART**

1️⃣ **Open an Elevated Command Prompt**

* Press `Win + R`, type `cmd`, then press `Ctrl + Shift + Enter` for admin access.

2️⃣ **Launch DISKPART**

Type:  
plaintext  
diskpart

* Hit **Enter** to start **DISKPART**.

3️⃣ **Identify Your USB Drive**

Type:  
plaintext  
list disk

* Locate your **USB drive** in the list (e.g., `Disk 2`).  
* **Important:** **Make sure you’re selecting the correct drive**, as the next step will wipe it completely.

4️⃣ **Select the USB Drive**

Replace `X` with your **USB disk number**:  
plaintext  
select disk X

5️⃣ **Wipe the USB (⚠️ Warning: This will erase all data\!)**

Type:  
plaintext  
clean

6️⃣ **Create a Primary Partition**

Type:  
plaintext  
create partition primary

Then, select it:  
plaintext  
select partition 1

7️⃣ **Format as FAT32 or NTFS**

For **UEFI boot (modern systems)**:  
plaintext  
format fs=fat32 quick

For **BIOS boot (legacy systems)**:  
plaintext  
format fs=ntfs quick

8️⃣ **Mark as Active (Only for Legacy BIOS Boot)**

If using **BIOS boot**, set the partition active:  
plaintext  
active

* (Skip this step if using **UEFI boot**).

9️⃣ **Assign a Drive Letter**

Type:  
plaintext  
assign

🔟 **Exit DISKPART**

Type:  
plaintext  
exit

### **💾 Copy Bootable Files**

If installing **Windows**, copy **bootable setup files**:  
powershell  
robocopy "C:\\ISOContents" "X:\\" /E

* *(Replace* `C:\ISOContents` *with the path where you extracted the Windows ISO.)*  
* For **Linux** or other OS setups, use **Rufus** or **EasyBCD** for bootloader configurations.

### **💡 Would You Like an EasyBCD Walkthrough?**

EasyBCD is great for configuring **multi-boot options** or adding ISO-based boot entries. Let me know if you'd like a guide for that too\! 🚀 Let me know if anything needs tweaking while you set up your USB.

I just downloaded it from SourceForge, so go right ahead.

Awesome\! Since you've got **EasyBCD** downloaded, let's walk through setting up a **bootable USB drive** with it.

### **🚀 Setting Up Bootable USB with EasyBCD**

### **1️⃣ Install & Open EasyBCD**

1. **Run the EasyBCD installer** and follow the setup instructions.  
2. Open **EasyBCD** once installed.

### **2️⃣ Add Bootable USB Entry**

1. Click **"BCD Deployment"** in the left-hand menu.  
2. Under **"Partition Management"**, select your **USB drive**.  
3. Click **"Install BCD"** to configure the boot files.

✔ This step prepares your USB drive for booting.

### **3️⃣ Add Bootloader to USB**

1. Click **"Add New Entry"** from the left menu.  
2. Choose:  
   * **Windows** → If booting Windows (select `WinPE`).  
   * **Linux** → If booting Linux (use `GRUB2`).  
   * **ISO Boot** → If booting directly from a disk image.  
3. Select the **USB drive** and click **"Add Entry."**

✔ This installs the necessary bootloader onto the USB.

### **4️⃣ Configure Boot Order**

1. Go to **"Edit Boot Menu."**  
2. Ensure your **USB option is listed** and check its priority.  
3. Click **"Save Settings."**

✔ Now, your USB will be selectable at boot\! 🚀

### **💡 Final Step: Test the USB**

1. Restart your PC.  
2. Enter BIOS (`F12`, `Esc`, or `Del`, depending on your motherboard).  
3. Select **USB Boot** from the boot menu.  
4. Confirm it loads into your OS or setup screen\!

That should set up **your USB as a bootable device using EasyBCD\!** If you'd like help with **multi-booting multiple OSes**, let me know. 🚀 Does this match what you were looking for?

I can work with it. You also mentioned setting up the BIOS to allow the PC to boot from a USB. The G713QM's current BIOS is: \*\*ASUS\_G713QM\_331\_BIOS\_Update\_2\*\*

Great\! Since your **ASUS G713QM** is running **BIOS version 331**, let's go through the steps to enable **USB booting**.

### **🚀 Enabling USB Boot in ASUS G713QM BIOS**

1️⃣ **Enter BIOS Setup**

* Restart your PC.  
* **Press** `F2` **repeatedly** as soon as the ASUS logo appears.

2️⃣ **Enable USB Boot**

* Navigate to **Advanced Mode** (`F7`).  
* Go to **Boot Configuration**.  
* Locate **"Boot Option Priorities"** and ensure **USB is listed**.  
* If USB is missing, enable **"Launch CSM"** (Compatibility Support Module).

3️⃣ **Set USB as First Boot Device**

* Under **Boot Order**, move your **USB drive to the top**.  
* If using **UEFI boot**, ensure **Secure Boot is disabled**.

4️⃣ **Disable Secure Boot (If Needed)**

* Go to **Security \> Secure Boot**.  
* Set **Secure Boot Control** to **Disabled**.

5️⃣ **Save & Exit**

* Press **F10** to save changes and restart.

### **💡 Additional ASUS Resources**

You can find ASUS's official guide on **USB booting** here, and BIOS updates for your **G713QM model** here.

Try these steps and let me know if your USB boots successfully\! 🚀 If you need help with **BIOS updates or troubleshooting**, I’ve got you covered.

Okay. I've been able to boot from a USB rescue drive all along, so I'm probably good to go.

That’s great\! Since you already have **USB booting working**, your setup should be solid. 🚀

Now that you’ve got everything streamlined—**ARCHIVE automation, scheduled backups, and bootable USB setup**—you’re in a great spot. If you ever need to refine anything, tweak automation, or explore advanced configurations, just let me know\!

Would you like to do any final testing or optimizations before wrapping up this project?

### [**NeoSmart Technologies**](https://neosmart.net/EasyBCD/)

[https://neosmart.net › EasyBCD](https://neosmart.net/EasyBCD/)

EasyBCD is a software utility for Windows that lets you control and configure the BCD/BOOTMGR bootloader for Windows 7, Windows 10, and Windows 11 for ...

[User Guide](https://neosmart.net/wiki/easybcd/)

[Easy Recovery Essentials](https://neosmart.net/EasyRE/)

[Software Store](https://neosmart.net/Store)

[Changelog](https://neosmart.net/Software/Changelog/1)

### [**SourceForge**](https://sourceforge.net/projects/easybcd/)

[https://sourceforge.net › ... › System › Boot](https://sourceforge.net/projects/easybcd/)

Dec 17, 2024 — EasyBCD is a powerful and user-friendly bootloader modification tool that allows users to manage and customize the Windows Boot Manager.

### [**EasyBCD \- Wikipedia**](https://en.wikipedia.org/wiki/EasyBCD#:~:text=EasyBCD%20can%20be%20used%20to,of%20the%20Windows%20boot%20menu.)

[Wikipedia](https://en.wikipedia.org/wiki/EasyBCD#:~:text=EasyBCD%20can%20be%20used%20to,of%20the%20Windows%20boot%20menu.)

[https://en.wikipedia.org › wiki › EasyBCD](https://en.wikipedia.org/wiki/EasyBCD#:~:text=EasyBCD%20can%20be%20used%20to,of%20the%20Windows%20boot%20menu.)

### **Is EasyBCD legit?**

Should you download it? While it isn't made to fix a PC that won't boot, EasyBCD can do just about anything else within the realm of booting programs. It's a convenience and a pleasure to have in your arsenal when experimenting with different boot scenarios.Jul 17, 2024

[EasyBCD for Windows \- Free download and software reviews](https://download.cnet.com/easybcd/3000-windows-easybcd.html#:~:text=Should%20you%20download%20it%3F,experimenting%20with%20different%20boot%20scenarios.)

### [**CNET Download**](https://download.cnet.com/easybcd/3000-windows-easybcd.html#:~:text=Should%20you%20download%20it%3F,experimenting%20with%20different%20boot%20scenarios.)

[https://download.cnet.com › easybcd › 3000-windows-ea...](https://download.cnet.com/easybcd/3000-windows-easybcd.html#:~:text=Should%20you%20download%20it%3F,experimenting%20with%20different%20boot%20scenarios.)

### **People also ask**

### **What is EasyBCD used for?**

EasyBCD can be used to set up multi-boot environments for computers on which some versions of Windows, Linux, BSD and Mac OS X can be simultaneously installed; EasyBCD can also be used for adding entries to bootable tools and utilities, as well as modifying and controlling the behavior of the Windows boot menu.

### [**EasyBCD \- Wikipedia**](https://en.wikipedia.org/wiki/EasyBCD#:~:text=EasyBCD%20can%20be%20used%20to,of%20the%20Windows%20boot%20menu.)

[Wikipedia](https://en.wikipedia.org/wiki/EasyBCD#:~:text=EasyBCD%20can%20be%20used%20to,of%20the%20Windows%20boot%20menu.)

[https://en.wikipedia.org › wiki › EasyBCD](https://en.wikipedia.org/wiki/EasyBCD#:~:text=EasyBCD%20can%20be%20used%20to,of%20the%20Windows%20boot%20menu.)

