install:
	install -D powersave $(DESTDIR)/usr/bin/powersave
	install -D 50-powersave_true.rules $(DESTDIR)/etc/udev/rules.d/50-powersave_true.rules
	install -D 51-powersave_false.rules $(DESTDIR)/etc/udev/rules.d/51-powersave_false.rules
