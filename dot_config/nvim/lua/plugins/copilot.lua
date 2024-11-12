return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	opts = {
		panel = { enabled = true },
		suggestion = {
			enabled = true,
			auto_trigger = true,
			hide_during_completion = true,
			keymap = {
				accept = "<M-l>",
				next = "<M-j>",
				prev = "<M-k>",
				dismiss = "<M-h>",
			},
		},
		filetypes = { markdown = true, help = true },
	},
}
