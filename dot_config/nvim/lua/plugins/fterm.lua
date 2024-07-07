return {
	"numToStr/FTerm.nvim",
	config = function()
		require("FTerm").setup({
			auto_close = false,
			blend = 10,
			dimensions = {
				height = 0.5,
				width = 0.4,
				x = 1,
				y = 0.875,
			},
		})
	end,
}
