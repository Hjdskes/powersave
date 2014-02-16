install:
	mkdir -p $(DESTDIR)/lib/udev/rules.d/

	install -Dm 0644 sysctl.d/99-powersave.conf $(DESTDIR)/etc/sysctl.d/99-powersave.conf
	install -Dm 0644 tmpfiles.d/powersave.conf $(DESTDIR)/etc/tmpfiles.d/powersave.conf
	install -Dm 0644 modprobe.d/powersave.conf $(DESTDIR)/etc/modprobe.d/powersave.conf
	install -Dm 0644 modprobe.d/blacklist.conf $(DESTDIR)/etc/modprobe.d/blacklist.conf
	install -Dm 0644 rules.d/* $(DESTDIR)/etc/udev/rules.d/

uninstall:
	rm -r /etc/sysctl.d/powersave.conf
	rm -r /etc/tmpfiles.d/powersave.conf
	rm -r /etc/modprobe.d/powersave.conf
	rm -f /etc/modprobe.d/blacklist.conf
	rm -f /etc/udev/rules.d/50-powersave-brightness.rules
	rm -r /etc/udev/rules.d/50-powersave-hdparm.rules
	rm -r /etc/udev/rules.d/50-powersave-net.rules
	rm -r /etc/udev/rules.d/50-powersave-pci.rules
	rm -f /etc/udev/rules.d/50-powersave-suspend.rules
	rm -r /etc/udev/rules.d/50-powersave-usb.rules
