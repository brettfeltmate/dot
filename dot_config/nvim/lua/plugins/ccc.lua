return {
	"uga-rosa/ccc.nvim",
	lazy = true,
	-- cmd = "CccPick",
	event = "VeryLazy",
	opts = function()
		local ccc = require("ccc")
		return {
			bar_len = 50,
			inputs = {
				ccc.input.rgb,
				ccc.input.oklch,
				ccc.input.okhsl,
				ccc.input.okhsv,
			},
			highlighter = {
				auto_enable = true,
				lsp = true,
			},
			highlight_mode = "bg",
		}
	end,
}
