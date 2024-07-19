return {
	"gbprod/yanky.nvim",
	recommended = true,
	event = "BufReadPre",
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
