path=('/opt/homebrew/bin' $path)
# so FireFox is findable; don't recall if this worked...
path+=('/Applications/')
# get rusty
path+=("$HOME/.cargo/bin/")
path+=("$HOME/.pyenv/shims/")
export PATH
