# convenience
alias ..="cd .."
alias r="radian"
alias lg="lazygit"
alias yy="yazi"
alias olli="ansiweather -a true -p true -s true -h true -H true -s true -u metric -l 'Halifax,CA'"

# eza
alias ls="eza --color --icons --classify"
alias ld="ls -lD"
alias lf="ls -lf | grep -v /"
alias ll="ls -al --group-directories-first"
alias lh="ls -dl .* --group-directories-first"
alias lhf="ls -lf .*"
alias lhd="ls -lD .*"
alias lt1="ls --tree --level=1"
alias lt2="ls --tree --level=2"
alias lt3="ls --tree --level=3"
alias lmd="ls -al --sort=modified"

# dotfile management
alias editmoi="chezmoi edit"
alias addmoi="chezmoi add"
alias applymoi="chezmoi apply"
alias cdmoi="chezmoi cd"

alias ovi='NVIM_APPNAME="ovi" nvim'
alias msvim='NVIM_APPNAME="msvim" nvim'

# qol aliases when switching between archs
alias arch86="/usr/bin/arch -x86_64 /usr/bin/env /bin/zsh --login; arch"
alias arch64="/usr/bin/arch -arm64 /usr/bin/env /bin/zsh --login; arch"
alias brew86="arch --x86_64 /usr/local/bin/brew" # arm64 brew is default
alias ib='PATH=/usr/local/bin' # has yet to be needed
alias rig86="rig switch 4.4-x86_64"  # toggling global R version
alias rig64="rig switch 4.4-arm64"

alias act="source venv/bin/activate"
alias dact="deactivate"
