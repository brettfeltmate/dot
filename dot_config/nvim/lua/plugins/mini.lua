return {
	"echasnovski/mini.nvim",
	lazy = false,
	config = function()
		require("mini.align").setup()
		require("mini.ai").setup()
		-- require("mini.base16").setup()
		require("mini.basics").setup()
		require("mini.bracketed").setup()
		-- require("mini.bufremove").setup()
		require("mini.comment").setup()
		require("mini.extra").setup()
		require("mini.indentscope").setup()
		require("mini.misc").setup()
		require("mini.move").setup({
			mappings = {
				left = "<S-left>",
				right = "<S-right>",
				down = "<S-down>",
				up = "<S-up>",

				line_left = "<S-left>",
				line_right = "<S-right>",
				line_down = "<S-down>",
				line_up = "<S-up>",
			},
		})
		-- require("mini.pairs").setup()
		require("mini.trailspace").setup()

		-- local animate = require("mini.animate")

		require("mini.animate").setup({
			cursor = { enable = false }, -- Wonky with ext-marked files (e.g., mark/help-view); too lazy to finagle

			scroll = {}, -- use default
			resize = { enable = false }, -- FIXME: find timing that doesn't suck ass for longer transitions
			open = {}, -- don't actually know what this impacts
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
				{ mode = "n", keys = "<leader>a", desc = "  Avante +|>" },
				{ mode = "v", keys = "<leader>a", desc = "  Avante +|>" },
				{ mode = "n", keys = "<leader>b", desc = "  Buffer +|>" },
				{ mode = "n", keys = "<leader>s", desc = "  Search +|>" },
				{ mode = "n", keys = "<leader>l", desc = "     Lsp +|>" },
				{ mode = "n", keys = "<leader>g", desc = "     Git +|>" },
				{ mode = "n", keys = "<leader>,", desc = "      UI +|>" },
				{ mode = "n", keys = "<leader>w", desc = "  Window +|>" },
				{ mode = "n", keys = "<leader>r", desc = "    REPL +|>" },
				{ mode = "v", keys = "<leader>r", desc = "    REPL +|>" },
				{ mode = "x", keys = "<leader>r", desc = "    REPL +|>" },

				clue.gen_clues.builtin_completion(),
				clue.gen_clues.g(),
				clue.gen_clues.marks(),
				clue.gen_clues.registers(),
				clue.gen_clues.windows({ submode_resize = true }),
				clue.gen_clues.z(),
			},
		})
	end,
}
