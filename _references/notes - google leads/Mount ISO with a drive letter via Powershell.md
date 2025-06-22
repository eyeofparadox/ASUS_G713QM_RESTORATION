## mount iso with a drive letter via powershell

---

I am trying to mount an ISO and I would like to associate a drive letter with that mount. I would like to specify the drive letter as say Y:\\ The below does not work, can anyone help me out. Thanks

\#Variable Declaration

$isoImg \= "P:\\Software\\Windows10CurrentVersion\\Windows10.iso"

\#Mount ISO and Gather Drive Letter

Mount-DiskImage \-ImagePath $isoImg \-PassThru | Out-Null

\#Obtain Drive Letter

$driveletter \= (Get-DiskImage $isoImg | Get-Volume).DriveLetter

You could mount the ISO and accept (for now) the automatically assigned drive letter. It is possible to change that afterwards, but you will need to run that as Administrator:

\# the full path to the ISO file

$isoPath \= "P:\\Software\\Windows10CurrentVersion\\Windows10.iso"

\# mount the ISO, but first check if it is already mounted

$isoDrive \= Get-DiskImage \-ImagePath $isoPath

if (\!$isoDrive) {

    $isoDrive \= Mount-DiskImage \-ImagePath $isoPath \-PassThru

}

\# $isoDrive is a Microsoft.Management.Infrastructure.CimInstance\#ROOT/Microsoft/Windows/Storage/MSFT\_DiskImage

\# get the DriveLetter currently assigned to the drive (a single \[char\])

$isoLetter \= ($isoDrive | Get-Volume).DriveLetter

Rename the driveletter for this drive.

This part needs to be run as Administrator

\# find the volume by its automatically assigned driveletter and set the new drive letter

$drive \= Get-WmiObject Win32\_Volume \-Filter ('DriveLetter \= "{0}:"' \-f $isoLetter)

$drive.DriveLetter \= 'Y:'

$null \= $drive.Put()

To dismount the iso drive:

$isoDrive | Dismount-DiskImage | Out-Null

Hope that helps

You can mount the ISO image and then assign the drive letter like this:

\# ISO image \- replace with path to ISO to be mounted

$isoImg \= "P:\\Software\\Windows10CurrentVersion\\Windows10.iso"

\# Drive letter \- use the required drive letter instead of Y:

$driveLetter \= "Y:"

\# Mount the ISO, without having a drive letter auto-assigned

$diskImg \= Mount-DiskImage \-ImagePath $isoImg \-NoDriveLetter

\# Get mounted ISO volume

$volInfo \= $diskImg | Get-Disk | Get-Partition | Get-Volume

\# Mount volume with specified drive letter (requires Administrator access)

mountvol $driveLetter $volInfo.UniqueId

