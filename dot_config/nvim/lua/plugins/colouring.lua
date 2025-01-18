return {
	{
		"mvllow/modes.nvim",
		event = "BufReadPre",
		config = function()
			require("modes").setup({
				colors = {
					copy = "#bfaa8c",
					delete = "#bf8080",
					insert = "#9fbfaa",
					visual = "#afafb6",
				},
			})
		end,
	},
	-- {
	--        "aileot/emission.nvim",
	--        lazy = true,
	-- 	event = { "BufRead", "BufReadPre", "BufNewFile" },
	-- 	opts = {
	-- 		highlight = { duration = 100 },
	-- 		added = { hl_map = { fg = "#000000", bg = "#9fbfaa" } },
	-- 		removed = { hl_map = { fg = "#000000", bg = "#bf8f94" } },
	-- 	},
	-- },
	{
		"uga-rosa/ccc.nvim",
		lazy = true,
		cmd = "CccPick",
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
			}
		end,
	},
}
