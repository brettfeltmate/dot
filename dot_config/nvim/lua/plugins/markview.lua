---@diagnostic disable: missing-fields
return {
	"OXY2DEV/markview.nvim",
	lazy = true,
	ft = { "markdown", "rmarkdown", "rmd", "quarto", "copilot-*", "avante", "codecompanion" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.icons",
	},
	config = function()
		local presets = require("markview.presets")

		require("markview").setup({
			preview = {
				filetypes = { "md", "rmd", "quarto", "codecompanion" },
				modes = { "n", "no", "c", "v", "i" },
				hybrid_modes = { "v", "i" },
				icon_provider = "mini",
			},
			markdown = {
				horizontal_rules = presets.horizontal_rules.double,
				tables = presets.tables.rounded,
				code_blocks = {
					min_width = 80,
					pad_amount = 0,
				},
			},
		})
	end,
}
