---@diagnostic disable: missing-fields
return {
	"OXY2DEV/markview.nvim",
	ft = { "markdown", "rmd", "quarto", "copilot-*", "codecompanion" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.icons",
	},
	config = function()
		local presets = require("markview.presets")
		require("markview.extras.editor").setup()

		require("markview").setup({
			preview = {
				filetypes = { "chat", "markdown", "md", "rmarkdown", "rmd", "quarto", "qmd", "codecompanion" },
				modes = { "n", "no", "c", "v", "i" },
				hybrid_modes = { "v", "i" },
				icon_provider = "mini",
			},
			markdown = {
				horizontal_rules = presets.horizontal_rules.double,
				tables = presets.tables.rounded,
				code_blocks = {
					min_width = 70,
					pad_amount = 0,
					label_direction = "left",
				},
				headings = presets.headings.marker,
				checkboxes = {
					enable = true,
					checked = { text = "󰗠", hl = "MarkviewCheckboxChecked", scope_hl = "MarkviewCheckboxChecked" },
					unchecked = {
						text = "󰄰",
						hl = "MarkviewCheckboxUnchecked",
						scope_hl = "MarkviewCheckboxUnchecked",
					},
				},
			},
		})
	end,
}
