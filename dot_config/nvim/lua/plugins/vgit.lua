return {
	"tanvirtin/vgit.nvim",
	event = "BufReadPre",
	opts = {
		settings = {
			live_blame = { enabled = false },
			live_gutter = { edge_navigation = false },
			signs = {
				definitions = {
					GitSignsAdd = { text = "" },
					GitSignsDelete = { text = "" },
					GitSignsChange = { text = "" },
				},
			},
		},
	},
}
