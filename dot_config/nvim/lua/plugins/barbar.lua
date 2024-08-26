return {
	"romgrk/barbar.nvim",
	event = "UIEnter",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	config = function()
		require("barbar").setup({
			icons = {
				buffer_index = true,
				preset = "slanted",
			},
			sidebar_filetypes = {
				NeoTree = true,
			},
		})
	end,
}
