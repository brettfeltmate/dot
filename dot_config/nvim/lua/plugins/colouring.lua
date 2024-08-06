return {
	{
		"mvllow/modes.nvim",
		event = "UIEnter",
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
		event = "UIEnter",
		config = function()
			require("nvim-highlight-colors").setup()
		end,
	},
	{
		"rktjmp/lush.nvim",
		lazy = true,
	},
}
