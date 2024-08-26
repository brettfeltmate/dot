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
        echo "Usage: fabular <file> [delimiter]"
        return
    fi

    bat "$file" | rainbowcsv -d "$delim" -t | csvlook -d "$delim" -K "$lineskip" | bat -S
}

function logg() {
    git lg | fzf --ansi --no-sort \
        --preview 'echo {} | grep -o "[a-f0-9]\{7\}" | head -1 | xargs -I % git show % --color=always' \
        --preview-window=right:50%:wrap --height 100% \
        --bind 'enter:execute(echo {} | grep -o "[a-f0-9]\{7\}" | head -1 | xargs -I % sh -c "git show % | nvim -c \"setlocal buftype=nofile bufhidden=wipe noswapfile nowrap\" -c \"nnoremap <buffer> q :q!<CR>\" -")' \
        --bind 'ctrl-e:execute(echo {} | grep -o "[a-f0-9]\{7\}" | head -1 | xargs -I % sh -c "gh browse %")'
}

function create_tmux_session() {
    local RESULT="$1"
    zoxide add "$RESULT" &>/dev/null
    local FOLDER=$(basename "$RESULT")
    local SESSION_NAME=$(echo "$FOLDER" | tr ' .:' '_')

    if [ -d "$RESULT/.git" ]; then
        SESSION_NAME+="_$(git -C "$RESULT" symbolic-ref --short HEAD 2>/dev/null)"
    fi

    if ! tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
        tmux new-session -d -s "$SESSION_NAME" -c "$RESULT"
    fi

    if [ -z "$TMUX" ]; then
        tmux attach -t "$SESSION_NAME"
    else
        tmux switch-client -t "$SESSION_NAME"
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
