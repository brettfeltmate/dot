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

dir_in_path() {
    local target_dir="$1"
    local found = 1

    IFS=':' read -ra dirs <<< "$PATH"
    for dir in "${dirs[@]}"; do
        if [[ "$dir" == "$target_dir" ]]; then
            found=0
            break
        fi
    done
    return $found
}

on_path() {
    local target_dir="$1"
    if dir_in_path "$target_dir"; then
        echo "$target_dir is in PATH"
    else
        echo "$target_dir not in PATH"
    fi
}

xlsx_to_csv() {
    fd '.xlsx' | xargs -I {} bash -c 'in={}; base=$(basename "$in" .xlsx); ssconvert -S --export-type=Gnumeric_stf:stf_csv "$in" "${base}_%s.csv"'
}

batch_xlsx_to_csv() {
    fd '.xlsx' | while read -r file; do
        base=$(basename "$file" .xlsx)
        ssconvert -S --export-type=Gnumeric_stf:stf_csv "$file" "$base" "_" "%s.csv"
    done
}
