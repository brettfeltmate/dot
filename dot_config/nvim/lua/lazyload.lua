-- [[ Bootstrap lazy.nvim plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require("lazy").setup({
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	require("plugins.treesitter"),

	require("plugins.lsp"),

	require("plugins.conform"),

	require("plugins.cmp"),

	require("plugins.lint"),

	require("plugins.mini"),

	require("plugins.in-and-out"),

	require("plugins.todo-comments"),

	require("plugins.terminal"),

	require("plugins.copilot"),

	require("plugins.edit"),

	require("plugins.colouring"),
})

-- vim: ts=2 sts=2 sw=2 et
