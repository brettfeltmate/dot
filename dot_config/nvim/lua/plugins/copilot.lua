if true then
	return {}
end
return {
	"zbirenbaum/copilot.lua",
	lazy = true,
	event = "InsertEnter",
	opts = {
		panel = { layout = { position = "left", ratio = 0.3 } },
		suggestions = {
			enable = true,
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
