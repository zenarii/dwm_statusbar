#!/bin/sh

# A dwm_statusbar module to display bluetooth status
# Uses bluetoothctl/systemctl, non arch users may need to edit STATUS
# Abi Baxter <AbiABaxter@gmail.com>
# License: Unlicense

dwm_bluetooth () {
	# Note(abi): arch specific
	STATUS=$(systemctl status bluetooth | grep -c "inactive")

	if [[ $STATUS != 0 ]]; then
		printf "[BT: off]"
	else
		# Note(abi): At least one device connected
		CONNECTED=$(bluetoothctl devices Connected | grep -m 1 "Device")
		if [[ $CONNECTED =~ "[CHG]" ]] || [[ $CONNECTED =~ "RSSI" ]] || [ ! "$CONNECTED" ]; then
			printf "[BT: on]"
		else
			DEVICE_NAME=${CONNECTED:25}
			printf "[BT: "
			printf "%s" "${DEVICE_NAME}"
			printf "]"
		fi
	fi
}

dwm_bluetooth
