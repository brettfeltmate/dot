return {
	"folke/flash.nvim",
	lazy = true,
	config = function()
		require("flash").setup({
			label = {
				rainbow = { enabled = false },
			},
			highlight = { backdrop = true },
		})
	end,
}
