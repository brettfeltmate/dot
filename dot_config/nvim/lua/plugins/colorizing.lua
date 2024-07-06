return {
	{
		"rktjmp/lush.nvim",
	},
	{
		"Iron-E/nvim-highlite",
		config = function()
			require("highlite").setup()
		end,
	},
	{
		"junegunn/seoul256.vim",
	},
	{
		"sainnhe/everforest",
		lazy = false,
		config = function()
			vim.g.everforest_enable_italic = true
		end,
	},
	{
		"ramojus/mellifluous.nvim",
		config = function()
			require("mellifluous").setup()
		end,
	},
	{
		"dgox16/oldworld.nvim",
		config = function()
			require("oldworld").setup({
				styles = { booleans = { italic = true, bold = true } },
			})
		end,
	},
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = { "rktjmp/lush.nvim" },
	},
	{
		"comfysage/evergarden",
	},
	{
		"sonjiku/yawnc.nvim",
	},
	{
		"mellow-theme/mellow.nvim",
	},
	{
		"yazeed1s/oh-lucy.nvim",
	},
	{
		"frenzyexists/aquarium-vim",
	},
	{
		"sho-87/kanagawa-paper.nvim",
	},
}
