local M = {}

-- Open plot viewer in browser, or fail gracefully
function M.browseplots()
	local r_ft = vim.bo.filetype == "r" or vim.bo.filetype == "rmd"

	local has_slime = vim.fn.exists("g:slime") == 1

	if r_ft and has_slime then
		vim.cmd([[SlimeSend1 tryCatch(httpgd::hgd_browse(),error=function(e) {httpgd::hgd();httpgd::hgd_browse()})]])
	end
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

vim.g.scrollbindon = false
function M.scrollBind()
	if not vim.g.scrollbindon then
		for i = 1, vim.fn.winnr("$") do
			vim.cmd(i .. "windo set scrollbind")
		end
		vim.g.scrollbindon = true
	else
		for i = 1, vim.fn.winnr("$") do
			vim.cmd(i .. "windo set scrollbind!")
		end
		vim.g.scrollbindon = false
	end
end

vim.api.nvim_create_user_command("TransFlip", M.transFlip, { desc = "Flip window arrangement" })
vim.api.nvim_create_user_command("ScrollBind", M.scrollBind, { desc = "Toggle scrollbind" })
vim.api.nvim_create_user_command("BrowsePlots", M.browseplots, { desc = "Open plot viewer" })
