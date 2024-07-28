path=('/opt/homebrew/bin' $path)
# so FireFox is findable; don't recall if this worked...
path+=('/Applications/')
# get rusty
path+=("$HOME/.cargo/bin/")
# py venv
path+=("$HOME/.pyenv/shims/")

export PATH
export BAT_THEME="base16-256"
# don't remember what this is for; something nvimmy
export DYLD_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_LIBRARY_PATH"
