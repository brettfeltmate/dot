alias ls="eza --group-directories-first --icons --dereference"
alias la="ls --all --no-user --git"
alias ll="la --long --grid"
alias lt="ls --tree --level 1"

alias ..="cd '..' "
alias ...="cd '../..'"

alias nv="nvim"
alias v="nvim"
alias vn="nvim"
alias n="nvim"

alias r="radian"
alias gg="icat --use-window-size 1,1,1500,1500 ./scratch.png"

alias bp="bpython"

alias icat="kitten icat"

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
