---@diagnostic disable: missing-fields
return {
	"OXY2DEV/markview.nvim",
	lazy = true,
	ft = { "markdown", "rmarkdown", "rmd", "quarto", "copilot-*" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.icons",
	},
	config = function()
		local presets = require("markview.presets")

		require("markview").setup({
			modes = { "n", "i", "no", "c" },
			hybrid_modes = { "i" },
			headings = presets.headings.glow,
			checkboxes = presets.checkboxes.nerd,
			horizontal_rules = presets.horizontal_rules.dotted,
			html = { enable = true },
			code_blocks = {
				icons = "mini",
				style = "language",
				language_direction = "right",
				pad_amount = 0,
				min_width = 80,
			},
		})
	end,
}
