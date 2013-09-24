#!/bin/sh

case $1/$2 in
  pre/*)
	/usr/bin/powersave false ;;
  post/*)
	if cat /sys/class/power_supply/BAT1/status | grep Discharging > /dev/null 2>&1
	then
		/usr/bin/powersave true
	else
		/usr/bin/powersave false
	fi
	;;
esac
