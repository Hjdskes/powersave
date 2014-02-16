install:
	install -Dm 0644 sysctl.d/powersave.conf $(DESTDIR)/etc/systctl.d/powersave.conf
	install -Dm 0644 modprobe.d/powersave.conf $(DESTDIR)/etc/modprobe.d/powersave.conf
	install -Dm 0644 modprobe.d/blacklist.conf $(DESTDIR)/etc/modprobe.d/blacklist.conf
	install -Dm 0644 rules./* $(DESTDIR)/lib/udev/rules.d/

uninstall:
	rm -r /etc/sysctl.d/powersave.conf
	rm -r /etc/modprobe.d/powersave.conf
	rm -f /etc/modprobe.d/blacklist.conf
	rm -f /lib/udev/rules.d/50-powersave-brightness.rules
	rm -r /lib/udev/rules.d/50-powersave-hdparm.rules
	rm -r /lib/udev/rules.d/50-powersave-net.rules
	rm -r /lib/udev/rules.d/50-powersave-pci.rules
	rm -f /lib/udev/rules.d/50-powersave-suspend.rules
	rm -r /lib/udev/rules.d/50-powersave-usb.rules
