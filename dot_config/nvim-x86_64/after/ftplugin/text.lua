vim.cmd("setlocal spell")
vim.cmd("setlocal wrap")

-- NOTE: mostly for docs whose ft doesn't load help.lua
vim.api.nvim_create_autocmd("BufWinEnter", {
	buffer = 0,
	callback = function()
		vim.cmd("wincmd L")
	end,
})
