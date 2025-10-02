local M = {}

-- Open plot viewer in browser, or fail gracefully
function M.browseplots()
	local r_ft = vim.bo.filetype == "r" or vim.bo.filetype == "rmd"
	local has_slime = vim.fn.exists("g:slime") == 1

	if not r_ft then
		vim.notify("BrowsePlots only works in R files", vim.log.levels.WARN)
		return
	end

	if not has_slime then
		vim.notify("vim-slime not available", vim.log.levels.ERROR)
		return
	end

	local success, err = pcall(function()
		vim.cmd([[SlimeSend1 tryCatch(httpgd::hgd_browse(),error=function(e) {httpgd::hgd();httpgd::hgd_browse()})]])
	end)

	if not success then
		vim.notify("Failed to send command to R: " .. err, vim.log.levels.ERROR)
	end
end

function M.transFlip()
	-- Exit early if no splits exist
	if vim.fn.winnr("$") == 1 then
		vim.notify("No splits to flip", vim.log.levels.WARN)
		return
	end

	local success, err = pcall(function()
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
	end)

	if not success then
		vim.notify("Failed to flip windows: " .. err, vim.log.levels.ERROR)
	end
end

function M.scrollBind()
	local success, err = pcall(function()
		if not vim.g.scrollbindon then
			for i = 1, vim.fn.winnr("$") do
				vim.cmd(i .. "windo set scrollbind")
			end
			vim.g.scrollbindon = true
			vim.notify("Scroll bind enabled", vim.log.levels.INFO)
		else
			for i = 1, vim.fn.winnr("$") do
				vim.cmd(i .. "windo set scrollbind!")
			end
			vim.g.scrollbindon = false
			vim.notify("Scroll bind disabled", vim.log.levels.INFO)
		end
	end)

	if not success then
		vim.notify("Failed to toggle scroll bind: " .. err, vim.log.levels.ERROR)
	end
end

function M.toggleMargin()
	local success, err = pcall(function()
		if vim.wo.signcolumn == "auto:2" then
			vim.wo.signcolumn = "yes:8"
		else
			vim.wo.signcolumn = "auto:8"
		end
	end)

	if not success then
		vim.notify("Failed to toggle margin: " .. err, vim.log.levels.ERROR)
	end
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
function M.markerOrTreeFold()
	local line = vim.fn.getline(vim.v.lnum)
	
	-- Check for marker-based folds first (e.g., {{{, }}})
	local marker_start = vim.bo.foldmarker:match("([^,]+)")
	local marker_end = vim.bo.foldmarker:match(",(.+)")
	
	if line:find(marker_start, 1, true) then
		local level = select(2, line:gsub(vim.pesc(marker_start), ""))
		return ">" .. level
	elseif line:find(marker_end, 1, true) then
		local level = select(2, line:gsub(vim.pesc(marker_end), ""))
		return "<" .. level
	end
	
	-- Fall back to treesitter folding if available
	if vim.treesitter.foldexpr then
		return vim.treesitter.foldexpr()
	end
	
	-- Default to no fold
	return "0"
end

vim.g.scrollbindon = false
	end
end

function M.toggleMargin()
	if vim.wo.signcolumn == "auto:2" then
		vim.cmd("lua vim.wo.signcolumn = 'yes:8'")
	else
		vim.cmd("lua vim.wo.signcolumn = 'auto:8'")
	end
end
vim.api.nvim_create_user_command("TransFlip", M.transFlip, { desc = "Flip window arrangement" })
vim.api.nvim_create_user_command("ScrollBind", M.scrollBind, { desc = "Toggle scrollbind" })
vim.api.nvim_create_user_command("BrowsePlots", M.browseplots, { desc = "Open plot viewer" })
vim.api.nvim_create_user_command("ToggleMargin", M.toggleMargin, { desc = "Toggle margin" })
