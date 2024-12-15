return {
	"folke/snacks.nvim",
	lazy = true,
	event = "VeryLazy",
	opts = {
		styles = {
			git = { width = 0.2, height = 0.2 },
		},
		statuscolumn = {
			enabled = true,
			right = { "git" },
			left = { "mark", "sign", "fold" },
			folds = {
				open = true,
				git_hl = false,
			},
		},
		indent = {
			enabled = true,
			chunk = {
				enabled = true,
				char = {
					corner_top = "╭",
					corner_bottom = "╰",
					horizontal = "─",
					vertical = "│",
					arrow = ">",
				},
			},
		},
	},
}
