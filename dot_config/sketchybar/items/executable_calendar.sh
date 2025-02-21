#!/bin/bash

#Filename: ~/github/dotfiles-latest/sketchybar/felixkratz/items/calendar.sh

calendar=(
	label.width=60
	label.align=right
    label.font="$FONT:ExtraBold:16.0"
    icon.font="$FONT:ExtraBold:16.0"
	padding_left=40
	update_freq=30
	script="$PLUGIN_DIR/calendar.sh"
)

sketchybar --add item calendar right \
	--set calendar "${calendar[@]}" \
	--subscribe calendar system_woke
