-- Copy settings from 'r.vim'
vim.cmd("runtime! ftplugin/r.lua")

vim.keymap.set("n", "<CR>", "<Plug>SlimeSendCell", { buffer = 0, noremap = true, desc = "Send cell" })

-- Jump to previous/next cell block
vim.keymap.set("n", "[r", function()
	local line, _ = unpack(vim.fn.searchpos("^```{", "bW"))
	if line ~= 0 then
		local prev_line, prev_col = unpack(vim.fn.searchpos("^```{", "bW"))
		if prev_line ~= 0 then
			vim.api.nvim_win_set_cursor(0, { prev_line + 1, prev_col - 1 })
		end
	end
end, { buffer = 0, noremap = true, desc = "Jump to previous cell" })

vim.keymap.set("n", "]r", function()
	local line, col = unpack(vim.fn.searchpos("^```{", "W"))
	if line ~= 0 then
		vim.api.nvim_win_set_cursor(0, { line + 1, col - 1 })
	end
end, { buffer = 0, noremap = true, desc = "Jump to next cell" })
