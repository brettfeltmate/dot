path+=('/usr/local/bin/brew')
path+=("$HOME/.cargo/bin")
path+=("$HOME/.pyenv-i386/shims")
path+=("$HOME/.local/bin")
# mosh
# path+=("/opt/homebrew/bin/mosh")
# path+=("/opt/homebrew/bin/mosh-server")
# path+=("/opt/homebrew/bin/mosh-client")
export PATH
export BAT_THEME="base16-256"
# something to do with imagemagick
export DYLD_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_LIBRARY_PATH"
