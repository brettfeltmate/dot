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

alias act="source .venv/bin/activate"
alias dact="deactivate"

alias brosh="mosh --server=/opt/homebrew/bin/mosh-server"
alias moshmini="brosh cogmotorlab@tbd51.wpa.dal.ca"

# pipe setout to nvim
alias -g W='| nvim -c "setlocal buftype=nofile bufhidden=wipe" -c "nnoremap <buffer> q :q!<CR>" -'
# open last eedited file
alias L='nvim -c "normal '\''0"'
# fuzzy find file with preview
alias pf="fzf --bind ctrl-y:preview-up,ctrl-e:preview-down \
              --bind ctrl-b:preview-page-up,ctrl-f:preview-page-down \
              --bind ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down \
              --bind ctrl-k:up,ctrl-j:down \
              --preview='(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null'"
# open file with fzf
alias viz="for file in \`pf\`; do cmd=\"vim \$file\" && print -rs -- \$cmd && eval \$cmd; done"

# FZF
# alias czf="fzf --color='bg:#4B4B4B,bg+:#3F3F3F,info:#BDBB72,border:#6B6B6B,spinner:#98BC99' \
#     ╎          --color='hl:#719872,fg:#D9D9D9,header:#719872,fg+:#D9D9D9' \
#     ╎          --color='pointer:#E12672,marker:#E17899,prompt:#98BEDE,hl+:#98BC99'"
# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
# export FZF_DEFAULT_OPTS="--preview --layout=reverse --border --prompt='🔍 '"
# export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
