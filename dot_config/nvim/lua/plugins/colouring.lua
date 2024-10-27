return {
	{
		"mvllow/modes.nvim",
		lazy = true,
		event = "BufReadPre",
		config = function()
			require("modes").setup({
				colors = {
					bg = "#352f39",
					copy = "#a7a75a",
					delete = "#7e4c54",
					insert = "#4c7f58",
					visual = "#6941be",
				},
			})
		end,
	},
	{
		"uga-rosa/ccc.nvim",
		lazy = true,
		cmd = "CccPick",
		config = function()
			require("ccc").setup()
		end,
	},
	{
		"brenoprata10/nvim-highlight-colors",
		event = "BufReadPre",
		config = function()
			require("nvim-highlight-colors").setup({
				render = "virtual",
				virtual_symbol = "",
				virtual_symbol_prefix = "",
				virtual_symbol_suffix = " ",
			})
		end,
	},
	{
		"rktjmp/lush.nvim",
		lazy = true,
	},
}
