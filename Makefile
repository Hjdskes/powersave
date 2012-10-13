install:
	install -D powersave $(DESTDIR)/usr/bin/powersave
	install -D 50-powersave.rules $(DESTDIR)/etc/udev/rules.d/50-powersave.rules
	install -D powersave.sh $(DESTDIR)/usr/lib/systemd/system-sleep/powersave.sh
