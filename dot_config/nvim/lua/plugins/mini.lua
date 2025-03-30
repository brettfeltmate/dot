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
				rmd = { glyph = "󰟔", hl = "MiniIconsCyan" },
				csv = { glpyh = "", hl = "MiniIconsGrey" },
			},
			directory = {
				r = { glyph = "󰴉", hl = "MiniIconsCyan" },
				proc = { glyph = "󱧼", hl = "MiniIconsYellow" },
				raw = { glyph = "󱋣", hl = "MiniIconsRed" },
				data = { glyph = "󱧶", hl = "MiniIconsGrey" },
				out = { glyph = "󱞊", hl = "MiniIconsGrey" },
			},
		})

		MiniIcons.mock_nvim_web_devicons()

		local clue = require("mini.clue")
		require("mini.clue").setup({
			window = {
				delay = 300,
				config = {
					border = "rounded",
					anchor = "SE",
					width = "auto", -- Autoscale window to fit clue content
					row = "auto",
					col = "auto",
				},
			},

			triggers = {
				-- Leaders
				{ mode = "n", keys = "<Leader>" },
				{ mode = "v", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },
				{ mode = "n", keys = "<localleader>" },
				{ mode = "v", keys = "<localleader>" },
				{ mode = "x", keys = "<localleader>" },

				-- g
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },

				-- Surround
				{ mode = "n", keys = "s" },
				{ mode = "x", keys = "s" },

				-- Bracketed
				{ mode = "n", keys = "[" },
				{ mode = "n", keys = "]" },

				-- Toggles
				{ mode = "n", keys = [[\]] },

				-- Marks
				{ mode = "n", keys = "'" },
				{ mode = "n", keys = "`" },
				{ mode = "x", keys = "'" },
				{ mode = "x", keys = "`" },

				-- Registers
				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },

				-- Window
				{ mode = "n", keys = "<C-w>" },

				-- Z
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },
			},

			clues = {
				clue.gen_clues.builtin_completion(),
				clue.gen_clues.g(),
				clue.gen_clues.marks(),
				clue.gen_clues.registers(),
				clue.gen_clues.windows({ submode_resize = true }),
				clue.gen_clues.z(),

				{ mode = "n", keys = "<leader>.", desc = "Commands" },
				{ mode = "n", keys = "<leader>,", desc = "Utils" },
			},
		})

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
