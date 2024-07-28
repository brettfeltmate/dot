return {
	"numToStr/FTerm.nvim",
	event = "BufWinEnter",
	config = function()
		require("FTerm").setup({
			border = "single",
			auto_close = false,
			blend = 5,
			dimensions = {
				height = 0.5,
				width = 0.6,
				x = 0,
				y = 1,
			},
		})
	end,
}
