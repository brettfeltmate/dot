return {
	{
		"folke/flash.nvim",
		event = "BufReadPost",
		config = function()
			require("flash").setup({
				label = {
					rainbow = { enabled = true, shade = 5 },
				},
			})
		end,
	},
	{
		"mrjones2014/smart-splits.nvim",
		lazy = false,
		config = function()
			require("smart-splits").setup()
		end,
	},
}
