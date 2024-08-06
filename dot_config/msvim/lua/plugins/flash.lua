return {
	"folke/flash.nvim",
	event = "BufWinEnter",
	config = function()
		require("flash").setup({
			label = {
				rainbow = { enabled = false },
				style = "inline",
			},
			highlight = { backdrop = true },
		})
	end,
}
