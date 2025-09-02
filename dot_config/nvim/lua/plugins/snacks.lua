return {
	"folke/snacks.nvim",
	dependencies = { "echasnovski/mini.icons" },
	enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	priority = 1000,
	opts = {
		styles = { scratch = { width = 0.6, height = 0.95 } },
		bigfile = { enabled = false },
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
		picker = {
			prompt = "   ",
			-- layout = { preset = "ivy_split" },
			layouts = {
				ivy_split = {
					preview = false,
					layout = { height = 0.5 },
				},
				ivy = {
					layout = {
						preview = false,
						height = 0.5,
					},
				},
				dropdown = {
					layout = {
						backdrop = true,
						row = 0.1,
						width = 0.5,
						min_width = 80,
						height = 0.8,
						border = "none",
						box = "vertical",
						{ win = "preview", title = "{preview}", height = 0.65, border = "rounded" },
						{
							box = "vertical",
							border = "none",
							title = "{title} {live} {flags}",
							-- title_pos = "top",
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list", border = "bottom" },
						},
					},
				},
			},
			matcher = {
				fuzzy = true, -- use fuzzy matching
				smartcase = true, -- use smartcase
				ignorecase = true, -- use ignorecase
				sort_empty = false, -- sort results when the search string is empty
				filename_bonus = true, -- give bonus for matching file names (last part of the path)
				file_pos = false, -- support patterns like `file:line:col` and `file:line`
				cwd_bonus = true, -- give bonus for matching files in the cwd
				frecency = true, -- frecency bonus
				history_bonus = true, -- give more weight to chronological order
			},
			ui_select = true, -- replace `vim.ui.select` with the snacks picker
			formatters = {
				file = {
					filename_first = true, -- display filename before the file path
					truncate = 10, -- truncate the file path to (roughly) this length
					filename_only = true, -- only show the filename
					icon_width = 2, -- width of the icon (in characters)
					git_status_hl = true, -- use the git status highlight group for the filename
				},
			},
			sources = {
				files = { layout = { preset = "dropdown" } },
				lines = { layout = { preview = false, preset = "ivy" } },
				smart = { layout = { preset = "dropdown" } },
				buffers = { layout = { preset = "dropdown" } },
				help = { layout = { preset = "dropdown" } },
				grep = { layout = { preset = "ivy", preview = false } },
				grep_buffers = { layout = { preset = "ivy", preview = false } },
				grep_word = { layout = { preset = "ivy", preview = false } },
				lsp_symbols = {
					layout = { preset = "right" },
					filter = { default = true },
					tree = false,
				},
			},
			-- layout = { preset = "dropdown" },
		},
		words = {},
		input = {},
		-- notifier = {
		-- 	style = "fancy",
		-- 	top_down = false,
		-- },
		scratch = {},
		quickfile = {},
		zen = {},
		dashboard = {
			sections = {
				{ section = "header" },
				{
					gap = 1,
					padding = 1,
					{ icon = "󱞋 ", key = "b", desc = "Browse", action = ":Oil" },
					{ icon = "󰱽 ", key = "f", desc = "Find", action = ":lua Snacks.picker.files()" },
					{ icon = "󰊢 ", key = "g", desc = "Git", action = ":Git" },
					{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
					{ icon = "󰒺 ", key = "p", desc = "Projects", action = ":lua Snacks.picker.projects()" },
					{ icon = "󰩈 ", key = "q", desc = "Quit", action = ":qa" },
					{ icon = "󰁯 ", key = "r", desc = "Restore", section = "session" },
					{ icon = "󱎸 ", key = "s", desc = "Search", action = ":lua Snacks.picker.grep()" },
				},
				{ section = "startup" },
				{
					pane = 2,
					section = "terminal",
					cmd = "colorscript -e fade",
					height = 7,
					padding = 1,
				},
				{
					pane = 2,
					icon = " ",
					title = "Recent (cwd)",
					cwd = true,
					section = "recent_files",
					indent = 3,
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
