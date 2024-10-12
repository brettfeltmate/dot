return {
	"yetone/avante.nvim",
	lazy = true,
	event = "BufReadPre",
	build = "make",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"echasnovski/mini.icons",
		"oxy2dev/markview.nvim",
	},
	config = function()
		require("avante").setup({ behaviour = { auto_suggestions = false } })
	end,
}
