# AGENTS.md - Development Guidelines for Chezmoi Dotfiles

This repository is a comprehensive personal dotfiles management system using chezmoi. It contains configurations for development tools, window managers, terminals, and various utilities across multiple programming languages.

## Project Structure & Technologies

**Primary Languages & Tools:**
- **Lua** (174 files) - Neovim configuration with 95+ themes and extensive plugin ecosystem
- **Shell Scripts** (42 files) - Bash/Zsh automation, utilities, and SketchyBar plugins
- **Configuration Files** - TOML, CONF, JSON for various tools
- **Python** - Kitty terminal utilities, ptpython config
- **C/C++** - Custom SketchyBar helpers and utilities
- **JavaScript** - Browser extension configurations (SurfingKeys)

**Key Directories:**
- `nvim/` - Comprehensive Neovim setup with LSP, plugins, themes
- `kitty/` - Terminal emulator with Python scripts
- `sketchybar/` - macOS menu bar customization
- `aerospace/` - Window manager configuration  
- `zsh/` - Shell configuration and completions
- Various tool configs (tmux, R, rstudio, starship, etc.)

## Build/Test/Lint Commands

### Repository Management
This is a configuration repository managed by chezmoi - no traditional build system.

```bash
# Apply configuration changes
chezmoi apply

# Preview changes before applying
chezmoi diff

# Edit a managed file
chezmoi edit <file>

# Re-initialize from repository
chezmoi init --apply brettfeltmate/dot
```

### Environment Setup
```bash
# Complete macOS setup from scratch
./dot_config/executable_mac_setup.sh

# Apply Homebrew packages
xargs brew install < ~/.config/brew_installs.txt
xargs brew install --cask < ~/.config/brew_casks.txt
```

### Testing & Validation
```bash
# Test Neovim configuration in isolated environment
NVIM_APPNAME=dot_config/nvim nvim

# Validate shell configuration
source ~/.zshrc

# Test SketchyBar configuration
sketchybar --reload

# Validate window manager setup
aerospace reload-config

# Check terminal configuration
kitty --config ~/.config/kitty/kitty.conf
```

### Single Tool Testing
```bash
# Test specific Neovim plugin or configuration
nvim -u ~/.config/nvim/init.lua +PackerSync +qa

# Test shell function or completion
zsh -c "source ~/.zshrc && your_function_name"

# Test starship prompt configuration  
starship config

# Validate TOML configuration files
# (No built-in validator, but tools will error on invalid syntax)
```

## Code Style Guidelines

### Lua (Neovim Configuration)
**Indentation & Formatting:**
- Use 4-space indentation (shiftwidth=4, tabstop=4)
- No tabs, spaces only
- Maximum line length: ~100 characters (flexible)

**Naming Conventions:**
- Function naming: `snake_case` for user functions, `PascalCase` for plugin configs
- Variable naming: `snake_case` for locals, `SCREAMING_SNAKE_CASE` for constants
- File naming: lowercase with hyphens for plugins (`colorscheme.lua`, `treesitter.lua`)

**Structure & Organization:**
- Plugin organization: One plugin per file in `lua/plugins/`, return table format
- Use Lazy.nvim plugin specification format
- Leader key: `space`, local leader: `comma`

**Comments & Documentation:**
- Use `--` for single line comments
- Avoid block comments unless absolutely necessary
- Comment complex keymaps and configuration reasoning

**Table Formatting:**
```lua
-- Good: Aligned values for readability
return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd          = "Telescope",
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Live Grep" },
    },
}

-- Use trailing commas for multi-line tables
local opts = {
    noremap = true,
    silent = true,
    expr = false,
}
```

### Shell Scripts (Bash/Zsh)
**File Extensions & Compatibility:**
- Use `.zsh` extension for zsh-specific functions and completions
- Use `.sh` for POSIX-compliant scripts
- Prefer POSIX compliance unless zsh-specific features are needed

**Error Handling & Safety:**
- Always start scripts with `#!/bin/bash` or `#!/usr/bin/env zsh`
- Use `set -e` for error exit on command failure
- Use `set -u` for undefined variable errors in critical scripts

