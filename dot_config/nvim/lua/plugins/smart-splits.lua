return {
	"mrjones2014/smart-splits.nvim",
	event = "UIEnter",
	config = function()
		require("smart-splits").setup()
	end,
}
