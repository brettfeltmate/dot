return {
	"echasnovski/mini.nvim",
	lazy = false,
	config = function()
		require("mini.basics").setup()
		require("mini.extra").setup()
		require("mini.misc").setup()

		require("mini.icons").setup({
			extension = {
				[".here"] = { glyph = "󰍎", hl = "MiniIconsYellow" },
				[".rproj"] = { glyph = "󰟔", hl = "MiniIconsRed" },
			},
		})

		local clue = require("mini.clue")

		require("mini.clue").setup({
			window = {
				delay = 300,
				config = { width = "auto", border = "single" },
			},
			triggers = {
				-- Leader triggers
				{ mode = "n", keys = "<Leader>" },
				{ mode = "v", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },

				-- Local Leader triggers
				{ mode = "n", keys = "<localleader>" },
				{ mode = "v", keys = "<localleader>" },
				{ mode = "x", keys = "<localleader>" },

				-- Debug submode trigger
				-- { mode = "n", keys = "<leader>d" },

				-- Built-in completion
				{ mode = "i", keys = "<C-x>" },

				-- `g` key
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },

				-- `s` key
				{ mode = "n", keys = "s" },
				{ mode = "x", keys = "s" },

				-- `[]` keys
				{ mode = "n", keys = "[" },
				{ mode = "n", keys = "]" },

				-- `\` key
				{ mode = "n", keys = [[\]] },

				-- Arrow.nvim handles these now
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

				-- Window commands
				{ mode = "n", keys = "<C-w>" },

				-- `z` key
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },
			},

			clues = {
				-- Enhance this by adding descriptions for <Leader> mapping groups
				{ mode = "n", keys = "<leader>b", desc = "Buffer" },
				{ mode = "n", keys = "<leader>c", desc = "Copilot" },
				{ mode = "v", keys = "<leader>c", desc = "Copilot" },
				{ mode = "n", keys = "<leader>s", desc = "Search" },
				{ mode = "n", keys = "<leader>l", desc = "Lsp" },
				{ mode = "n", keys = "<leader>g", desc = "Git" },
				{ mode = "n", keys = "<leader>,", desc = "UI" },
				{ mode = "n", keys = "<leader>n", desc = "NoNeckPain" },
				{ mode = "n", keys = "<leader>t", desc = "Test" },
				{ mode = "n", keys = "<leader>w", desc = "Window" },
				{ mode = "n", keys = "<leader>d", postkeys = "<leader>d", desc = "Debug" },
				{ mode = "n", keys = "<leader>dk", postkeys = "<leader>d", desc = "Step out" },
				{ mode = "n", keys = "<leader>dj", postkeys = "<leader>d", desc = "Step into" },
				{ mode = "n", keys = "<leader>dl", postkeys = "<leader>d", desc = "Step over" },
				{ mode = "n", keys = "<leader>db", postkeys = "<leader>d", desc = "Breakpoint" },
				{ mode = "n", keys = "<leader>dd", postkeys = "<leader>d", desc = "Start/continue" },
				{ mode = "n", keys = "<leader>dq", postkeys = "<leader>d", desc = "Quit" },
				{ mode = "n", keys = "<leader>dr", postkeys = "<leader>d", desc = "Repl" },
				{ mode = "n", keys = "<leader>dh", postkeys = "<leader>d", desc = "Hover" },
				{ mode = "n", keys = "<leader>dp", postkeys = "<leader>d", desc = "Preview" },
				{ mode = "n", keys = "<leader>df", postkeys = "<leader>d", desc = "Frames" },
				{ mode = "n", keys = "<leader>ds", postkeys = "<leader>d", desc = "Scopes" },
				{ mode = "n", keys = "<leader>du", postkeys = "<leader>d", desc = "UI" },

				clue.gen_clues.builtin_completion(),
				clue.gen_clues.g(),
				clue.gen_clues.marks(),
				clue.gen_clues.registers(),
				clue.gen_clues.windows({ submode_resize = true }),
				clue.gen_clues.z(),
			},
		})

		require("mini.files").setup({
			mappings = {
				close = "q",
				go_in = "l",
				go_in_plus = "<CR>",
				go_out = "H",
				go_out_plus = "h",
				reset = "<BS>",
				reveal_cwd = ".",
				show_help = "?",
				synchronize = "s",
				trim_left = "<",
				trim_right = ">",
			},
			windows = {
				preview = true,
				width_nofocus = 20,
				width_focus = 30,
				width_preview = 75,
			},
			options = {
				use_as_default_explorer = false,
				permanent_delete = false,
			},
		})

		require("mini.move").setup({
			mappings = {
				-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
				left = "<M-C-h>",
				right = "<M-C-l>",
				down = "<M-C-j>",
				up = "<M-C-k>",
				-- Move current line in Normal mode
				line_left = "<M-C-h>",
				line_right = "<M-C-l>",
				line_down = "<M-C-j>",
				line_up = "<M-C-k>",
			},
		})
	end,
}
