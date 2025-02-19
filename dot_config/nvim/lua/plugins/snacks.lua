return {
	"folke/snacks.nvim",
	opts = {
		statuscolumn = {
			enabled = true,
			right = {},
			left = { "mark", "sign", "fold" },
			folds = { open = true, git_hl = false },
		},
		image = { enabled = true },
		input = {
            enabled = true,
            relative = "cursor",
            row = -3,
            col = 0,
        },
		indent = { enabled = true, chunk = { enabled = true } },
		terminal = { win = { wo = { winbar = "" } } },
		scratch = {},
		scroll = { enabled = true },
		picker = {
			ui_select = false,
			layout = { preset = "ivy" },
			layouts = {
				vertical = {
					layout = {
						backdrop = false,
						width = 0.4,
						min_width = 80,
						height = 0.8,
						min_height = 30,
						box = "vertical",
						border = "none",
						title = "Images",
						title_pos = "center",
						{
							win = "preview",
							height = 0.8,
							border = { " ", "─", " ", " ", " ", "─", " ", " " },
							-- border = "single",
						},
						{ win = "input", height = 1, border = "none" },
						{ win = "list", border = { " ", "─", " ", " ", " ", "─", " ", " " } },
					},
				},
			},
		},
		dim = {},
		dashboard = {
			sections = {
				{ section = "header" },
				{
					pane = 2,
					section = "terminal",
					cmd = "colorscript -e 24",
					height = 7,
					padding = 1,
				},
				{
					gap = 1,
					padding = 1,

					{ icon = "󰱽 ", key = "f", desc = "Find", action = ":FzfLua files" },
					{ icon = "󱎸 ", key = "g", desc = "Grep", action = ":FzfLua live_grep" },
					{ icon = " ", key = "d", desc = "Dots", action = ":ChezFzf" },
					{ icon = "󰦄 ", key = "c", desc = "Cwd", action = ":FzfLua zoxide" },
					{ icon = "󰁯 ", key = "r", desc = "Restore", section = "session" },
					{ icon = " ", key = "n", desc = "Neogit", action = ":Neogit" },
					{
						icon = "󰒲 ",
						key = "l",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = "󰩈 ", key = "q", desc = "Quit", action = ":qa" },
				},
				{
					pane = 2,
					icon = " ",
					title = "Recent (cwd)",
					cwd = true,
					section = "recent_files",
					indent = 2,
					padding = 1,
					limit = 4,
				},
				{
					pane = 2,
					icon = "󰪶 ",
					title = "Recent (all)",
					section = "recent_files",
					indent = 2,
					padding = 1,
					limit = 4,
				},
				{
					pane = 2,
					icon = " ",
					title = "Projects",
					section = "projects",
					indent = 2,
					padding = 1,
					limit = 4,
				},
				{
					pane = 2,
					icon = "󰊢 ",
					title = "Git Status",
					section = "terminal",
					enabled = function()
						return Snacks.git.get_root() ~= nil
					end,
					cmd = "git status --short --branch --renames",
					height = 5,
					padding = 1,
					ttl = 5 * 60,
					indent = 3,
				},
				{ section = "startup" },
			},
		},
	},
}
