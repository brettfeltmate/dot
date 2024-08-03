return {
	"folke/flash.nvim",
	event = "BufWinEnter",
	config = function()
		require("flash").setup({
			label = {
				rainbow = { enabled = false },
			},
			highlight = { backdrop = true },
		})
	end,
}
