return {
	"stevearc/aerial.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim_tree/nvim-web-devicons",
		-- "echasnovski/mini.icons",
	},
	config = function()
		require("aerial").setup({})
	end,
}
