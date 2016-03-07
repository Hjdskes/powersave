PREFIX ?= /usr/local
LIBPREFIX = ${PREFIX}/lib

install:
	install -d ${DESTDIR}${LIBPREFIX}/sysctl.d ${DESTDIR}${LIBPREFIX}/tmpfiles.d \
		${DESTDIR}${LIBPREFIX}/modprobe.d ${DESTDIR}${LIBPREFIX}/udev/rules.d
	install -Dm 0644 sysctl.d/*   ${DESTDIR}${LIBPREFIX}/sysctl.d/
	install -Dm 0644 tmpfiles.d/* ${DESTDIR}${LIBPREFIX}/tmpfiles.d/
	install -Dm 0644 modprobe.d/* ${DESTDIR}${LIBPREFIX}/modprobe.d/
	install -Dm 0644 rules.d/*    ${DESTDIR}${LIBPREFIX}/udev/rules.d/

uninstall:
	rm -f ${LIBPREFIX}/sysctl.d/99-powersave.conf
	rm -f ${LIBPREFIX}/tmpfiles.d/powersave.conf
	rm -f ${LIBPREFIX}/modprobe.d/powersave.conf
	rm -f ${LIBPREFIX}/modprobe.d/blacklist.conf
	rm -f ${LIBPREFIX}/udev/rules.d/50-powersave-*.rules

.PHONY: install uninstall
