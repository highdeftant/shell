#!/bin/bash

# VPN Switcher
# Switches Wash-DC/UK-London

LONDON=$(piactl set region uk-london)
WASHDC=$(piactl set region us-washington-dc)

function VPNMEXICO() {
	piactl set region mexico
	echo "Changing Connection to 'UK-London'..."
}

function VPNDC() {
	piactl set region us-washington-dc
	echo "Changing Connection to 'Wash-DC'..."
}

read -p "Which Region? [mexico/wash]: " ANSWER

if [[ "$ANSWER" == "mexico" ]]; then
	VPNMEXICO
	piactl get connectionstate
fi

if [[ "$ANSWER" == "wash" ]]
then
	VPNDC
	piactl get connectionstate
fi

exit
