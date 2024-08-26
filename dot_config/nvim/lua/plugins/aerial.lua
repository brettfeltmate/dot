return {
	"stevearc/aerial.nvim",
	config = function()
		require("aerial").setup({
			autojump = true,
			show_guides = true,
		})
	end,
}
