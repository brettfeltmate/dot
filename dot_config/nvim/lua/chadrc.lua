local M = {
	base46 = {
		theme = "amber",
		transparency = false,
		integrations = {
            "avante",
			"cmp",
            "dap",
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
			order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
		},
	},
	nvdash = { load_on_startup = false },
	lsp = { signature = false },
	mason = { cmd = true, pkgs = {} },
	colorify = { enabled = true, mode = "bg" },
}

return M
