return {
	{
		"mvllow/modes.nvim",
		lazy = true,
		event = "BufRead",
		opts = {
			colors = { copy = "#74607e", delete = "#7d4e53", insert = "#55645b", visual = "#897653" },
			opacity = 0.2,
		},
	},
	{
		"aileot/emission.nvim",
        lazy = true,
		event = "BufRead",
		opts = {
            highlight = { duration = 200 },
            added = { hl_map = {fg = "#bfaa8c", bg = "#8996ab"}},
            removed = { hl_map = { fg = "#bfaa8c", bg = "#b38098"}}
        },
	},
	{
		"uga-rosa/ccc.nvim",
		lazy = true,
		event = "BufRead",
		opts = function()
			local ccc = require("ccc")
			return {
				bar_len = 50,
				inputs = { ccc.input.oklab, ccc.input.oklch, ccc.input.okhsl, ccc.input.okhsv },
				highlighter = { auto_enable = true, lsp = true },
			}
		end,
	},
	{
		"eero-lehtinen/oklch-color-picker.nvim",
		lazy = true,
		cmd = "ColorPickOklch",
		opts = {},
	},
}
