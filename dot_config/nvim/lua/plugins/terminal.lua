return {
	{
		"numToStr/FTerm.nvim",
		event = "VeryLazy",
		config = function()
			require("FTerm").setup({
				border = "rounded",
				auto_close = false,
				blend = 5,
				dimensions = {
					height = 0.4,
					width = 0.35,
					x = 0,
					y = 0.9,
				},
			})
		end,
	},
	{
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
					repl_open_cmd = view.offset({
						width = math.floor(vim.o.columns * 0.45),
						height = math.floor(vim.o.lines * 0.95),
						w_offset = view.helpers.proportion(1),
						h_offset = view.helpers.proportion(0.1),
					}),
				},
			})
		end,
	},
}
