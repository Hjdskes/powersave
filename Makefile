install:
	install -D powersave $(DESTDIR)/usr/bin/powersave
	install -D 50-powersave.rules $(DESTDIR)/etc/udev/rules.d/50-powersave.rules
	install -D 50-backlight-powersave.rules $(DESTDIR)/etc/udev/rules.d/50-backlight-powersave.rules
	install -D 50-network-powersave.rules $(DESTDIR)/etc/udev/rules.d/50-network-powersave.rules
	install -D 50-sata-powersave.rules $(DESTDIR)/etc/udev/rules.d/50-sata-powersave.rules
	install -D 50-usb-powersave.rules $(DESTDIR)/etc/udev/rules.d/50-usb-powersave.rules
	install -D powersave.sh $(DESTDIR)/usr/lib/systemd/system-sleep/powersave.sh
