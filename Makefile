PREFIX ?= /usr/local
LIBPREFIX = ${PREFIX}/lib

DPY ?= ${DISPLAY}
USR ?= $(shell whoami)

replace-vars:
ifndef DPY
	$(error can not find DPYLAY)
endif
ifndef USR
	$(error can not find the current user)
endif
	sed -e 's/DPY/${DPY}/g' -e 's/USER/${USR}/g' rules.d/50-powersave-brightness.rules.in > rules.d/50-powersave-brightness.rules

clean: replace-vars
	rm -f rules.d/50-powersave-brightness.rules

install: replace-vars
	install -d ${DESTDIR}${LIBPREFIX}/sysctl.d ${DESTDIR}${LIBPREFIX}/tmpfiles.d \
		${DESTDIR}${LIBPREFIX}/modprobe.d ${DESTDIR}${LIBPREFIX}/udev/rules.d
	install -Dm 0644 sysctl.d/*      ${DESTDIR}${LIBPREFIX}/sysctl.d/
	install -Dm 0644 tmpfiles.d/*    ${DESTDIR}${LIBPREFIX}/tmpfiles.d/
	install -Dm 0644 modprobe.d/*    ${DESTDIR}${LIBPREFIX}/modprobe.d/
	install -Dm 0644 rules.d/*.rules ${DESTDIR}${LIBPREFIX}/udev/rules.d/

uninstall:
	rm -f ${LIBPREFIX}/sysctl.d/99-powersave.conf
	rm -f ${LIBPREFIX}/tmpfiles.d/powersave.conf
	rm -f ${LIBPREFIX}/modprobe.d/powersave.conf
	rm -f ${LIBPREFIX}/modprobe.d/blacklist.conf
	rm -f ${LIBPREFIX}/udev/rules.d/50-powersave-*.rules

.PHONY: replace-vars clean install uninstall

