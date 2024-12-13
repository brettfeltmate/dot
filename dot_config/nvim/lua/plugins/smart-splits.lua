return {
	"mrjones2014/smart-splits.nvim",
	lazy = true,
	event = "UIEnter",
	opts = {},
	config = function(_, opts)
		require("smart-splits").setup(opts)
	end,
}
