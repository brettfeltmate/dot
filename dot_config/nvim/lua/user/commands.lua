local M = {}

-- Open plot viewer in browser, or fail gracefully
function M.browse_plots()
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

	local ok, err = pcall(function()
		vim.cmd([[SlimeSend1 tryCatch(httpgd::hgd_browse(),error=function(e) {httpgd::hgd();httpgd::hgd_browse()})]])
	end)

	if not ok then
		vim.notify("Failed to send command to R: " .. tostring(err), vim.log.levels.ERROR)
	end
end

-- Flip between horizontal/vertical split arrangements and recenter
function M.trans_flip()
	if vim.fn.winnr("$") == 1 then
		vim.notify("No splits to flip", vim.log.levels.WARN)
		return
	end

	local ok, err = pcall(function()
		local initial_win = vim.fn.winnr()
		local is_horizontal = vim.fn.winwidth(0) > vim.fn.winheight(0)

		vim.cmd("wincmd " .. (is_horizontal and "K" or "H"))

		if initial_win == vim.fn.winnr() then
			vim.cmd("wincmd " .. (is_horizontal and "H" or "K"))
		end

		local cmds = { "wincmd p", "normal! zz", "wincmd p", "normal! zz" }
		for _, c in ipairs(cmds) do
			vim.cmd(c)
		end
	end)

	if not ok then
		vim.notify("Failed to flip windows: " .. tostring(err), vim.log.levels.ERROR)
	end
end

-- Toggle scrollbind across all windows in the current tabpage
function M.scroll_bind()
	if vim.g.scrollbindon == nil then
		vim.g.scrollbindon = false
	end

	local ok, err = pcall(function()
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

	if not ok then
		vim.notify("Failed to toggle scroll bind: " .. tostring(err), vim.log.levels.ERROR)
	end
end

-- Toggle a wider signcolumn margin
function M.toggle_margin()
	local ok, err = pcall(function()
		if vim.wo.signcolumn == "auto:2" then
			vim.wo.signcolumn = "yes:8"
		else
			vim.wo.signcolumn = "auto:8"
		end
	end)

	if not ok then
		vim.notify("Failed to toggle margin: " .. tostring(err), vim.log.levels.ERROR)
	end
end

-- Prefer marker-based folds; fall back to treesitter; else none
function M.marker_or_tree_fold()
	local line = vim.fn.getline(vim.v.lnum)

	local marker_start = vim.bo.foldmarker:match("([^,]+)")
	local marker_end = vim.bo.foldmarker:match(",(.+)")

	if marker_start and line:find(marker_start, 1, true) then
		local level = select(2, line:gsub(vim.pesc(marker_start), ""))
		return ">" .. level
	elseif marker_end and line:find(marker_end, 1, true) then
		local level = select(2, line:gsub(vim.pesc(marker_end), ""))
		return "<" .. level
	end

	if vim.treesitter and vim.treesitter.foldexpr then
		return vim.treesitter.foldexpr()
	end

	return "0"
end

-- Register user commands
function M.setup()
	vim.api.nvim_create_user_command("TransFlip", M.trans_flip, { desc = "Flip window arrangement" })
	vim.api.nvim_create_user_command("ScrollBind", M.scroll_bind, { desc = "Toggle scrollbind" })
	vim.api.nvim_create_user_command("BrowsePlots", M.browse_plots, { desc = "Open plot viewer" })
	vim.api.nvim_create_user_command("ToggleMargin", M.toggle_margin, { desc = "Toggle margin" })

	-- vim.api.nvim_create_user_command("DirDiff", function(opts)
	--     if vim.tbl_count(opts.fargs) ~= 2 then
	--         vim.notify("DirDiff requires exactly two directory arguments", vim.log.levels.ERROR)
	--         return
	--     end
	--
	--     vim.cmd("tabnew")
	--
	--     pcall(function()
	--         vim.cmd.packadd("nvim.difftool")
	--     end)
	--
	--     local ok, dt = pcall(require, "difftool")
	--     if not ok then
	--         vim.notify("difftool plugin not available", vim.log.levels.ERROR)
	--         return
	--     end
	--
	--     dt.open(opts.fargs[1], opts.fargs[2], {
	--         rename = { detect = false },
	--         ignore = { ".git" },
	--     })
	-- end, { complete = "dir", nargs = 2, desc = "Diff two directories" })
end

return M
