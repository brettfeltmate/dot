return {
	{
		"mvllow/modes.nvim",
		event = "BufReadPre",
		config = function()
			require("modes").setup({
				colors = {
					bg = "#493c46",
					copy = "#ccb29c",
					delete = "#c799a2",
					insert = "#74b097",
					visual = "#a7a6e0",
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
			require("nvim-highlight-colors").setup()
		end,
	},
	{
		"rktjmp/lush.nvim",
		lazy = true,
	},
}
