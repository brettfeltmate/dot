#!/bin/bash

# Filename: ~/github/dotfiles-latest/sketchybar/felixkratz-linkarzu/plugins/brew.sh

source "$CONFIG_DIR/colors.sh"

COUNT="$(brew outdated | wc -l | tr -d ' ')"

COLOR=$RED

case "$COUNT" in
[3-5][0-9])
	COLOR=$ORANGE
	;;
[1-2][0-9])
	COLOR=$YELLOW
	;;
[1-9])
	COLOR=$WHITE
	;;
0)
	COLOR=$GREEN
	COUNT=􀆅
	;;
esac

sketchybar --set icon.color=$COLOR
