-- [[ Bootstrap lazy.nvim plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- NVUI theming
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache"

require("lazy").setup({
	stats = { real_cputime = true },
	profiling = { loader = true, require = true },
	spec = {
		{ import = "plugins" },
	},
	ui = { border = "rounded" },
})

-- vim: ts=2 sts=2 sw=2 et
