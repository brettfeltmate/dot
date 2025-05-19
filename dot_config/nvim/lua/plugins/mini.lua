return {
	"echasnovski/mini.nvim",
	event = "VeryLazy",
	config = function()
		require("mini.ai").setup()
		require("mini.basics").setup()
		require("mini.comment").setup()
		require("mini.surround").setup()
		require("mini.pairs").setup()

		require("mini.bracketed").setup({
			buffer = { suffix = "" },
			comment = { suffix = "" },
			file = { suffix = "" },
			indent = { suffix = "" },
			jump = { suffix = "" },
			location = { suffix = "" },
			oldfile = { suffix = "" },
			treesitter = { suffix = "" },
			undo = { suffix = "" },
			window = { suffix = "" },
			yank = { suffix = "" },
			conflict = { suffix = "c" },
			diagnostic = {
				options = { severity = vim.diagnostic.severity.ERROR },
			},
		})

		require("mini.icons").setup({
			file = {
				[".here"] = { glyph = "󰍎", hl = "MiniIconsPurple" },
				[".rproj"] = { glyph = "󰟔", hl = "MiniIconsCyan" },
			},
			filetype = {
				r = { glyph = "󰟔", hl = "MiniIconsCyan" },
				R = { glyph = "󰟔", hl = "MiniIconsCyan" },
				rmd = { glyph = "󰟔", hl = "MiniIconsCyan" },
				Rmd = { glyph = "󰟔", hl = "MiniIconsCyan" },
				csv = { glpyh = "", hl = "MiniIconsGrey" },
			},
			directory = {
				r = { glyph = "󰴉", hl = "MiniIconsCyan" },
				R = { glyph = "󰴉", hl = "MiniIconsCyan" },
				proc = { glyph = "󱧼", hl = "MiniIconsYellow" },
				raw = { glyph = "󱋣", hl = "MiniIconsRed" },
				data = { glyph = "󱧶", hl = "MiniIconsGrey" },
				out = { glyph = "󱞊", hl = "MiniIconsGrey" },
			},
		})

		MiniIcons.mock_nvim_web_devicons()

		require("mini.move").setup({
			mappings = {
				-- Move selection (visual mode)
				left = "<M-C-h>",
				right = "<M-C-l>",
				down = "<M-C-j>",
				up = "<M-C-k>",
				-- Move current line (normal mode)
				line_left = "<M-C-h>",
				line_right = "<M-C-l>",
				line_down = "<M-C-j>",
				line_up = "<M-C-k>",
			},
		})
	end,
}
