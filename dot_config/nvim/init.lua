vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- vim.opt.runtimepath:append("~/.config/nvim/lua")

require("autocmds")

require("lazyload")

require("keymaps")

require("options")
-- vim: ts=2 sts=2 sw=2 et
