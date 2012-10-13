#!/bin/sh

case $1 in
    pre) /usr/bin/powersave false ;;
    post)
	if cat /sys/class/power_supply/ADP1/online | grep 0 > /dev/null 2>&1
	then
    		/usr/bin/powersave true
	else
    		/usr/bin/powersave false
	fi
    ;;
esac
exit 0
