#!/bin/bash

battery=(
	script="$PLUGIN_DIR/battery.sh"
	update_freq=120
	updates=on
    padding_right=8
)

sketchybar --add item battery left \
	--set battery "${battery[@]}" \
	--subscribe battery power_source_change system_woke
