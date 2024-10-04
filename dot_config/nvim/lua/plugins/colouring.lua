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
			require("nvim-highlight-colors").setup({
				render = "virtual",
				virtual_symbol = "",
				virtual_symbol_prefix = "",
				virtual_symbol_suffix = " |",
			})
		end,
	},
	{
		"rktjmp/lush.nvim",
		lazy = true,
	},
	-- {
	-- 	"zenbones-theme/zenbones.nvim",
	-- 	-- Optionally install Lush. Allows for more configuration or extending the colorscheme
	-- 	-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
	-- 	-- In Vim, compat mode is turned on as Lush only works in Neovim.
	-- 	dependencies = "rktjmp/lush.nvim",
	-- 	lazy = true,
	-- 	config = true,
	-- },
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	lazy = true,
	-- 	config = true,
	-- },
	-- {
	-- 	"neanias/everforest-nvim",
	-- 	lazy = true,
	-- 	config = true,
	-- },
	-- {
	-- 	"EdenEast/nightfox.nvim",
	-- 	lazy = true,
	-- 	config = true,
	-- },
}
