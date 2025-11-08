-- [[ Bootstrap lazy.nvim plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache"

-- [[ Configure and install plugins ]]
require("lazy").setup({
	stats = { real_cputime = true },
	profiling = {
		loader = vim.env.NVIM_PROFILE ~= nil,
		require = vim.env.NVIM_PROFILE ~= nil,
	},
	spec = {
		{ import = "plugins" },
	},
	ui = {
		size = { width = 0.8, height = 0.8 },
		border = "rounded",
	},
})

-- Load only current theme cache immediately
local theme_cache = vim.g.base46_cache .. "/themes/" .. require("chadrc").base46.theme .. ".lua"
if vim.uv.fs_stat(theme_cache) then
	dofile(theme_cache)
end

-- Defer integration caches to VeryLazy event
-- vim.api.nvim_create_autocmd("User", {
-- 	pattern = "VeryLazy",
-- 	callback = function()
-- 		for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
-- 			if v ~= "themes" and not v:match("^" .. require("chadrc").base46.theme) then
-- 				dofile(vim.g.base46_cache .. "/" .. v)
-- 			end
-- 		end
-- 	end,
-- })

vim.lsp.inline_completion.enable()

-- vim.cmd("packadd nvim.undotree")
vim.cmd("packadd nvim.difftool")
-- vim: ts=2 sts=2 sw=2 et
