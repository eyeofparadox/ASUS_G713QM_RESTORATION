# ASUS_G713QM_RESTORATION
In the wake of a **Windows Update** wiping out the entire HD of my **ASUS ROG G713QM**, an exhaustive project to restore it began. I needed a space to manage all of that work, and I think much of it could be of use to others. I have to confess, anything of real substance came from someone, somewhere else. If there is merit to what I assemble here, it's because I am standing on the shoulders of giants. I do have a particular fusion of creative and technical ability, but I would be nowhere without Google and AI support to tap into the knowledge to be found online.

I started in pursuit of the right media, the tools to make better use of it, some expert guidance through the scripting trials that followed, and the transformation of my efforts into a greater project that I am pinning down here. As the rabbit-hole gets deeper, more content will be added to this repo so that future visitors can see not just **what** was built, but *why* and *how* it took shape under pressure. 

---

## OEM Recovery – ASUS G713QM  
_A documentation-driven recovery rebuild, sparked by failure and sustained by adaptation._

---

### Genesis: From Breakdown to Breakthrough

In early March 2025, a botched Windows Update cascaded through the ASUS G713QM, compromising each partition during an effort to isolate the issue. Conventional recovery paths proved unworkable. With no factory image on hand and the system unbootable, the challenge escalated.

---

### Resurrection: The Backup Machine Awakens

The only viable lifeline? A long-retired ASUS X750JB. Reviving it wasn't a detour—it became the staging ground for what followed. From that legacy platform, recovery began in earnest: building, testing, iterating. The goal was no longer to *restore* the G713QM to stock—it was to *evolve* it beyond what the OEM provided.

---

### Evolution of the Mission

What started as a search for the right recovery media evolved step by step:

1. **Media Discovery**  
   Locating and verifying the G513Q OEM ISO as a compatible recovery base

2. **Toolchain Construction**  
   Installing Windows ADK, experimenting with DISM, exploring DiskGenius, and adopting DISMTools for precision control

3. **Scripting Trials**  
   Automating post-install driver deployment, customizing WinPE, and prototyping installer launchers

4. **Vision Expansion**  
   Creating a modular, versioned recovery project that included archival utilities, system image management, and scriptable resets—becoming a framework that could support more than just the G713QM

---

### Project Goals

- Repurpose an OEM ISO into a smart, updatable recovery suite  
- Build WinPE-based deployment USBs with autorun logic  
- Automate EXE-based driver/application installation  
- Inject new drivers and updates before OOBE  
- Modularize all scripts, logs, and components for clarity and reusability  

---

### 🔗 This Branch Ultimately Crosses Paths With:

- [`PowerShell_Archive_Tools`](../PowerShell_Archive_Tools/README.md): Born as a reaction to incomplete drive migrations and metadata mismatch recovery  
- [`DISMTools_Recovery_Project`](../DISMTools_Recovery_Project/README.md): The UI gateway to assembling layered, testable builds  
- [`WIM_Image_Capture_X750JB`](../WIM_Image_Capture_X750JB/README.md): Reinforced the practice of building your own “factory reset” from known-good baselines  

---

As one might expect, there has been a chaos of research, experimentation and note-taking prior to now. It's turned into a ton of material that needs to be edited and organized. I have, as noted, followed many branches starting from my original problem. I can already see what will be worth preserving and sharing. As time permits, I will follow this `README` up with a `Structure` section outlining the files/scripts in this folder, or jump to the next branch documentation—`PowerShell_Archive_Tools`—and write up the story of that evolution from drive salvage to backup toolset.
