return {
	"gbprod/yanky.nvim",
	recommended = true,
	event = "BufWinEnter",
	config = function()
		require("yanky").setup({
			picker = {
				telescope = {
					use_default_mappings = false,
					mappigs = nil,
				},
			},
		})
	end,
}
