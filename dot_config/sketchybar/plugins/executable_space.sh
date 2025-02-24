#!/bin/bash

update() {
    source "$CONFIG_DIR/colors.sh"
    sketchybar --set "$NAME" background.border_color="$RED" background.border_width="1"
}

set_space_label() {
    source "$CONFIG_DIR/colors.sh"
    source "$CONFIG_DIR/icon_map.sh"
    source "$CONFIG_DIR/icons.sh"
    sketchybar --set "$NAME" icon="$@" font.color="$RED"
}

mouse_clicked() {
    if [ "$BUTTON" = "right" ]; then
        # yabai -m space --destroy $SID
        echo ''
    else
        if [ "$MODIFIER" = "shift" ]; then
            SPACE_LABEL="$(osascript -e "return (text returned of (display dialog \"Give a name to space $NAME:\" default answer \"\" with icon note buttons {\"Cancel\", \"Continue\"} default button \"Continue\"))")"
            if [ $? -eq 0 ]; then
                if [ "$SPACE_LABEL" = "" ]; then
                    set_space_label "${NAME:6}"
                else
                    set_space_label "${NAME:6} ($SPACE_LABEL)"
                fi
            fi
        else
            # yabai -m space --focus $SID 2>/dev/null
            aerospace workspace "${NAME#*.}"
        fi
    fi
}

case "$SENDER" in
"mouse.clicked")
    mouse_clicked
    ;;
*)
    update
    ;;
esac
