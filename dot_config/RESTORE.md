# Mac Setup Restoration Guide

Because I'll butterfingers it otherwise.

## Before Wiping

1. Ensure your dotfiles are committed and pushed.
2. Superstitiously copy everything to OneDrive.
3. Run, piping to:
   - `brew list --installed-on-request > brew_requested.txt`
   - `brew list > brew_list.txt`
   - Review lists for dumb, unneeded, or redundant shit.
4. Review applications, note down.

## After Fresh Install

1. Run setup script:

   ```
   chmod +x ~/.config/mac_setup.sh
   ~/.config/mac_setup.sh

   ```

2. Which will:

   - Install Homebrew
   - Install chezmoi and setup your dotfiles
   - Install requested brew packages & casks.
   - Install key applications
   - Configure basic macOS settings

3. Install kittens

   - meow
   - kitty-scrollback
     - `nvim --headless +'KittyScrollbackGenerateKittens'`
     - quit out

4. Restore additional files from backup if needed

## Manual Steps

- Sign into your accounts (iCloud, App Store, etc.)
- Restore browser settings and extensions
- Configure app-specific settings not managed by dotfiles
- Set up development environments for specific languages

## Troubleshooting

If chezmoi has issues with your dotfiles, you can apply specific files:

```
chezmoi apply ~/.config/specific_file
```

For brew install errors, try installing packages individually or in smaller
batches.

## Key apps

- Stremio
- Proton Pass
- OneDrive
- Beeper
- iTerm2
- ChatGPT
- Raycast
- BetterDisplay
- SetApp
  - CleanMyMac
  - CleanShot X
  - ForkLift
  - Paste
  - Al Dente
  - Ulyssess
- Brew
  - Spotify
  - AltTab
  - Rig
  - Zen
  - Kitty
  - Sioyek
  - KindaVim
  - Homerow
