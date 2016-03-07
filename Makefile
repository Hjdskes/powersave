install:
	install -Dm 0644 sysctl.d/*   $(DESTDIR)/usr/lib/sysctl.d/
	install -Dm 0644 tmpfiles.d/* $(DESTDIR)/usr/lib/tmpfiles.d/
	install -Dm 0644 modprobe.d/* $(DESTDIR)/usr/lib/modprobe.d/
	install -Dm 0644 rules.d/*    $(DESTDIR)/usr/lib/udev/rules.d/

uninstall:
	rm -f /usr/lib/sysctl.d/99-powersave.conf
	rm -f /usr/lib/tmpfiles.d/powersave.conf
	rm -f /usr/lib/modprobe.d/powersave.conf
	rm -f /usr/lib/modprobe.d/blacklist.conf
	rm -f /usr/lib/udev/rules.d/50-powersave-*.rules

