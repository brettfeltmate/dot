return {
	"neogitorg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"ibhagwan/fzf-lua",
		-- {
		-- 	"sindrets/diffview.nvim",
		-- 	opts = { enhanced_diff_hl = true },
		-- },
	},
	cmd = "Neogit",
	opts = {
		graph_style = "ascii",
		disable_line_numbers = false,
		disable_relative_line_numbers = false,
		integrations = {
			snacks = false,
			mini_pick = false,
		},
	},
	config = function(_, opts)
		require("neogit").setup(opts)
	end,
}
