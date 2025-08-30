return {
	"mrjones2014/smart-splits.nvim",
	event = "VeryLazy",
	build = "./kitty/install-kittens.bash",
	opts = {},
	config = function(_, opts)
		require("smart-splits").setup(opts)
	end,
}
