return {
	"folke/snacks.nvim",
	lazy = true,
	event = "VeryLazy",
	opts = {
		statuscolumn = {
			enabled = true,
			right = {},
			left = { "mark", "sign", "fold" },
			folds = { open = true, git_hl = false },
		},
		indent = { enabled = true, chunk = { enabled = true } },
		terminal = { win = { wo = { winbar = "" } } },
		scratch = {},
		picker = { ui_select = false, layout = { preset = "ivy" } },
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

					{ icon = " ", key = "n", desc = "New", action = ":ene | startinsert" },
                    { icon = "󰱽 ", key = "f", desc = "Find", action = ":FzfLua files" },
					{ icon = "󱎸 ", key = "g", desc = "Grep", action = ":FzfLua live_grep" },
					{ icon = " ", key = "o", desc = "Old", action = ":FzfLua oldfiles" },
					{ icon = "󰦄 ", key = "d", desc = "Dir", action = ":FzfLua zoxide" },
					{ icon = " ", key = "c", desc = "Config", action = ":ChezFzf" },
					{ icon = "󰁯 ", key = "r", desc = "Restore", section = "session" },
					{
						icon = "󰒲 ",
						key = "l",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = "󰩈 ", key = "q", desc = "Quit", action = ":qa" },
				},
				{ pane = 2, icon = " ", title = "Recent (cwd)", cwd = true, section = "recent_files", indent = 2, padding = 1, limit = 3 },
				{ pane = 2, icon = "󰪶 ", title = "Recent (all)", section = "recent_files", indent = 2, padding = 1, limit = 4 },
				{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1, limit = 3 },
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
