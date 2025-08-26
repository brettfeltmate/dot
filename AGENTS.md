# AGENTS.md - Development Guidelines for Chezmoi Dotfiles

## Build/Test/Lint Commands
This is a personal dotfiles repository managed by chezmoi - no traditional build system.
- Apply configuration changes: `chezmoi apply`
- Preview changes: `chezmoi diff`
- Edit template: `chezmoi edit <file>`
- For Neovim config: Test by opening nvim with `NVIM_APPNAME=dot_config/nvim nvim`
- For shell configs: Source changes with `source ~/.zshrc` or restart shell

## Code Style Guidelines

### Lua (Neovim configuration)
- Use 4-space indentation (shiftwidth=4, tabstop=4)
- Leader key: space, local leader: comma
- Function naming: snake_case for user functions, PascalCase for plugin configs
- Table formatting: Align values when reasonable, trailing commas for multi-line
- Comments: `--` for single line, no block comments unless necessary
- Plugin organization: One plugin per file in `lua/plugins/`, return table format

### Shell Scripts (Bash/Zsh)
- Use `.zsh` extension for zsh-specific functions
- POSIX compliance preferred unless zsh-specific features needed
- Function naming: snake_case with descriptive prefixes
- Quote variables: `"$variable"` to prevent word splitting

### Configuration Files
- TOML: Use lowercase keys, sections organized logically
- Use vim fold markers `# {{{` `# }}}` for organization (kitty.conf style)
- Comments: Explain purpose, not implementation