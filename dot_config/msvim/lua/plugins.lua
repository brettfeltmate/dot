-- [[ Bootstrap lazy.nvim plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.treesitter"),
	require("plugins.cmp"),
	require("plugins.lspconfig"),
	require("plugins.conform"),
	require("plugins.lint"),

	require("plugins.smart-splits"),

	require("plugins.bullets"),
	require("plugins.cmdline"),
	require("plugins.colouring"),
	require("plugins.flash"),
	-- require("plugins.headlines"),
	require("plugins.image"),
	require("plugins.img-clip"),
	require("plugins.markdown-preview"),
	require("plugins.marks"),
	require("plugins.markview"),
	require("plugins.mini"),
	require("plugins.modes"),
	require("plugins.preservim"),
	require("plugins.tpope"),
	require("plugins.typewriter"),
	require("plugins.yanky"),
	require("plugins.zen-mode"),
})
