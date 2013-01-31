install:
	install -D powersave $(DESTDIR)/usr/bin/powersave
	install -D 50-powersave.rules $(DESTDIR)/lib/udev/rules.d/50-powersave.rules
	install -D 51-eth-down.rules $(DESTDIR)/lib/udev/rules.d/51-eth-down.rules
	install -D powersave.sh $(DESTDIR)/usr/lib/systemd/system-sleep/powersave.sh
