#!/bin/bash

# Filename: ~/github/dotfiles-latest/sketchybar/felixkratz/items/volume.sh

volume_slider=(
	script="$PLUGIN_DIR/volume.sh"
	updates=on
	label.drawing=off
	icon.drawing=off
	slider.highlight_color=$RED
	slider.background.height=6
	slider.background.corner_radius=3
    slider.background.color=$ALTGRAY
	slider.knob=􀀁
	slider.knob.drawing=on
)

volume_icon=(
	click_script="$PLUGIN_DIR/volume_click.sh"
	padding_left=8
	icon=$VOLUME_100
	icon.width=0
	icon.align=left
	icon.font="$FONT:Regular:14.0"
	label.width=20
	label.align=left
	label.font="$FONT:Regular:14.0"
)

sketchybar	--add item volume_icon left \
	--set volume_icon "${volume_icon[@]}" \
    --add slider volume left \
	--set volume "${volume_slider[@]}" \
	--subscribe volume volume_change \
	mouse.clicked
