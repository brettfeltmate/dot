return {
	"you-n-g/navigate-note.nvim",
	lazy = true,
	event = { "BufRead", "BufNewFile", "BufReadPre" },
	opts = {
		filename = "nav.md",
		width = 0.4,
		keymaps = {
			nav_mode = {
				next = "<m-f>",
				prev = "<m-b>",
				open = "<m-cr>",
				switch_back = "<m-space>",
				append_link = "<m-a>",
				jump_mode = "<m-m>",
			},
			add = "<m-a>",
			open_nav = "<m-space>",
		},
		context_line_count = {
			tab = 2,
			vline = 3,
		},
	},
}
