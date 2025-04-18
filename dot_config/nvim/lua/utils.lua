local M = {}

function M.markerOrTreeFold()
	-- Check if there's a marker fold on this line
	local line = vim.fn.getline(vim.v.lnum)

	-- If the line has a marker fold
	if string.match(line, "{{{") or string.match(line, "}}}") then
		return vim.fn.foldlevelmarker(vim.v.lnum)
	end

	-- Otherwise use treesitter folding
	return vim.treesitter.foldexpr()
end

function M.transFlip()
	-- Exit early if no splits exist
	if vim.fn.winnr("$") == 1 then
		vim.notify("No splits to flip", vim.log.levels.WARN)
		return
	end

	local initial_win = vim.fn.winnr()
	local is_horizontal = vim.fn.winwidth(0) > vim.fn.winheight(0)

	-- Try primary orientation flip
	vim.cmd("wincmd " .. (is_horizontal and "K" or "H"))

	-- If unsuccessful, try opposite orientation
	if initial_win == vim.fn.winnr() then
		vim.cmd("wincmd " .. (is_horizontal and "H" or "K"))
	end

	-- Recenter both windows
	local commands = { "wincmd p", "normal! zz", "wincmd p", "normal! zz" }
	for _, cmd in ipairs(commands) do
		vim.cmd(cmd)
	end
end

function M.scrollBind()
	for i = 1, vim.fn.winnr("$") do
		vim.cmd(i .. "windo set scrollbind")
	end
end

function M.scrollUnbind()
	for i = 1, vim.fn.winnr("$") do
		vim.cmd(i .. "windo set scrollbind!")
	end
end

vim.api.nvim_create_user_command(
	"TransFlip",
	M.transFlip,
	{ desc = "Flip window arrangement between vertical and horizontal" }
)
vim.api.nvim_create_user_command("ScrollBind", M.scrollBind, { desc = "Enable scroll binding for all windows" })
vim.api.nvim_create_user_command("ScrollUnbind", M.scrollUnbind, { desc = "Disable scroll binding for all windows" })
