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
		cmp = {
			icons = true,
			lspkind_text = true,
			style = "default",
		},
		tabufline = {
			enabled = true,
			lazyload = true,
			order = { "treeOffset", "buffers", "tabs" },
		},
		statusline = {
			theme = "minimal",
			separator_style = "round",
			order = { "mode", "diagnostics", "%=", "git", "%=", "file", "cwd" },
		},
	},
	nvdash = { load_on_startup = false },
	lsp = { signature = false },
	mason = { cmd = true, pkgs = {} },
	colorify = { enabled = true, mode = "virtual" },
}

return M