**Variable Handling:**
```bash
# Always quote variables to prevent word splitting
rm "$HOME/.config/nvim/plugin/packer_compiled.lua"

# Use parameter expansion for defaults
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"

# Function naming: snake_case with descriptive prefixes
setup_homebrew() {
    local brew_prefix
    # Function implementation
}
```

**SketchyBar Plugin Style:**
- Use consistent shebang: `#!/usr/bin/env bash`
- Source shared scripts: `source "$CONFIG_DIR/sketchybar/colors.sh"`
- Use consistent variable naming for colors and icons

### Configuration Files

**TOML Files (Starship, Aerospace, etc.):**
- Use lowercase keys consistently
- Organize sections logically by functionality
- Align values when it improves readability

```toml
[character]
success_symbol = "[❯](11)"
error_symbol = "[❯](9)"
vimcmd_symbol = "[❮](bold green)"

[git_branch]
format = "[$branch(:$remote_branch)]($style) "
style = "8"
```

**CONF Files (Kitty, Tmux, etc.):**
- Use vim fold markers for organization: `# {{{` `# }}}`
- Group related settings together
- Comment sections to explain purpose, not implementation

```conf
# vim:fileencoding=utf-8:foldmethod=marker

# Term options {{{
term xterm-kitty
shell_integration yes
scrollback_lines 2000
# }}}

# Keymaps {{{
map ctrl+escape close_window
map kitty_mod+space next_window
# }}}
```

**JSON Files:**
- Use 2-space indentation
- Maintain alphabetical ordering of keys where logical
- No trailing commas (JSON strict compliance)

### Python Scripts
**Style & Formatting:**
- Follow PEP 8 conventions
- Use 4-space indentation
- Maximum line length: 88 characters (Black formatter standard)
- Use type hints where beneficial

```python
#!/usr/bin/env python3
"""Kitty terminal utilities and integrations."""

import sys
from typing import Optional

def toggle_zoom(window_id: Optional[str] = None) -> bool:
    """Toggle zoom state of kitty window."""
    # Implementation
    pass
```

### C/C++ (SketchyBar Helpers)
- Use 4-space indentation
- K&R brace style for consistency with macOS system code
- Meaningful variable names, avoid abbreviations
- Include proper headers and error checking

## Error Handling & Debugging

### Neovim Configuration Debugging
```lua
-- Use vim.notify for user-visible messages
vim.notify("Plugin loaded successfully", vim.log.levels.INFO)

-- Use print() for debugging (will show in :messages)
print("Debug: variable value =", vim.inspect(variable))
```

### Shell Script Error Handling
```bash
# Check command success before proceeding
if ! command -v brew &> /dev/null; then
    echo "Error: Homebrew not found" >&2
    exit 1
fi

# Use trap for cleanup
trap 'echo "Script interrupted" >&2; exit 1' INT TERM
```

## Package Management & Dependencies

### Neovim Plugin Management
- Use Lazy.nvim for plugin management
- Pin important plugins to stable versions when needed
- Use Mason for LSP/formatter/linter management

### System Package Management
- **Primary**: Homebrew for macOS packages
- **Configuration**: `brew_installs.txt` and `brew_casks.txt` for declarative package lists
- **Language-specific**: Individual tool configurations (R, Python, etc.)

## Import/Require Conventions

### Lua Module Loading
```lua
-- Use pcall for optional dependencies
local ok, telescope = pcall(require, "telescope")
if not ok then
    return
end

-- Group requires logically
local api = vim.api
local fn = vim.fn
local cmd = vim.cmd
```

### Shell Script Sourcing
```bash
# Source with error checking
if [[ -f "$HOME/.config/colors.sh" ]]; then
    source "$HOME/.config/colors.sh"
else
    echo "Warning: colors.sh not found" >&2
fi
```

## Comments & Documentation

**Lua Comments:**
```lua
-- TODO: Add support for custom themes
-- FIXME: Handle edge case for empty buffers  
-- NOTE: This requires Neovim 0.9+
```

**Shell Comments:**
```bash
# Script: Setup development environment
# Author: [Author Name]
# Description: Comprehensive macOS development setup
```

**Configuration Comments:**
- Explain WHY, not WHAT
- Document non-obvious keybindings and their purposes
- Include URLs for complex configurations or inspiration sources

This comprehensive guide ensures consistency across the entire dotfiles ecosystem while maintaining the flexibility needed for personal development environment management.