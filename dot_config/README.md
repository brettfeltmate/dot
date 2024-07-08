# The Bretter Neovim Config

<a href="https://dotfyle.com/brettfeltmate/dot-dotconfig-nvim"><img src="https://dotfyle.com/brettfeltmate/dot-dotconfig-nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/brettfeltmate/dot-dotconfig-nvim"><img src="https://dotfyle.com/brettfeltmate/dot-dotconfig-nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/brettfeltmate/dot-dotconfig-nvim"><img src="https://dotfyle.com/brettfeltmate/dot-dotconfig-nvim/badges/plugin-manager?style=flat" /></a>


## Install Instructions

 > Install requires Neovim 0.9+. Always review the code before installing a configuration.

 > NOTE: I have no clue if/what tweaks would be needed to make this Windows compliant.

Clone the repository and install the plugins:

```sh
git clone git@github.com:brettfeltmate/dot ~/.config/brettfeltmate/dot
```

Open Neovim with this config:

```sh
NVIM_APPNAME=brettfeltmate/dot/dot_config/nvim nvim
```
## Recommended Font
+ [Maple Mono NF](https://github.com/subframe7536/Maple-font)

Clean & casual like Recursive Mono, with a MonoLisa-like classiness; I use it for everything.

Italics could be more consistently italic, but I'm splitting hairs there.

 > |> makes an actual triangle, super fun for stylizing bars & stuff.

 > Setting medium (or semibold) as default weight works great on displays w/ subpar resolutions.

Installation
  + macOS: ```brew install --cask font-maple```
  + Arch: ```paru -S ttf-maple```
  + Manual: Download via [releases](https://github.com/subframe7536/Maple-font/releases)

 > Active release cycle, so manual installation is recommended. I've yet to have any issues with the so-called "beta" releases.

## Plugins

### ai

+ [CopilotC-Nvim/CopilotChat.nvim](https://dotfyle.com/plugins/CopilotC-Nvim/CopilotChat.nvim)
### color

+ [brenoprata10/nvim-highlight-colors](https://dotfyle.com/plugins/brenoprata10/nvim-highlight-colors)
+ [mvllow/modes.nvim](https://dotfyle.com/plugins/mvllow/modes.nvim)
+ [uga-rosa/ccc.nvim](https://dotfyle.com/plugins/uga-rosa/ccc.nvim)
### colorscheme

+ [sainnhe/everforest](https://dotfyle.com/plugins/sainnhe/everforest)
+ [dgox16/oldworld.nvim](https://dotfyle.com/plugins/dgox16/oldworld.nvim)
+ [mellow-theme/mellow.nvim](https://dotfyle.com/plugins/mellow-theme/mellow.nvim)
+ [sonjiku/yawnc.nvim](https://dotfyle.com/plugins/sonjiku/yawnc.nvim)
+ [comfysage/evergarden](https://dotfyle.com/plugins/comfysage/evergarden)
+ [sho-87/kanagawa-paper.nvim](https://dotfyle.com/plugins/sho-87/kanagawa-paper.nvim)
+ [ramojus/mellifluous.nvim](https://dotfyle.com/plugins/ramojus/mellifluous.nvim)
### colorscheme-creation

+ [echasnovski/mini.colors](https://dotfyle.com/plugins/echasnovski/mini.colors)
+ [Iron-E/nvim-highlite](https://dotfyle.com/plugins/Iron-E/nvim-highlite)
+ [rktjmp/lush.nvim](https://dotfyle.com/plugins/rktjmp/lush.nvim)
### comment

+ [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)
### completion

+ [zbirenbaum/copilot.lua](https://dotfyle.com/plugins/zbirenbaum/copilot.lua)
+ [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)
### debugging

+ [rcarriga/nvim-dap-ui](https://dotfyle.com/plugins/rcarriga/nvim-dap-ui)
+ [mfussenegger/nvim-dap](https://dotfyle.com/plugins/mfussenegger/nvim-dap)
### editing-support

+ [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs)
+ [nvim-treesitter/nvim-treesitter-context](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-context)
### file-explorer

+ [mikavilpas/yazi.nvim](https://dotfyle.com/plugins/mikavilpas/yazi.nvim)
### formatting

+ [stevearc/conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)
### git

+ [kdheepak/lazygit.nvim](https://dotfyle.com/plugins/kdheepak/lazygit.nvim)
### icon

+ [nvim-tree/nvim-web-devicons](https://dotfyle.com/plugins/nvim-tree/nvim-web-devicons)
### lsp

+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
+ [nvimdev/lspsaga.nvim](https://dotfyle.com/plugins/nvimdev/lspsaga.nvim)
+ [rachartier/tiny-inline-diagnostic.nvim](https://dotfyle.com/plugins/rachartier/tiny-inline-diagnostic.nvim)
+ [mfussenegger/nvim-lint](https://dotfyle.com/plugins/mfussenegger/nvim-lint)
+ [j-hui/fidget.nvim](https://dotfyle.com/plugins/j-hui/fidget.nvim)
+ [stevearc/aerial.nvim](https://dotfyle.com/plugins/stevearc/aerial.nvim)
### lsp-installer

+ [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)
### motion

+ [folke/flash.nvim](https://dotfyle.com/plugins/folke/flash.nvim)
### nvim-dev

+ [folke/neodev.nvim](https://dotfyle.com/plugins/folke/neodev.nvim)
+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
### plugin-manager

+ [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)
### project

+ [ahmedkhalf/project.nvim](https://dotfyle.com/plugins/ahmedkhalf/project.nvim)
### search

+ [MagicDuck/grug-far.nvim](https://dotfyle.com/plugins/MagicDuck/grug-far.nvim)
### snippet

+ [rafamadriz/friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets)
+ [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
### split-and-window

+ [mrjones2014/smart-splits.nvim](https://dotfyle.com/plugins/mrjones2014/smart-splits.nvim)
### syntax

+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
+ [nvim-treesitter/nvim-treesitter-textobjects](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-textobjects)
### terminal-integration

+ [numToStr/FTerm.nvim](https://dotfyle.com/plugins/numToStr/FTerm.nvim)
+ [akinsho/toggleterm.nvim](https://dotfyle.com/plugins/akinsho/toggleterm.nvim)
### utility

+ [kevinhwang91/nvim-ufo](https://dotfyle.com/plugins/kevinhwang91/nvim-ufo)
+ [echasnovski/mini.nvim](https://dotfyle.com/plugins/echasnovski/mini.nvim)
## Language Servers

+ clangd
+ html
+ marksman
+ matlab_ls
+ r_language_server
+ rust_analyzer
+ tflint


 This readme was generated by [Dotfyle](https://dotfyle.com)
