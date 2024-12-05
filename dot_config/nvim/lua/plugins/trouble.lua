return {
	"folke/trouble.nvim",
	lazy = true,
	cmd = "Trouble",
	opts = {
		focus = true,
		modes = {
			preview_float = {
				mode = "diagnostics",
				preview = {
					type = "float",
					relative = "editor",
					border = "rounded",
					title = "Preview",
					title_pos = "center",
					position = { 0, -2 },
					size = { width = 0.3, height = 0.3 },
					zindex = 200,
				},
			},
			test = {
				mode = "diagnostics",
				preview = {
					type = "split",
					relative = "win",
					position = "right",
					size = 0.3,
				},
			},
			symbols = {
				desc = "document symbols",
				mode = "lsp_document_symbols",
				focus = true,
				win = { position = "left", width = 50 },
			},
		},
	}, -- for default options, refer to the configuration section for custom setup.
}
