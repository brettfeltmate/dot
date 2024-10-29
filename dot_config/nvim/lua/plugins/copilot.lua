return {
	"zbirenbaum/copilot.lua",
	lazy = true,
	event = "BufReadPre",
	opts = {
		panel = { layout = { position = "left", ratio = 0.3 } },
		suggestions = {
			enable = true,
			auto_trigger = true,
			keymap = {
				accept = "<M-l>",
				next = "<M-j>",
				prev = "<M-k>",
				dismiss = "<M-h>",
			},
		},
		filetypes = { markdown = true },
	},
}
