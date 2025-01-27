return {
	"neogitorg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"ibhagwan/fzf-lua",
	},
	lazy = true,
	cmd = "Neogit",
	opts = {},
	config = function(_, opts)
        dofile(vim.g.base46_cache .. "diffview")
		dofile(vim.g.base46_cache .. "neogit")
		require("neogit").setup(opts)
	end,
}
