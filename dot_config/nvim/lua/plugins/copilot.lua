return {
	"zbirenbaum/copilot.lua",
	lazy = true,
	event = "BufRead",
	enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	opts = {
		panel = { enabled = false },
		suggestion = {
			enabled = true,
			auto_trigger = true,
			hide_during_completion = true,
			debounce = 75,
			keymap = {
				accept = "<M-l>",
				accept_word = "<M-w>",
				accept_line = "<M-y>",
				next = "<M-j>",
				prev = "<M-k>",
				dismiss = "<M-h>",
			},
		},
	},
}
