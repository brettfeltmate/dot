return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	opts = {
		panel = { layout = { position = "left", ratio = 0.3 } },
		suggestions = {
			auto_trigger = true,
			keymap = {
				accept = "<A-l>",
				next = "<A-]>",
				prev = "<A-[>",
				dismiss = "<C-e>",
			},
		},
		filetypes = { markdown = true },
	},
}
