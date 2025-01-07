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
		indent = {
			enabled = true,
			chunk = {
				enabled = true,
				char = {
					arrow = ">",
					horizontal = "─",
					vertical = "│",
					corner_top = "╭",
					corner_bottom = "╰",
				},
			},
		},
		-- scroll = {
		-- 	enabled = true,
		-- 	animate = {
		-- 		duration = { step = 15, total = 200 },
		-- 		easing = "linear",
		-- 	},
		-- },
	},
}
