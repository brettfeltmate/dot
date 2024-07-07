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

	require("plugins.copilot"),

	require("plugins.lint"),

	require("plugins.todo-comments"),

	require("plugins.mini"),

	-- require 'lua.plugins.debug',

	require("plugins.autopairs"),

	require("plugins.flash"),

	-- require("plugins.lazygit"),

	require("plugins.modes"),

	require("plugins.smart-splits"),

	require("plugins.stay-centered"),

	require("plugins.toggleterm"),

	require("plugins.yazi"),

	-- require("plugins.project"),

	require("plugins.harpoon"),

	require("plugins.grug-far"),

	require("plugins.rainbow-delimiters"),

	-- require("plugins.colorizer"),

	require("plugins.ccc"),

	require("plugins.nvim-highlight-colors"),

	require("plugins.colorizing"),

	require("plugins.ufo"),

	require("plugins.iron"),
})

-- vim: ts=2 sts=2 sw=2 et
