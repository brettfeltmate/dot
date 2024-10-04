-- Copy settings from 'r.vim'
vim.cmd("runtime! ftplugin/r.lua")

vim.keymap.set("n", "<leader>rc", "<Plug>SlimeSendCell", { buffer = 0, noremap = true, desc = "Send cell" })
vim.keymap.set("n", "<CR>", "<Plug>SlimeSendCell", { buffer = 0, noremap = true, desc = "Send cell" })

-- Jump to previous/next cell block
vim.keymap.set("n", "[r", function()
	local line, col = unpack(vim.fn.searchpos("^```{", "bW"))
	if line ~= 0 then
		vim.api.nvim_win_set_cursor(0, { line, col - 1 })
	end
end, { buffer = 0, noremap = true, desc = "Jump to previous cell" })

vim.keymap.set("n", "]r", function()
	local line, col = unpack(vim.fn.searchpos("^```{", "W"))
	if line ~= 0 then
		vim.api.nvim_win_set_cursor(0, { line, col - 1 })
	end
end, { buffer = 0, noremap = true, desc = "Jump to next cell" })
-- Manually copy some settings from 'markdown.lua'
vim.cmd([[setlocal spell]])
vim.cmd([[setlocal wrap]])
