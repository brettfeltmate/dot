alias ls="eza --group-directories-first --icons --dereference"
alias la="ls --all --no-user --git"
alias ll="la --long --grid"
alias lt="ls --tree --level 1"

alias ..="cd '..' "
alias ...="cd '../..'"
alias - -="cd -"

alias nv="nvim"
alias v="nvim"
alias vn="nvim"
alias n="nvim"
alias fzv='nvim $(fzf --multi --preview "bat --color=always --style=numbers --line-range :500 {}")'
alias r="radian"
alias bp="bpython"

alias icat="kitten icat"
alias pic="icat --align=center --use-window-size 1,1,2250,2250"
alias gg="pic ./scratch.png"

alias fc="fancy-cat"

alias mux="tmux new-session -A -s default"

alias brosh="mosh --server=/opt/homebrew/bin/mosh-server"
alias moshmini="brosh CogMotors-Mac-mini.local"

alias av="source .venv/bin/activate"
alias dv="deactivate"

alias xv="xan view -p -R --theme rounded"
alias xvs="xan view -p -R --theme rounded scratch.csv"

alias editmoi="chezmoi edit"
alias addmoi="chezmoi add"
alias raddmoi="chezmoi re-add"
alias applymoi="chezmoi apply"
alias cdmoi="chezmoi cd"
alias delmoi="chezmoi destroy"

alias pt="papis-tui -c ~/.config/papis/papistui.yaml"

alias c="cb"
alias ce="cb edit"
alias cs="cb show"
alias ci="cb info"

alias scihubdown="~/Documents/cloned_repos/scihub-cli-downloader/download_from_scihub.sh"

alias bat="nvimpager -c"
alias mactop="sudo mactop"

alias nc="nyancat"
