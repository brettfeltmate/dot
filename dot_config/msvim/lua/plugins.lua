-- [[ Bootstrap lazy.nvim plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.cmdline"),
	require("plugins.cmp"),
	require("plugins.colouring"),
	require("plugins.flash"),
	require("plugins.junegunn"),
	require("plugins.marks"),
	require("plugins.mini"),
	require("plugins.preservim"),
	require("plugins.tpope"),
	require("plugins.treesitter"),
	require("plugins.yanky"),
})
