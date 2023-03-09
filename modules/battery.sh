#!/bin/sh

# A dwm-statusbar module that displays the battery level/status
# Abi Baxter <AbiABaxter@gmail.com>
# License: Unlicense

# Note(abi): if script fails, try changing to BAT1
BAT_DIR="BAT0"

dwm_battery () {
	CHARGE=$(cat /sys/class/power_supply/$BAT_DIR/capacity)
	STATUS=$(cat /sys/class/power_supply/$BAT_DIR/status)

	printf "["
	
	STATUSSYMBOL="-"
	if [ "$STATUS" = "Charging" ]; then
		STATUSSYMBOL="+"
	fi
	
	if [ "$STATUS" = "Full" ]; then
		STATUSSYMBOL="#"
	fi

	printf "BAT %s%% %s" "$CHARGE" "$STATUSSYMBOL" 
	printf "]"
}

dwm_battery
