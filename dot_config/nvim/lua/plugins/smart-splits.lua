return {
	"mrjones2014/smart-splits.nvim",
	lazy = true,
	event = "UIEnter",
	config = function()
		require("smart-splits").setup()
	end,
}
