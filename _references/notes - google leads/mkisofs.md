## **explain mkisofs** 

---

mkisofs is **a Linux utility used to create ISO 9660 file systems**, allowing you to create CD and DVD images from files on your system. It can also handle extensions like Joliet and Rock Ridge, enabling features like longer filenames and symbolic links. \[[1](https://dzone.com/articles/creating-customized-disk-images-with-mkisofs), [2](https://labex.io/tutorials/linux-linux-mkisofs-command-with-practical-examples-422812#:~:text=The%20mkisofs%20command%20is%20used%20to%20create,mkisofs%20command%20to%20create%20an%20ISO%20image.)\]

Here's a more detailed explanation:

**What it does:**

* **Creates ISO images:** mkisofs takes a directory tree and generates a binary image that can be burned to CD or DVD. \[[1](https://dzone.com/articles/creating-customized-disk-images-with-mkisofs), [2](https://labex.io/tutorials/linux-linux-mkisofs-command-with-practical-examples-422812#:~:text=The%20mkisofs%20command%20is%20used%20to%20create,mkisofs%20command%20to%20create%20an%20ISO%20image.)\]  
* **Supports extensions:** It can create ISO images with extensions like Joliet and Rock Ridge, which provide features not available in standard ISO 9660\. \[[1](https://dzone.com/articles/creating-customized-disk-images-with-mkisofs), [3](https://kempniu.wordpress.com/2009/10/20/mkisofs-and-filenames-longer-than-64-characters/#:~:text=mkisofs%20and%20filenames%20longer%20than%2064%20characters.,maximum%20depth%20of%20directory%20tree%20is%208.)\]  
* **Sets metadata:** You can use mkisofs to set metadata for the ISO image, such as volume names, publisher information, and bootable attributes. \[[1](https://dzone.com/articles/creating-customized-disk-images-with-mkisofs), [4](https://dzone.com/articles/creating-customized-disk-images-with-mkisofs#:~:text=To%20enable%20Joliet%20extensions%2C%20you%20can%20use,names%2C%20publisher%20information%2C%20and%20even%20bootable%20attributes.), [4](https://dzone.com/articles/creating-customized-disk-images-with-mkisofs#:~:text=To%20enable%20Joliet%20extensions%2C%20you%20can%20use,names%2C%20publisher%20information%2C%20and%20even%20bootable%20attributes.)\]

**Common use cases:**

* **Creating bootable ISOs:** You can use mkisofs to create bootable ISO images for installing operating systems or creating bootable recovery media. \[[1](https://dzone.com/articles/creating-customized-disk-images-with-mkisofs), [5](http://wiki.osdev.org/Mkisofs), [6](https://github.com/openshift-kni/install-scripts/issues/38#:~:text=I%20hit%20this%20issue%20but%20just%20added,to%20my%20base%20install%20of%20my%20OS.)\]  
* **Archiving data:** It can be used to create a backup of a directory tree on a CD or DVD. \[[1](https://dzone.com/articles/creating-customized-disk-images-with-mkisofs), [2](https://labex.io/tutorials/linux-linux-mkisofs-command-with-practical-examples-422812#:~:text=The%20mkisofs%20command%20is%20used%20to%20create,mkisofs%20command%20to%20create%20an%20ISO%20image.)\]  
* **Creating distribution media:** mkisofs is often used to create ISO images for distributing software or other files. \[[1](https://dzone.com/articles/creating-customized-disk-images-with-mkisofs), [2](https://labex.io/tutorials/linux-linux-mkisofs-command-with-practical-examples-422812#:~:text=The%20mkisofs%20command%20is%20used%20to%20create,mkisofs%20command%20to%20create%20an%20ISO%20image.), [7](https://github.com/pruiz/openbsd-src/blob/master/gnu/usr.sbin/mkhybrid/src/mkisofs.c)\]

Example:

| `mkisofs -o my_iso.iso -R -J -V "My ISO" ./my_directory` |
| :---- |

**This command will:**

* \-o my\_iso.iso: Specify the output ISO file name.  
* \-R: Enable Rock Ridge extensions.  
* \-J: Enable Joliet extensions.  
* \-V "My ISO": Set the volume name.  
* ./my\_directory: Specify the directory to be included in the ISO image. \[[1](https://dzone.com/articles/creating-customized-disk-images-with-mkisofs), [4](https://dzone.com/articles/creating-customized-disk-images-with-mkisofs#:~:text=To%20enable%20Joliet%20extensions%2C%20you%20can%20use,names%2C%20publisher%20information%2C%20and%20even%20bootable%20attributes.), [8](https://sourceforge.net/projects/mkisofs-md5/), [9](https://fy.chalmers.se/~appro/linux/DVD+RW/), [10](https://www.system-rescue.org/System-tools/#:~:text=CD/DVD%20utilities%20growisofs%20%2C%20cdrecord%20and%20mkisofs,udftools%20are%20available%20to%20manipulate%20UDF%20filesystems.)\]

**Important notes:**

* mkisofs is often used in conjunction with tools like cdrecord or growisofs to burn the ISO image to a physical disc. \[[1](https://dzone.com/articles/creating-customized-disk-images-with-mkisofs), [8](https://sourceforge.net/projects/mkisofs-md5/), [9](https://fy.chalmers.se/~appro/linux/DVD+RW/), [10](https://www.system-rescue.org/System-tools/#:~:text=CD/DVD%20utilities%20growisofs%20%2C%20cdrecord%20and%20mkisofs,udftools%20are%20available%20to%20manipulate%20UDF%20filesystems.)\]  
* On some Linux distributions, mkisofs is a symbolic link to genisoimage, which is a similar tool. \[[11](https://stackoverflow.com/questions/67524729/using-genisoimage-or-mkisofs-on-windows-10), [12](https://github.com/genodelabs/genode/issues/627#:~:text=mkisofs%20is%20the%20original%20ISO%20creation%20tool,used%20it\)%20is%20completely%20invocation%2Dcompatible%20to%20mkisofs.)\]  
* mkisofs is a powerful tool, and it can be used to create a wide variety of ISO images. \[[1](https://dzone.com/articles/creating-customized-disk-images-with-mkisofs), [2](https://labex.io/tutorials/linux-linux-mkisofs-command-with-practical-examples-422812#:~:text=The%20mkisofs%20command%20is%20used%20to%20create,mkisofs%20command%20to%20create%20an%20ISO%20image.), [13](https://www.youtube.com/watch?v=pLAwI4p7WBI#:~:text=video%20by%20http://www.networknuts.net%2C%20shows%20how%20to%20create,mkisofs%20command.%20Linux%20Command%20Tutorials%20:%20http://www.networknuts.net/linux%2Dblog/)\]

This video demonstrates how to create an ISO file in Linux using mkisofs: [https://www.youtube.com/watch?v=es\_fci7V-5Q](https://www.youtube.com/watch?v=es_fci7V-5Q)

*AI responses may include mistakes.*

\[1\] [https://dzone.com/articles/creating-customized-disk-images-with-mkisofs](https://dzone.com/articles/creating-customized-disk-images-with-mkisofs)  
\[2\] [https://labex.io/tutorials/linux-linux-mkisofs-command-with-practical-examples-422812](https://labex.io/tutorials/linux-linux-mkisofs-command-with-practical-examples-422812#:~:text=The%20mkisofs%20command%20is%20used%20to%20create,mkisofs%20command%20to%20create%20an%20ISO%20image.)  
\[3\] [https://kempniu.wordpress.com/2009/10/20/mkisofs-and-filenames-longer-than-64-characters/](https://kempniu.wordpress.com/2009/10/20/mkisofs-and-filenames-longer-than-64-characters/#:~:text=mkisofs%20and%20filenames%20longer%20than%2064%20characters.,maximum%20depth%20of%20directory%20tree%20is%208.)  
\[4\] [https://dzone.com/articles/creating-customized-disk-images-with-mkisofs](https://dzone.com/articles/creating-customized-disk-images-with-mkisofs#:~:text=To%20enable%20Joliet%20extensions%2C%20you%20can%20use,names%2C%20publisher%20information%2C%20and%20even%20bootable%20attributes.)  
\[5\] [http://wiki.osdev.org/Mkisofs](http://wiki.osdev.org/Mkisofs)  
\[6\] [https://github.com/openshift-kni/install-scripts/issues/38](https://github.com/openshift-kni/install-scripts/issues/38#:~:text=I%20hit%20this%20issue%20but%20just%20added,to%20my%20base%20install%20of%20my%20OS.)  
\[7\] [https://github.com/pruiz/openbsd-src/blob/master/gnu/usr.sbin/mkhybrid/src/mkisofs.c](https://github.com/pruiz/openbsd-src/blob/master/gnu/usr.sbin/mkhybrid/src/mkisofs.c)  
\[8\] [https://sourceforge.net/projects/mkisofs-md5/](https://sourceforge.net/projects/mkisofs-md5/)  
\[9\] [https://fy.chalmers.se/\~appro/linux/DVD+RW/](https://fy.chalmers.se/~appro/linux/DVD+RW/)  
\[10\] [https://www.system-rescue.org/System-tools/](https://www.system-rescue.org/System-tools/#:~:text=CD/DVD%20utilities%20growisofs%20%2C%20cdrecord%20and%20mkisofs,udftools%20are%20available%20to%20manipulate%20UDF%20filesystems.)  
\[11\] [https://stackoverflow.com/questions/67524729/using-genisoimage-or-mkisofs-on-windows-10](https://stackoverflow.com/questions/67524729/using-genisoimage-or-mkisofs-on-windows-10)  
\[12\] [https://github.com/genodelabs/genode/issues/627](https://github.com/genodelabs/genode/issues/627#:~:text=mkisofs%20is%20the%20original%20ISO%20creation%20tool,used%20it\)%20is%20completely%20invocation%2Dcompatible%20to%20mkisofs.)  
\[13\] [https://www.youtube.com/watch?v=pLAwI4p7WBI](https://www.youtube.com/watch?v=pLAwI4p7WBI#:~:text=video%20by%20http://www.networknuts.net%2C%20shows%20how%20to%20create,mkisofs%20command.%20Linux%20Command%20Tutorials%20:%20http://www.networknuts.net/linux%2Dblog/)