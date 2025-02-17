return {
	"neogitorg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"ibhagwan/fzf-lua",
	},
    event = "VeryLazy",
	opts = {},
	config = function(_, opts)
		require("neogit").setup(opts)
	end,
}
