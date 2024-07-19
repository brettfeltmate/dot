alias ls="lsd"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"
alias lt="ls -tree"
alias ..="cd .."
alias r="radian"
alias lg="lazygit"
alias yy="yazi"
alias olli="ansiweather -a true -p true -s true -h true -H true -s true -u metric -l 'Halifax,CA'"
alias editmoi="chezmoi edit"
alias addmoi="chezmoi add"
alias applymoi="chezmoi apply"
alias cdmoi="chezmoi cd"
alias brew86="arch --x86_64 /usr/local/bin/brew"
alias ib='PATH=/usr/local/bin'

# Function to determine system architecture
get_architecture() {
  uname -m
}

# Set appropriate Neovim binary based on architecture
architecture=$(get_architecture)

if [ "$architecture" = "x86_64" ]; then
    alias nvim='NVIM_APPNAME="nvim-x86_64"'
fi
