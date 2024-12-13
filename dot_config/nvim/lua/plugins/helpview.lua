return {
	"OXY2DEV/helpview.nvim",
	lazy = true,
	ft = "help",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("helpview").setup({
			modes = { "n", "i", "no", "c" },
		})
	end,
}
