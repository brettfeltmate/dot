return {
	"OXY2DEV/markview.nvim",
	lazy = true,
	ft = { "markdown", "md", "rmd", "rmarkdown", "Avante", "avante" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.icons",
	},
	config = function()
		local presets = require("markview.presets")

		require("markview").setup({
			modes = { "n", "i", "no", "c" },
			hybrid_modes = { "i", "n" },
			headings = presets.headings.glow,
			checkboxes = presets.checkboxes.nerd,
			horizontal_rules = presets.horizontal_rules.double,
			html = { enable = true },
			code_blocks = {
                icons = "mini",
				style = "language",
				language_direction = "left",
			},
		})
	end,
}
