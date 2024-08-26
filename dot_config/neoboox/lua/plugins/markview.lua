return {
	"OXY2DEV/markview.nvim",
  lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.icons",
	},
	config = function()
		require("markview").setup()
	end,
}
