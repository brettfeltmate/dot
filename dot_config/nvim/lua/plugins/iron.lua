return {
	"vigemus/iron.nvim",
	config = function()
		local iron = require("iron.core")
		iron.setup({
			config = {
				scratch_repl = false,
				repl_definition = {
					python = require("iron.fts.python").ipython,
					r = require("iron.fts.r").radian,
					julia = require("iron.fts.julia").julia,
					lua = require("iron.fts.lua").lua,
					zsh = require("iron.fts.zsh").zsh,
				},
				close_window_on_exit = false,
				repl_open_cmd = require("iron.view").right(80),
			},
		})
	end,
}
