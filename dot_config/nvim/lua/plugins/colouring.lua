return {
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
				virtual_symbol = " ",
				virtual_symbol_prefix = "",
				virtual_symbol_suffix = "",
			})
		end,
	},
	{
		"rktjmp/lush.nvim",
		lazy = true,
	},
}
