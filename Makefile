install:
	mkdir -p $(DESTDIR)/usr/bin/
	mkdir -p $(DESTDIR)/lib/udev/rules.d/
	mkdir -p $(DESTDIR)/etc/modprobe.d
	mkdir -p $(DESTDIR)/usr/lib/systemd/system/

	install -m 0755 powersave $(DESTDIR)/usr/bin/powersave
	install -m 0644 powersave@.service $(DESTDIR)/usr/lib/systemd/system/
	install -m 0644 blacklist.conf $(DESTDIR)/etc/modprobe.d/blacklist.conf
	install -m 0644 rules/50-powersave.rules $(DESTDIR)/lib/udev/rules.d/50-powersave.rules
	install -m 0644 rules/51-eth-down.rules $(DESTDIR)/lib/udev/rules.d/51-eth-down.rules
	install -m 0644 rules/52-disable-wol.rules $(DESTDIR)/lib/udev/rules.d/52-disable-wol.rules

uninstall:
	rm -f /usr/bin/powersave
	rm -r /lib/udev/rules.d/50-powersave.rules
	rm -r /lib/udev/rules.d/51-eth-down.rules
	rm -f /lib/udev/rules.d/52-disable-wol.rules
	rm -r /usr/lib/systemd/system/powersave@.service
	rm -f /etc/modprobe.d/blacklist.conf
