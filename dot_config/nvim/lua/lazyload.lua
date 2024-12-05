vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

-- [[ Bootstrap lazy.nvim plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require("lazy").setup({
	stats = { real_cputime = true, },
	profiling = { loader = true, require = true, },
	spec = { { import = "plugins" } },
})

for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
	dofile(vim.g.base46_cache .. v)
end
-- vim: ts=2 sts=2 sw=2 et
