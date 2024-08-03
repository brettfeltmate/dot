return {
	"vigemus/iron.nvim",
	event = "VeryLazy",
	config = function()
		local fts = require("iron.fts")
		local iron = require("iron.core")
		local view = require("iron.view")

		iron.setup({
			config = {
				scratch_repl = false,
				repl_definition = {
					python = fts.python.ipython,
					r = fts.r.radian,
					julia = fts.julia.julia,
					lua = fts.lua.lua,
					zsh = fts.zsh.zsh,
				},
				close_window_on_exit = false,
				repl_open_cmd = view.split.vertical.botright(70),
			},
		})
	end,
}
