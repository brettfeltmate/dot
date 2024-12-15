return {
	{
		"aileot/emission.nvim",
		lazy = true,
		event = { "BufRead", "BufReadPre", "BufNewFile" },
		opts = {
			highlight = { duration = 200 },
			added = { hl_map = { fg = "#000000", bg = "#9fbfaa" } },
			removed = { hl_map = { fg = "#000000", bg = "#bf8f94" } },
		},
	},
	{
		"uga-rosa/ccc.nvim",
		lazy = true,
		cmd = "CccPick",
		opts = function()
			local ccc = require("ccc")
			return {
				bar_len = 50,
				inputs = { ccc.input.oklab, ccc.input.oklch, ccc.input.okhsl, ccc.input.okhsv },
			}
		end,
	},
}
