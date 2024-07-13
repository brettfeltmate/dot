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
		event = "BufRead",
		config = function()
			require("ccc").setup({
				auto_enable = true,
				lsp = true,
				highlight_mode = "virtual",
			})
		end,
	},
	{
		"rktjmp/lush.nvim",
		lazy = true,
	},
	{
		"junegunn/seoul256.vim",
		lazy = true,
	},
	{
		"sainnhe/everforest",
		lazy = true,
		config = function()
			vim.g.everforest_enable_italic = true
		end,
	},
	{
		"ramojus/mellifluous.nvim",
		lazy = true,
		config = function()
			require("mellifluous").setup()
		end,
	},
	{
		"dgox16/oldworld.nvim",
		lazy = true,
		config = function()
			require("oldworld").setup({
				styles = { booleans = { italic = true, bold = true } },
			})
		end,
	},
	{
		"zenbones-theme/zenbones.nvim",
		lazy = true,
		dependencies = { "rktjmp/lush.nvim" },
	},
	{
		"comfysage/evergarden",
		lazy = true,
	},
	{
		"sonjiku/yawnc.nvim",
		lazy = true,
	},
	{
		"mellow-theme/mellow.nvim",
		lazy = true,
	},
	{
		"frenzyexists/aquarium-vim",
		lazy = true,
	},
	{
		"sho-87/kanagawa-paper.nvim",
		lazy = true,
	},
}
