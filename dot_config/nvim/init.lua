vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("options")

require("lazyload")

require("keymaps")

require("autocmds")

-- require("polish_highlights")
require("base46").load_all_highlights()
-- vim: ts=2 sts=2 sw=2 et
