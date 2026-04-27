local M = {
	base46 = {
		theme = "rich",
		theme_toggle = { "rich", "penumbra_light" },
		transparency = false,
		integrations = {
			"avante",
			"cmp",
			"devicons",
			"diffview",
			"git",
			"leap",
			"lsp",
			"markview",
			"mason",
			"neogit",
			"treesitter",
		},
	},
	ui = {
		tabufline = {
			enabled = true,
			lazyload = true,
			order = { "treeOffset", "buffers", "tabs", "btns" },
			modules = nil,
			bufwidth = 21,
		},
		statusline = {
			theme = "vscode_colored",
			order = {
				"mode",
				"file",
				"diagnostics",
				"lsp_msg",
				-- "cursor",
				"%=",
				"%=",
				"git",
				"cwd",
				-- "lsp",
			},
		},
	},
	nvdash = { load_on_startup = false },
	lsp = { signature = false },
	mason = { cmd = true, pkgs = {} },
	colorify = { enabled = true, mode = "virtual" },
}

return M
