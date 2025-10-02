return {
	"folke/snacks.nvim",
	dependencies = { "echasnovski/mini.icons" },
	enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	priority = 1000,
	opts = {
		scratch = {
			win = {
				style = "scratch",
				border = "single",
				height = 0.9,
				width = 0.65,
				backdrop = { transparent = false },
			},
			ft = function()
				if vim.bo.buftype == "" and vim.bo.filetype ~= "" then
					if vim.bo.filetype == "rmd" then
						return "r"
					end
					return vim.bo.filetype
				end
				return "markdown"
			end,
		},
		image = {
			docs = { inline = true },
			img_dirs = {
				"fig",
				"figs",
				"figure",
				"figures",
				"out",
				"output",
				"outputs",
				"img",
				"images",
				"assets",
				"static",
				"public",
				"media",
				"attachments",
			},
		},
		picker = { layout = { preset = "dropdown" } },
		dashboard = {
			sections = {
				{ section = "header" },
				{
					gap = 1,
					padding = 1,
					{ icon = "󱞋 ", key = "b", desc = "Browse", action = "lua require('oil').open_float()" },
					{ icon = "󰱽 ", key = "f", desc = "Find", action = ":FFFFind" },
					{ icon = "󰊢 ", key = "g", desc = "Git", action = ":tab Git" },
					{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
					{ icon = "󰩈 ", key = "q", desc = "Quit", action = ":qa" },
					{ icon = "󰁯 ", key = "r", desc = "Restore", section = "session" },
					{ icon = "󱎸 ", key = "s", desc = "Search", action = "lua require('rgflow').open()" },
				},
				{ pane = 2, section = "startup", padding = 7 },
				-- {
				-- 	pane = 2,
				-- 	section = "terminal",
				-- 	cmd = "colorscript -e fade",
				-- 	height = 7,
				-- 	padding = 1,
				-- },
				{
					pane = 2,
					icon = " ",
					title = "Recent (cwd)",
					cwd = true,
					section = "recent_files",
					indent = 3,
					height = 4,
					padding = 1,
					limit = 4,
				},
				{
					pane = 2,
					icon = " ",
					title = "Projects",
					section = "projects",
					indent = 3,
					padding = 1,
					limit = 4,
				},
				{
					pane = 2,
					icon = " ",
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
			},
		},
	},
}
