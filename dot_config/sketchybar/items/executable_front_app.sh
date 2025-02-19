#!/bin/bash

#Filename: ~/github/dotfiles-latest/sketchybar/felixkratz/items/front_app.sh

front_app=(
	label.padding_left=0
	label.padding_right=12
	label.font="$FONT:Bold:16.0"
    label.color=$WHITE
	background.color=$ALTBLACK
    background.border_color=$ALTWHITE
    background.border_width=1
	icon.background.drawing=on
	display=active
	script="$PLUGIN_DIR/front_app.sh"
	click_script="open -a 'Mission Control'"
)

sketchybar --add item front_app left \
	--set front_app "${front_app[@]}" \
	--subscribe front_app front_app_switched
