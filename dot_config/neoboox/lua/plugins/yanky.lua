return {
	"gbprod/yanky.nvim",
	recommended = true,
	event = "UIEnter",
	config = function()
		require("yanky").setup({
			picker = {
				telescope = {
					use_default_mappings = false,
					mappings = nil,
				},
			},
		})
	end,
}
