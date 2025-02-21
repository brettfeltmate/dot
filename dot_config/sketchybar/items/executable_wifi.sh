#!/bin/bash

# Filename: ~/github/dotfiles-latest/sketchybar/felixkratz-linkarzu/items/wifi.sh

source "$CONFIG_DIR/icons.sh"

wifi=(
	label.width=0
	icon="$WIFI_DISCONNECTED"
	script="$PLUGIN_DIR/wifi.sh"
)

sketchybar --add item wifi left \
	--set wifi "${wifi[@]}" \
	--subscribe wifi wifi_change mouse.clicked
