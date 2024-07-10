return {
	"numToStr/FTerm.nvim",
	config = function()
		require("FTerm").setup({
			border = "rounded",
			auto_close = false,
			blend = 5,
			dimensions = {
				height = 0.4,
				width = 0.35,
				x = 0,
				y = 0.9,
			},
		})
	end,
}
