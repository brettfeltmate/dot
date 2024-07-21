return {
	"numToStr/FTerm.nvim",
	event = "BufWinEnter",
	config = function()
		require("FTerm").setup({
			border = "rounded",
			auto_close = false,
			blend = 0,
			dimensions = {
				height = 0.4,
				width = 0.5,
				x = 0,
				y = 0.9,
			},
		})
	end,
}
