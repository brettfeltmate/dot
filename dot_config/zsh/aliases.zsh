# eza shorthands
alias ls="eza --group-directories-first --icons"
alias la="ls --all --no-user --git"
alias ll="la --long --grid"
alias lt="ls --tree --level 1"

# quickly traverse upwards
alias ..="cd '..' "
alias ...="cd '../..'"

alias nv="nvim"
alias r="radian"
alias lg="lazygit"
alias yy="yazi"
alias rr="ranger"
alias cat="bat"

# chezmoi shorthands
alias editmoi="chezmoi edit"
alias addmoi="chezmoi add"
alias raddmoi="chezmoi re-add"
alias applymoi="chezmoi apply"
alias cdmoi="chezmoi cd"
alias delmoi="chezmoi destroy"
alias formoi="chezmoi forget"
alias manmoi="chezmoi managed"
alias unmoi="chezmoi unmanaged"
alias genmoi="chezmoi generate"

# qol aliases when switching between archs
alias arch86="/usr/bin/arch -x86_64 /usr/bin/env /bin/zsh --login; arch"
alias arch64="/usr/bin/arch -arm64 /usr/bin/env /bin/zsh --login; arch"
alias rig86="rig switch 4.4-x86_64"  # toggling global R version
alias rig64="rig switch 4.4-arm64"

alias brosh="mosh --server=/opt/homebrew/bin/mosh-server"
alias moshmini="brosh CogMotors-Mac-mini.local"

alias mux="tmux new-session -A -s default"
alias fab="fabular"

alias icat="kitten icat"
alias gg="icat --use-window-size 1,1,1500,1500 ./scratch.png"

# visidata shorthands
alias vd="visidata --theme=ascii8"
alias vdkl="vd --filetype=tsv --skip=15 --header=1"

# pyenv
alias dv="pyenv activate dev"
alias deact="pyenv deactivate"

alias fc="fancy-cat"
alias bpy="bpython"

alias xv="xan view -p -R --theme rounded"
alias xvs="xan view -p -R --theme rounded scratch.csv"
