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
		picker = { layout = { preset = "ivy_split" } },
		dashboard = {
			sections = {
				{ section = "header" },
				{
					gap = 1,
					padding = 1,
					{ icon = "󱞋 ", key = "b", desc = "Browse", action = ":Oil" },
					{ icon = "󰱽 ", key = "f", desc = "Find", action = ":lua require('snacks').picker.files()" },
					{ icon = "󰊢 ", key = "g", desc = "Grep", action = ":lua require('rgflow').open()" },
					{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
					{ icon = "󰩈 ", key = "q", desc = "Quit", action = ":qa" },
					{ icon = "󰁯 ", key = "r", desc = "Restore", section = "session" },
				},
				{ pane = 2, padding = 3 },
				{ pane = 2, section = "startup", padding = 3 },
				{
					pane = 2,
					icon = " ",
					title = "Recent (cwd)",
					cwd = true,
					section = "recent_files",
					indent = 3,
					height = 4,
					padding = 1,
					limit = 5,
				},
				{
					pane = 2,
					icon = " ",
					title = "Projects",
					section = "projects",
					indent = 3,
					padding = 1,
					limit = 5,
				},
			},
		},
	},
}
