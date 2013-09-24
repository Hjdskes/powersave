Powersave
=========

This is a powersaving script for Linux. Initially, I've created it for my own laptop. That means that this script will **not** work on every setup so please **check** this before running it on your computer! Things might break otherwise and I will **not** be responsible for any damage that has been done.

Installation
------------

The script will need the following dependencies to run:
* bash
* hdparm
* iw
* xset
* udev
* ethtool

Just run `make install` as root to install the script and the udev rules.

Usage
-----

Once the script is installed, one can run `powersave true | false` and the powersaving will kick in. The udev rule will automatically run these commands depending on the battery state (Charging, discharging).

Configuration
-------------

Things you should edit, should you use this on your setup:
* NMI watchdog; I have this disabled at kernel level. If you don't, then uncomment the line in the powersave script. This option is safe to do! Should you want to disable this at kernel level too, use: `nmi_watchdog=0`
* ASPM powersave; this option is safe! To be able to write to this file you have to use a kernel parameter at boot: `pcie_aspm=force`
* Disk powersave; I have only one HDD (laptop). If you have multiple HDD's and want to run powersave on all of them, then use this:
  `for dev in $(awk '/^\/dev\/sd/ {print $1}' /etc/mtab); do hdparm -S 4 -B 254 -a 2048 $dev; done`  
Also, note that I use -B254. I hate the clicking noises my HDD would make otherwise, but this is not power-efficient. If you want maximum powersave, use -B1. **THIS CAN HURT YOUR HARDDRIVE, SO BE CAREFUL.**
* Screen powersave; this option is safe! The numbers of brightness differ per manufacturer. You should check yours. Do so by setting your screen on maximum brightness and then running `cat/sys/class/backlight/acpi_video*/brightness`
Then, lookup the `false)` part in the script and change the value. Mine is set to 78.
* Battery line in the systemd sleep hook, your setup might have a different path.
