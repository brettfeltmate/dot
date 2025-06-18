return {
	{
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
	},
	{
		"sindrets/diffview.nvim",
		lazy = true,
		cmds = {
			"DiffviewOpen",
			"DiffviewFileHistory",
		},
		opts = {
			enhanced_diff_hl = true,
			view = {
				merge_tool = {
					layout = "diff3_mixed",
				},
			},
		},
	},
}
