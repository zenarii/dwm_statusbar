#!/bin/sh

# dwm-statusbar main: runs each module and updates the dwm statusbar.
# Abi Baxter <abiabaxter@gmail.com>
# License: Unlicense

LOCATION=$(readlink -f "$0")
DIRECTORY=$(dirname "$LOCATION")

# Note(abi): import modules
# .$DIRECTORY/modules/<module_name>
. "$DIRECTORY/modules/battery.sh"
. "$DIRECTORY/modules/sound.sh"
. "$DIRECTORY/modules/bluetooth.sh"

while true
do
	bar_text=""
	bar_text="$bar_text$(dwm_bluetooth)"
	bar_text="$bar_text$(dwm_sound)"
	bar_text="$bar_text$(dwm_battery)"

	xsetroot -name "$bar_text"
	sleep 1
done
