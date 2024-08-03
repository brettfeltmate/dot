return {
	{
		"mvllow/modes.nvim",
		event = "BufRead",
		config = function()
			require("modes").setup()
		end,
	},
	{
		"uga-rosa/ccc.nvim",
		lazy = false,
		config = function()
			require("ccc").setup({
				auto_enable = true,
				lsp = true,
				highlight_mode = "virtual",
			})
		end,
	},
	{
		"brenoprata10/nvim-highlight-colors",
		lazy = false,
		config = function()
			require("nvim-highlight-colors").setup()
		end,
	},
	{
		"zenbones-theme/zenbones.nvim",
		lazy = false,
		dependencies = { "rktjmp/lush.nvim" },
	},
	{
		"sho-87/kanagawa-paper.nvim",
		lazy = false,
	},
}
