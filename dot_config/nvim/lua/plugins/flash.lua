return {
	"folke/flash.nvim",
	event = "BufReadPost",
	config = function()
		require("flash").setup({
			label = {
				rainbow = { enabled = true, shade = 5 },
			},
		})
	end,
}
