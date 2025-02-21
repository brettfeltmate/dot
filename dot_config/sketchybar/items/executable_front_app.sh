#!/bin/bash

#Filename: ~/github/dotfiles-latest/sketchybar/felixkratz/items/front_app.sh

front_app=(
	label.padding_left=4
	label.padding_right=12
	label.font="$FONT:SemiBold:16.0"
    label.color=$ALTGRAY
	background.color=$ALTBLUE
    background.border_color=$BLUE
    background.border_width=1
	icon.background.drawing=on
	display=active
	script="$PLUGIN_DIR/front_app.sh"
	click_script="open -a 'Mission Control'"
)

sketchybar --add item front_app left \
	--set front_app "${front_app[@]}" \
	--subscribe front_app front_app_switched
