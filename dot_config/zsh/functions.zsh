#!/usr/bin/env zsh
cfg_exists() {
    local target_dir="$1"
    local found=1
    if [[ -d "$HOME/.config/$target_dir" ]]; then
        found=0
    fi
    return $found
}

xlsx2csv() {
    base=$(basename "$1" .xlsx)
    ssconvert -S --export-type=Gnumeric_stf:stf_csv "$1" "${base}_%s.csv"
}

batch_xlsx2csv() {
    fd --extension xlsx | while read -r file; do
        xlsx2csv "$file"
    done
}

cfg() {
    local target_dir="$1"
    if cfg_exists "$target_dir"; then
        cd "$HOME/.config/$target_dir"
    else
        echo "$target_dir not found in $HOME/.config/"
    fi
}

fabular() {
    local file="$1"
    local delim="$2"
    local lineskip="$3"

    if [[ -z "$lineskip" ]]; then
        lineskip=0
    fi

    if [[ -z "$delim" ]]; then
        delim=","
    fi

    if [[ -z "$file" ]]; then
        echo "Usage: fabular <file> [delimiter] [lineskip]"
        return
    fi

    if [[ "$delim" == "0" ]]; then
        bat "$file" | rainbowcsv -d "$delim" -t | bat -S

    else
        bat "$file" | rainbowcsv -d "$delim" -t | csvlook -d "$delim" -K "$lineskip" | bat -S
    fi

}

function cd() {
    local function lscd() {
        eza --group-directories-first --icons --tree --level 1
    }
    if [[ "$1" ]]; then
        z "$1"; lscd
    else
        z "$HOME"; lscd
    fi
}

# shorthand to edit or create nvim plugin from cli
function nvp() {
    local target_plugin="$1"
    local target_file="$HOME/.config/nvim/lua/plugins/$target_plugin.lua"

    if [[ -f "$target_file" ]]; then
        echo "Edit $target_plugin"
        echo "Remember to applymoi"
        sleep 1
        nvim "$target_file"
    else
        echo "Make $target_plugin"
        echo "Remember to addmoi"
        sleep 1
        nvim "$target_file"
    fi
}
