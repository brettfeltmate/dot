# eza
alias ls="eza --group-directories-first --icons --dereference"
alias la="ls --all --no-user --git"
alias ll="la --long --grid"
alias lt="ls --tree --level 1"

# Quick navbacks
alias ..="cd '..' "
alias ...="cd '../..'"

# Tools
alias nv="nvim"
alias r="radian"
alias cat="bat"
alias moi="chezmoi cd"
alias fc="fancy-cat"
alias bp="bpython"
alias icat="kitten icat"
alias gg="icat --use-window-size 1,1,1500,1500 ./scratch.png"
alias xv="xan view -p -R --theme rounded"

# qol aliases when switching between archs
# alias arch86="/usr/bin/arch -x86_64 /usr/bin/env /bin/zsh --login; arch"
# alias arch64="/usr/bin/arch -arm64 /usr/bin/env /bin/zsh --login; arch"
# alias rig86="rig switch 4.4-x86_64"  # toggling global R version
# alias rig64="rig switch 4.4-arm64"

# alias brosh="mosh --server=/opt/homebrew/bin/mosh-server"
# alias moshmini="brosh CogMotors-Mac-mini.local"
