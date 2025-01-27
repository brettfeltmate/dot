media=(
    icon.background.drawing=on
    icon.background.image=media.artwork
    icon.background.image.scale=0.8
    icon.background.image.corner_radius=10
    icon.background.image.padding_right=0
    script="$PLUGIN_DIR/media.sh"
    label.font="$FONT:SemiBold:15.0"
    label.max_chars=20
    label.padding_left=10
    label.padding_right=15
    scroll_texts=on
    updates=on
    background.color=$BG1
    background.border_color=$BLUE
)

sketchybar --add item media center \
    --set media "${media[@]}" \
    --subscribe media media_change
