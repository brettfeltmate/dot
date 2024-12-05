alias ls="eza --color --icons --classify --group-directories-first"
alias la="ls -a"
alias ld="ls -lD"
alias lf="ls -lf | grep -v /"
alias ll="ls -al"
alias lh="ls -dl .*"
alias lm="ls -al --sort=modified"
alias tre='tre -e nvim'
alias tr1="tre -l 1"
alias tr2="tre -l 2"
alias tr3="tre -l 3"
alias td1="tre -d -l 1"
alias td2="tre -d -l 2"
alias td3="tre -d -l 3"
alias ta1="tre -a -l 1"
alias ta2="tre -a -l 2"
alias ta3="tre -a -l 3"
# alias cd='z'
alias ..="cd '..' "
alias ...="cd '../..'"
alias ....="cd '../../..'"
alias r="radian"
alias lg="lazygit"
alias yy="yazi"
alias rr="ranger"
alias olli="ansiweather -a true -p true -s true -h true -H true -s true -u metric -l 'Halifax,CA'"
alias cat="bat"


# dotfile management
alias editmoi="chezmoi edit"
alias addmoi="chezmoi add"
alias raddmoi="chezmoi re-add"
alias applymoi="chezmoi apply"
alias cdmoi="chezmoi cd"
alias delmoi="chezmoi destroy"

alias msvim='NVIM_APPNAME="msvim" nvim'
alias neoboox='NVIM_APPNAME="neoboox" nvim'

# qol aliases when switching between archs
alias arch86="/usr/bin/arch -x86_64 /usr/bin/env /bin/zsh --login; arch"
alias arch64="/usr/bin/arch -arm64 /usr/bin/env /bin/zsh --login; arch"
alias rig86="rig switch 4.4-x86_64"  # toggling global R version
alias rig64="rig switch 4.4-arm64"

alias brosh="mosh --server=/opt/homebrew/bin/mosh-server"
alias moshmini="brosh cogmotorlab@tbd51.wpa.dal.ca"

alias mux="tmux new-session -A -s default"
alias tms="create_tmux_session"
alias fab="fabular"

# tmux
# alias con="sesh connect $(sesh list | fzf)"
# alias ses="sesh-sessions"
#

# taskwarrior
alias tcal="task calendar"
alias tnext="task next"
alias ttui="taskwarrior-tui"
alias tls="task ls"
alias tdue="task due"
alias tsum="task summary"

alias icat="imgcat -W 100% -r"

alias diet="NVIM_APPNAME='dietnvim' nvim"

# visidata shorthands
alias vd="visidata --theme=ascii8"
alias vdkl="vd --filetype=tsv --skip=15 --header=1"
