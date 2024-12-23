#!/bin/bash

# Filename: ~/github/dotfiles-latest/sketchybar/felixkratz-linkarzu/items/brew.sh

# Trigger the brew_udpate event when brew update or upgrade is run from cmdline
# e.g. via function in .zshrc

brew=(
	icon=􀐛
	label=?
	padding_right=12
	label.padding_left=4
	script="$PLUGIN_DIR/brew.sh"
    background.border_color=$BLUE
)

sketchybar --add event brew_update \
	--add item brew right \
	--set brew "${brew[@]}" \
	--subscribe brew brew_update
