Powersave
=========

These files enable powersaving on Linux. I have moved from different settings on AC or battery to just the battery settings; it makes more sense to me to always shave of a few Watts and always have my laptop run a little cooler and less noisy. 

It is fit for my own laptop, which means that this script will **not** work on every setup. Please **check** this before running it on your computer! Things might break otherwise and I am **not** responsible for any damage that has been done. One thing you should note is that I use systemd and therefore, some files might not work on your setup.

Installation
------------

The script will need the following dependencies to run:
* bash (could be dropped after I am done with moving everything to udev rules and other interfaces)
* hdparm
* iw
* xset
* udev
* ethtool

Just run `make install` as root to install the whole set. You might also want to edit `/etc/fstab` to add `commits=15` (or any higher value) to the `options` column of your partitions. 
Lastly, enable the `powersave.service` to reapply hdparm settings on resume.

Configuration
-------------

Things you should edit, should you use this on your setup:
* ASPM powersave; this option is safe! To be able to write to this file you have to use a kernel parameter at boot: `pcie_aspm=force`
* Disk powersave; I have only one HDD (laptop). If you have multiple HDD's and want to run powersave on all of them, you should modify `rules.d/50-powersave-hdparm.rules` and `systemd/powersave.service'.
Also, note that I use `-B254`. I hate the clicking noises my HDD would make otherwise, but this is not power-efficient. If you want maximum powersave, use `-B1`. **THIS CAN HURT YOUR HARDDRIVE, SO BE CAREFUL.**
* Screen powersave; this option is safe! The numbers of brightness differ per manufacturer. You should check yours. Do so by setting your screen on maximum brightness and then running `cat /sys/class/backlight/acpi_video*/brightness`
