Powersave
=========

These files enable power saving on Linux. Note that these settings are applied regardless of whether
the system is on battery or AC. Power saving is applied to:

* Audio card (`modprobe.d/99-powersave.conf`)
* Backlight brightness (`rules.d/50-powersave-brightness.rules`)
* Bluetooth (disabled completely: `modprobe.d/blacklist.conf`)
* NMI watchdog (`sysctl.d/99-powersave.conf`)
* Writeback times (`sysctl.d/99-powersave.conf`)
* Laptop mode (`sysctl.d/99-powersave.conf`)
* Network interfaces, both wired and wireless (`modprobe.d/50-powersave-net.rules`)
* Buses (ASPM, PCI, USB, SATA ALPM, `tmpfiles.d/powersave.conf` and `modprobe.d/50-powersave-[pci|usb|sata].rules`)

Power saving is *not* applied to:
* HDD, since it is replaced with an SSD. SSD power usage is simply ignored, since I have yet to look
into this (and I believe it isn't that high). Tips are welcome!
* CPU frequencies, since the default is fine (using the `intel_pstate` driver).
* Swappiness, since I don't use a swap partition.

You might also want to edit `/etc/fstab` to add `commits=<seconds>` to the `options` column of your
partitions. See the [mount man page][man-mount].

It is fit for my own laptop (Lenovo Thinkpad Edge E130), which means that this script will **not**
work on every setup. Please **check** this before running it on your computer! Things might break
otherwise and I am **not** responsible for any damage that has been done.

TODO
----

* `git grep TODO`
* Test the suspend-on-low-battery udev rule (`rules.d/50-powersave-suspend.rules`)
* SSD powersaving?
  * Apply noop schedular in powersave instead of boot config?

Installation
------------

The script will need the following dependencies to run:
* iw
* ip
* ethtool
* udev
* systemd

Just run `make install` as root to install the whole set.

To enable the ASPM setting to work, append `pcie_aspm=force` to your kernel parameter list. However,
before doing so, verify that all PCIe hardware on your system support ASPM!

  [man-mount]: http://man7.org/linux/man-pages/man8/mount.8.html#FILESYSTEM-INDEPENDENT_MOUNT%20OPTIONS

