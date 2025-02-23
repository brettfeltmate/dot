return {
	"neogitorg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"ibhagwan/fzf-lua",
	},
    cmd = "Neogit",
	opts = {},
	config = function(_, opts)
		require("neogit").setup(opts)
	end,
}
