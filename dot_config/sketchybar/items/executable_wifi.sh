#!/bin/bash

# Filename: ~/github/dotfiles-latest/sketchybar/felixkratz-linkarzu/items/wifi.sh

source "$CONFIG_DIR/icons.sh"

wifi=(
	padding_right=8
	label.width=0
	icon="$WIFI_DISCONNECTED"
	script="$PLUGIN_DIR/wifi.sh"
    background.border_color=$BLUE
)

sketchybar --add item wifi right \
	--set wifi "${wifi[@]}" \
	--subscribe wifi wifi_change mouse.clicked
