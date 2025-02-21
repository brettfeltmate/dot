---@diagnostic disable: missing-fields
return {
	"OXY2DEV/markview.nvim",
    event = "UIEnter",
	ft = { "markdown", "rmarkdown", "rmd", "quarto", "copilot-*", "avante", "codecompanion" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.icons",
	},
	config = function()
		local presets = require("markview.presets")

		require("markview").setup({
			preview = {
				filetypes = { "markdown", "md", "rmarkdown", "rmd", "quarto", "qmd", "codecompanion" },
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
				},
				checkboxes = {

					enable = true,

					checked = { text = "󰗠", hl = "MarkviewCheckboxChecked", scope_hl = "MarkviewCheckboxChecked" },
					unchecked = {
						text = "󰄰",
						hl = "MarkviewCheckboxUnchecked",
						scope_hl = "MarkviewCheckboxUnchecked",
					},

					["/"] = { text = "󱎖", hl = "MarkviewCheckboxPending" },
					[">"] = { text = "", hl = "MarkviewCheckboxCancelled" },
					["<"] = { text = "󰃖", hl = "MarkviewCheckboxCancelled" },
					["-"] = { text = "󰍶", hl = "MarkviewCheckboxCancelled", scope_hl = "MarkviewCheckboxStriked" },

					["?"] = { text = "󰋗", hl = "MarkviewCheckboxPending" },
					["!"] = { text = "󰀦", hl = "MarkviewCheckboxUnchecked" },
					["*"] = { text = "󰓎", hl = "MarkviewCheckboxPending" },
					['"'] = { text = "󰸥", hl = "MarkviewCheckboxCancelled" },
					["l"] = { text = "󰆋", hl = "MarkviewCheckboxProgress" },
					["b"] = { text = "󰃀", hl = "MarkviewCheckboxProgress" },
					["i"] = { text = "󰰄", hl = "MarkviewCheckboxChecked" },
					["S"] = { text = "", hl = "MarkviewCheckboxChecked" },
					["I"] = { text = "󰛨", hl = "MarkviewCheckboxPending" },
					["p"] = { text = "", hl = "MarkviewCheckboxChecked" },
					["c"] = { text = "", hl = "MarkviewCheckboxUnchecked" },
					["f"] = { text = "󱠇", hl = "MarkviewCheckboxUnchecked" },
					["k"] = { text = "", hl = "MarkviewCheckboxPending" },
					["w"] = { text = "", hl = "MarkviewCheckboxProgress" },
					["u"] = { text = "󰔵", hl = "MarkviewCheckboxChecked" },
					["d"] = { text = "󰔳", hl = "MarkviewCheckboxUnchecked" },
				},
			},
		})
	end,
}
