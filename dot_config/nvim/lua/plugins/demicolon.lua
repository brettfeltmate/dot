return {
	"mawkler/demicolon.nvim",
	lazy = true,
	event = "VeryLazy",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	opts = {
		disabled_keys = { "I", "i" },
	},
}
