#!/bin/bash

#Filename: ~/github/dotfiles-latest/sketchybar/felixkratz/items/front_app.sh

front_app=(
	label.padding_left=0
	label.padding_right=12
	label.font="$FONT:Bold:16.0"
	background.color=$BACKGROUND_1
    background.border_color="0x99aec7b2"
    background.border_width=2
	icon.background.drawing=on
	display=active
	script="$PLUGIN_DIR/front_app.sh"
	click_script="open -a 'Mission Control'"
)

sketchybar --add item front_app left \
	--set front_app "${front_app[@]}" \
	--subscribe front_app front_app_switched
