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
alias td='nv ~/Documents/Personal/Notes/todo.md'
alias r="radian"

alias icat="kitten icat"
alias pic="icat --align=center --use-window-size 1,1,2250,2250"
alias gg="pic ./scratch.png"

alias fc="fancy-cat"

alias dev="pyenv activate dev"

alias xv="xan view -p -R --theme rounded"
alias xvs="xan view -p -R --theme rounded scratch.csv"

alias editmoi="chezmoi edit"
alias addmoi="chezmoi add"
alias raddmoi="chezmoi re-add"
alias applymoi="chezmoi apply"
alias cdmoi="chezmoi cd"
alias moi="chezmoi cd"
alias delmoi="chezmoi destroy"

alias pt="papis-tui -c ~/.config/papis/papistui.yaml"

alias scihubdown="~/Documents/cloned_repos/scihub-cli-downloader/download_from_scihub.sh"

alias bat="nvimpager -c"
alias mactop="sudo mactop"
alias wthr="rustormy"
