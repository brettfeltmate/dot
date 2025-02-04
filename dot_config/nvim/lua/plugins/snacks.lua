return {
	"folke/snacks.nvim",
	lazy = true,
	event = "VeryLazy",
	opts = {
		statuscolumn = {
			enabled = true,
			right = { "git" },
			left = { "mark", "sign", "fold" },
			folds = { open = true, git_hl = false },
		},
		indent = { enabled = true, chunk = { enabled = true } },
		terminal = { win = { wo = { winbar = "" } } },
	},
}
