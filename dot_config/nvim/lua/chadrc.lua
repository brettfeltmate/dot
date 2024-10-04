local M = {
	base46 = {
		theme = "nightlamp",
		transparency = true,
		changed_themes = {
			nightlamp = {
				base_16 = {
					base00 = "#272427",
					base01 = "#312931",
					base02 = "#3e3544",
					base04 = "#574850",
					base03 = "#6e646c",
					base05 = "#c5bfab",
					base06 = "#d5ccbb",
					base07 = "#e0d6bd",
					base08 = "#cebbd1",
					base09 = "#c18c7e",
					base0A = "#ccb29c",
					base0B = "#b5aeb0",
					base0C = "#a7a6e0",
					base0D = "#c19fa6",
					base0E = "#afbdd6",
					base0F = "#a9c9bf",
				},
			},
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
			order = { "buffers", "tabs" },
			modules = nil,
		},
		statusline = {
			theme = "minimal", -- default/vscode/vscode_colored/minimal
			-- default/round/block/arrow separators work only for default statusline theme
			-- round and block will work for minimal theme only
			separator_style = "round",
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
		theme = "grid", -- simple/grid
		excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
	},
	mason = { cmd = true, pkgs = {} },
	colorify = { enabled = false },
}

return M
