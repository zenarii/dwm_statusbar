#!/bin/sh

# A module for dwm_statusbar
# Requires alsa
# Abi Baxter <AbiABaxter@gmail.com>
# License: Unlicense


dwm_sound() {
	STATUS=$(amixer sget Master | grep -m 1 -o -E [0-9][0-9]?%)
	TMP=${STATUS#*[}
	B=${TMP#*]}
	printf "[SOUND: %s]" "$B"
}

dwm_sound
