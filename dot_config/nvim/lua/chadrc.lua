local M = {
	base46 = {
		theme = "amber",
		theme_toggle = { "amber", "everforest_light" },
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
			order = { "buffers", "tabs" },
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
	colorify = { enabled = true, mode = "virtual" },
}

return M
