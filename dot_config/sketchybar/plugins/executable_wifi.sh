#!/bin/bash

# Filename: ~/github/dotfiles-latest/sketchybar/felixkratz-linkarzu/plugins/wifi.sh

update() {
	source "$CONFIG_DIR/icons.sh"
	IP="$(ipconfig getifaddr en0)"

	ICON="$([ -n "$IP" ] && echo "$WIFI_CONNECTED" || echo "$WIFI_DISCONNECTED")"

	sketchybar --set $NAME icon="$ICON"
}

click() {
	CURRENT_WIDTH="$(sketchybar --query $NAME | jq -r .label.width)"

	WIDTH=0
	if [ "$CURRENT_WIDTH" -eq "0" ]; then
		WIDTH=dynamic
	fi

	sketchybar --animate sin 20 --set $NAME
}

case "$SENDER" in
"wifi_change")
	update
	;;
"mouse.clicked")
	click
	;;
esac
