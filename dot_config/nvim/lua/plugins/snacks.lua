return {
	"folke/snacks.nvim",
	lazy = true,
	event = "VeryLazy",
	opts = {
		quickfile = { enabled = true },
		words = { enabled = true },
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
            }
        }
	},
}
