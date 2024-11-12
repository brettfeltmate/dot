return {
	{
		"mvllow/modes.nvim",
		lazy = true,
		event = "UIEnter",
		config = function()
			require("modes").setup({
				colors = {
                    bg = "#221d23",
                    copy = "#74607e",
					delete = "#7d4e53",
					insert = "#55645b",
                    visual = "#897653",
				},
			})
		end
	},
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
					ccc.input.hwb,
					ccc.input.cmyk,
					ccc.input.oklab,
					ccc.input.oklch,
					ccc.input.okhsl,
					ccc.input.okhsv,
				},
			}
		end,
	},
	{ "rktjmp/lush.nvim", lazy = true },
}
