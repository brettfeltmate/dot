vim.cmd("setlocal nofoldenable")

-- Enable 'mini.clue' triggers in help buffer
if _G.MiniClue ~= nil then
	MiniClue.enable_buf_triggers(vim.api.nvim_get_current_buf())
end

vim.api.nvim_create_autocmd("BufWinEnter", {
	buffer = 0,
	callback = function()
		vim.cmd("wincmd L")
	end,
})
