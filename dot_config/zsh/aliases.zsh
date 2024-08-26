# convenience
alias ..="cd .."
alias r="radian"
alias lg="lazygit"
alias yy="yazi"
alias rr="ranger"
alias olli="ansiweather -a true -p true -s true -h true -H true -s true -u metric -l 'Halifax,CA'"
alias cat="bat"

alias cd="z"

# eza
alias ls="eza --color --icons --classify"
alias ld="ls -lD"
alias lf="ls -lf | grep -v /"
alias ll="ls -al --group-directories-first"
alias lh="ls -dl .* --group-directories-first"
alias lm="ls -al --sort=modified"
alias lt1="ls --tree --level=1"
alias lt2="ls --tree --level=2"
alias lt3="ls --tree --level=3"

# dotfile management
alias editmoi="chezmoi edit"
alias addmoi="chezmoi add"
alias applymoi="chezmoi apply"
alias cdmoi="chezmoi cd"

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
alias next="task next"
alias ttui="taskwarrior-tui"
