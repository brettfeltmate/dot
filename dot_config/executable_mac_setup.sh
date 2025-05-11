#!/bin/bash
set -e

# Ensure Xcode command line tools are installed
if ! xcode-select -p &>/dev/null; then
    echo "🛠️ Installing Xcode command line tools..."
    xcode-select --install
    echo "⚠️ Please wait for Xcode command line tools to finish installing, then run this script again."
    exit 0
fi

echo "🔄 Setting up your Mac environment..."

# Install Homebrew
if ! command -v brew &> /dev/null; then
    echo "📦 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Handle both Intel and Apple Silicon Macs
    if [[ -f /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -f /usr/local/bin/brew ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
    # Add Homebrew to your PATH permanently
    echo 'eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv)"' >> ~/.zprofile
else
    echo "✅ Homebrew already installed"
fi

# Install chezmoi
echo "🏠 Installing chezmoi..."
brew install chezmoi

# Get dotfiles from your repository (replace with your repo)
echo "📁 Setting up dotfiles with chezmoi..."
chezmoi init --apply brettfeltmate/dot

# Install core homebrew packages
echo "🍺 Installing Homebrew packages..."
if [[ -f "$HOME/.config/brew_installs.txt" ]]; then
    xargs brew install < "$HOME/.config/brew_installs.txt"
else
    echo "⚠️ brew_installs.txt not found. Skipping package installation."
    mkdir -p "$HOME/.config"
    echo "# Add your desired brew packages here" > "$HOME/.config/brew_installs.txt"
fi

# Install cask applications
echo "📱 Installing cask applications..."
if [[ -f "$HOME/.config/brew_casks.txt" ]]; then
    while read -r cask; do
        [[ -z "$cask" || "$cask" =~ ^#.* ]] && continue
        brew install --cask "$cask"
    done < "$HOME/.config/brew_casks.txt"
else
    echo "⚠️ brew_casks.txt not found. Skipping cask installation."
    mkdir -p "$HOME/.config"
    echo "# Add your desired cask applications here" > "$HOME/.config/brew_casks.txt"
fi

if [ "$SHELL" != "$(which zsh)" ]; then
    echo "🐚 Setting up shell environment..."
    if ! grep -q "$(which zsh)" /etc/shells; then
        echo "$(which zsh)" | sudo tee -a /etc/shells
    fi
    chsh -s "$(which zsh)"
fi


# Set macOS preferences
echo "⚙️ Setting macOS preferences..."
# Fast key repeat
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
# Show path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true
# Disable desktop icons
defaults write com.apple.finder CreateDesktop false
killall Finder

# TODO: properly automate install of non-brew tools
#
# # Install radian R console
# if command -v pip &>/dev/null; then
#     echo "📊 Installing radian R console..."
#     pip install radian
# else
#     echo "⚠️ pip not found. Skipping radian installation."
# fi
#
# echo "✅ Setup complete! Some changes may require a restart to take effect."
