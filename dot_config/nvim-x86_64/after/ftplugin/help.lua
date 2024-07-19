vim.cmd("setlocal nofoldenable")

-- Enable 'mini.clue' triggers in help buffer
if _G.MiniClue ~= nil then
	MiniClue.enable_buf_triggers(vim.api.nvim_get_current_buf())
end

-- # TODO: actually read the error message this returns
--
-- local function floating_doc()
-- 	local buf = vim.api.nvim_create_buf(false, true)
-- 	local width = math.floor(vim.o.columns * 0.4)
-- 	local height = math.floor(vim.o.lines * 0.5)
-- 	local row = math.floor(vim.o.rows - height)
-- 	local col = vim.o.columns
--
-- 	local opts = {
-- 		border = "single",
-- 		relative = "win",
-- 		width = width,
-- 		height = height,
-- 		row = row,
-- 		col = col,
-- 	}
--
-- 	vim.api.nvim_open_win(buf, true, opts)
--
-- 	vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.fn.split(vim.fn.execute("h vim"), "\n"))
-- end

vim.api.nvim_create_autocmd("BufWinEnter", {
	buffer = 0,
	callback = function()
		-- floating_doc()
		vim.cmd("wincmd L")
	end,
})
