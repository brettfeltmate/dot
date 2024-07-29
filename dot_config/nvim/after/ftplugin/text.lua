vim.cmd("setlocal spell")
vim.cmd("setlocal wrap")

-- NOTE: mostly for docs whose ft doesn't load help.lua
vim.api.nvim_create_autocmd("BufWinEnter", {
	buffer = 0,
	callback = function()
		vim.cmd("wincmd L")
	end,
})

require("junegunn/limelight")
require("junegunn/goyo")
require("tpope/vim-abolish")
require("preservim/vim-pencil")
require("preservim/vim-textobj-quote")
require("preservim/vim-textobj-sentence")
require("preservim/vim-wordy")
require("preservim/vim-lexical")
require("preservim/vim-litecorrect")
