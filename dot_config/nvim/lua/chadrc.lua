local M = {
	base46 = {
		theme = "amber",
		theme_toggle = { "amber", "blossom_light" },
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
			-- separator_style = "round",
			-- order = { "mode", "diagnostics", "git" },
		},
	},
	nvdash = { load_on_startup = false },
	lsp = { signature = false },
	mason = { cmd = true, pkgs = {} },
	colorify = { enabled = false, mode = "virtual" },
}

return M
