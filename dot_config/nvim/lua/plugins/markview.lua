---@diagnostic disable: missing-fields
return {
	"OXY2DEV/markview.nvim",
	lazy = true,
	ft = { "codecompanion", "markdown", "md", "rmd", "rmarkdown", "qmd", "quarto", "Avante", "avante", "copilot-*" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.icons",
	},
	config = function()
		dofile(vim.g.base46_cache .. "markview")
		local presets = require("markview.presets")
		require("markview.extras.editor").setup({
            width = { 80, 120 },
			height = { 10, 20 },
			debounce = 50,
			callback = function(buf, win) end,
		})

		require("markview").setup({
			modes = { "n", "i", "no", "c" },
			hybrid_modes = { "i", "n" },
			headings = presets.headings.glow,
			checkboxes = presets.checkboxes.nerd,
			horizontal_rules = presets.horizontal_rules.dotted,
			html = { enable = true },
			code_blocks = {
				icons = "mini",
				style = "language",
				language_direction = "right",
                pad_amount = 1,
                min_width = 80,
			},
		})
	end,
}
