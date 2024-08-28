return {
	"echasnovski/mini.nvim",
	lazy = false,
	config = function()
		require("mini.align").setup()
		require("mini.ai").setup()
		require("mini.basics").setup()
		require("mini.bracketed").setup()
		require("mini.bufremove").setup()
		require("mini.comment").setup()
		require("mini.extra").setup()
		require("mini.indentscope").setup()
		require("mini.misc").setup()
		require("mini.move").setup()
		require("mini.pairs").setup()
		-- require("mini.statusline").setup()
		-- require("mini.tabline").setup()
		require("mini.trailspace").setup()

		-- require("mini.notify").setup()
		-- vim.notify = MiniNotify.make_notify()
		--

		-- Colors lifted from NvChad's nightlamp
		-- require("mini.base16").setup({
		-- 	palette = {
		-- 		base00 = "#18191f",
		-- 		base01 = "#222329",
		-- 		base02 = "#2c2d33",
		-- 		base03 = "#3c3d43",
		-- 		base04 = "#48494f",
		-- 		base05 = "#b8af9e",
		-- 		base06 = "#cbc0ab",
		-- 		base07 = "#e0d6bd",
		-- 		base08 = "#b8aad9",
		-- 		base09 = "#cd9672",
		-- 		base0A = "#ccb89c",
		-- 		base0B = "#8aa387",
		-- 		base0C = "#7aacaa",
		-- 		base0D = "#b58385",
		-- 		base0E = "#8e9cb4",
		-- 		base0F = "#90a0a0",
		-- 	},
		-- })

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
				{ mode = "n", keys = "<leader>b", desc = "Buffer" },
				{ mode = "n", keys = "<leader>c", desc = "Chat" },
				{ mode = "v", keys = "<leader>c", desc = "Chat" },
				{ mode = "n", keys = "<leader>s", desc = "Search" },
				{ mode = "n", keys = "<leader>l", desc = "Lsp" },
				{ mode = "n", keys = "<leader>g", desc = "Git" },
				{ mode = "n", keys = "<leader>,", desc = "UI" },
				{ mode = "n", keys = "<leader>w", desc = "Window" },

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
