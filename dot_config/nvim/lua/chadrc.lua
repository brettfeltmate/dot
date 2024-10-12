local M = {
	base46 = {
		theme = "nightlamp",
		transparency = false,
		changed_themes = {
			nightlamp = {
				base_16 = {
					base00 = "#221f22",
					base01 = "#221d23",
					base02 = "#231f23",
					base03 = "#49504f",
					base04 = "#837972",
					base05 = "#c9bdb5",
					base06 = "#949b9f",
					base07 = "#afafb6",
					base08 = "#c8a89d",
					base09 = "#cda2bf",
					base0A = "#a7a0c4",
					base0B = "#bab2aa",
					base0C = "#e59a9a",
					base0D = "#96b59b",
					base0E = "#cdb796",
					base0F = "#906d93",
					-- base00 = "#231d23",
					-- base01 = "#262727",
					-- base02 = "#2c2631",
					-- base04 = "#32292e",
					-- base03 = "#cfe7cd",
					-- base05 = "#eae3c8",
					-- base06 = "#eadec6",
					-- base07 = "#e4decd",
					-- base08 = "#e5b2c4",
					-- base09 = "#e5bdb2",
					-- base0A = "#ecd5c5",
					-- base0B = "#ebdec9",
					-- base0C = "#e9e0c7",
					-- base0D = "#ecc5ce",
					-- base0E = "#bdc2dc",
					-- base0F = "#bae8d1",
				},
			},
		},
		integrations = {
			"cmp",
			"devicons",
			"git",
			"lsp",
			"mason",
			"nvimtree",
			"todo",
			"treesitter",
		},
	},
	ui = {
		cmp = {
			icons = true,
			lspkind_text = true,
			style = "default", -- default/flat_light/flat_dark/atom/atom_colored
		},

		-- lazyload it when there are 1+ buffers
		tabufline = {
			enabled = true,
			lazyload = true,
			order = { "treeOffset", "buffers", "tabs" },
			modules = nil,
		},
		statusline = {
			theme = "minimal",
			separator_style = "round",
			-- Default: "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor"
			order = nil,
			modules = nil,
		},
	},
	nvdash = {
		load_on_startup = true,

		header = {},

		buttons = {
			{ txt = "󱁾 Browse   ", keys = "󱁐 󰸤 󰯺", cmd = "Oil" },
			{ txt = "󱞋 Find     ", keys = "󱁐 󰰡 󰯺", cmd = "FzfLua files" },
			{ txt = "󰪻 Recent   ", keys = "󱁐 󰰡 󰰕", cmd = "FzfLua oldfiles" },
			{ txt = "󱂀 Config   ", keys = "󱁐 󰰡 󰯱", cmd = "ChezFzf" },
			{ txt = "󰥩 Grep     ", keys = "󱁐 󰰡 󰯽", cmd = "FzfLua live_grep" },
		},
	},

	lsp = { signature = true },

	cheatsheet = {
		theme = "simple", -- simple/grid
		excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
	},
	mason = { cmd = false, pkgs = {} },
	colorify = { enabled = false },

	term = {
		winopts = { number = false },
		sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
		float = {
			relative = "editor",
			row = 0.3,
			col = 0.25,
			width = 0.5,
			height = 0.4,
			border = "single",
		},
	},
}

return M
