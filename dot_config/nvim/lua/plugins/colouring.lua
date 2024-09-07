return {
	{
		"mvllow/modes.nvim",
		event = "BufReadPre",
		config = function()
			require("modes").setup()
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
