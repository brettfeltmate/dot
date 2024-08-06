return {
	"stevearc/aerial.nvim",
	lazy = true,
	config = function()
		require("aerial").setup({
			autojump = true,
			show_guides = true,
		})
	end,
}
