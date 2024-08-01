return {
	"stevearc/aerial.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.icons",
	},
	config = function()
		require("aerial").setup({})
	end,
}
