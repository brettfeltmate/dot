#!/bin/sh

sketchybar --add event aerospace_workspace_change

for m in $(aerospace list-monitors | awk '{print $1}'); do
    for i in $(aerospace list-workspaces --monitor $m); do
        sid=$i
        space=(
            space="$sid"
            display=$m
            label.padding_right=10
            label.padding_left=10
            label.color=$RED
            label.font="sketchybar-app-font:Regular:20.0"
            label.y_offset=-3
            script="$PLUGIN_DIR/aerospace.sh"
        )

        sketchybar --add space space.$sid center \
            --set space.$sid --subscribe aerospace_workspace_change "${space[@]}"

        apps=$(aerospace list-windows --workspace $sid | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

        icon_strip=" "
        if [ "${apps}" != "" ]; then
            while read -r app
            do
                icon_strip+=" $($CONFIG_DIR/plugins/icon_map.sh "$app")"
            done <<< "${apps}"
        fi

        sketchybar --animate sin 10 --set space.$sid label="$icon_strip"
    done

    for i in $(aerospace list-workspaces --monitor $m --empty); do
        sketchybar --animate sin 10 --set space.$i display.$m
    done

done
