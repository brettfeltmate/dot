return {
	{
		"mvllow/modes.nvim",
		event = "InsertEnter",
		config = function()
			require("modes").setup()
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
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
	},
	{
		"mstcl/ivory",
		lazy = false,
	},
}
