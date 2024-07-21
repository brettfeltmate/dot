return {
	"folke/flash.nvim",
	event = "BufWinEnter",
	config = function()
		require("flash").setup({
			label = {
				rainbow = { enabled = true, shade = 5 },
			},
		})
	end,
}
