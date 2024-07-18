return {
	"vigemus/iron.nvim",
	event = "BufReadPost",
	config = function()
		local fts = require("iron.fts")
		local iron = require("iron.core")
		local view = require("iron.view")

		-- -- #HACK: use native R repl if x86_64, radian otherwise
		-- -- #TODO: get radian working on x86_64
		local handle = io.popen("uname -m")
		local result = handle:read("*a")
		local fts_r = nil
		--
		if result:match("x86_64") then
			fts_r = fts.r.r
		elseif result:match("arm64") then
			fts_r = fts.r.radian
		else
			error("Unsupported architecture: " .. result)
		end
		--
		---@diagnostic disable-next-line: missing-parameter
		handle.close()
		iron.setup({
			config = {
				scratch_repl = false,
				repl_definition = {
					python = fts.python.ipython,
					-- r = fts.r.radian,
					r = fts_r,
					julia = fts.julia.julia,
					lua = fts.lua.lua,
					zsh = fts.zsh.zsh,
				},
				close_window_on_exit = false,
				repl_open_cmd = view.offset({
					width = math.floor(vim.o.columns * 0.45),
					height = math.floor(vim.o.lines * 0.95),
					w_offset = view.helpers.proportion(1),
					h_offset = view.helpers.proportion(0.1),
				}),
			},
		})
	end,
}
