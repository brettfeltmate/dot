cfg_exists() {
    local target_dir="$1"
    local found=1
    if [[ -d "$HOME/.config/$target_dir" ]]; then
        found=0
    fi
    return $found
}

cfg() {
    local target_dir="$1"
    if cfg_exists "$target_dir"; then
        cd "$HOME/.config/$target_dir"
    else
        echo "$target_dir not found in $HOME/.config/"
    fi
}

batch_xlsx_to_csv() {
    fd '.xlsx' | while read -r file; do
        base=$(basename "$file" .xlsx)
        ssconvert -S --export-type=Gnumeric_stf:stf_csv "$file" "$base" "_" "%s.csv"
    done
}

toggle_sbar() {
    if sketchybar --query bar | grep -q '"hidden": "on"'; then
        sketchybar --bar hidden=off;
    else
        sketchybar --bar hidden=on;
    fi
}

# function sesh-sessions() {
#   {
#     exec </dev/tty
#     exec <&1
#     local session
#     session=$(sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
#     [[ -z "$session" ]] && return
#     sesh connect $session
#   }
# }
#
