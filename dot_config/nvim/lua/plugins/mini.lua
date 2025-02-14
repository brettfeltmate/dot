return {
	"echasnovski/mini.nvim",
	lazy = true,
	event = "UIEnter",
	config = function()
		require("mini.align").setup()
		require("mini.ai").setup()
		require("mini.bracketed").setup()
		require("mini.comment").setup()
		-- require("mini.surround").setup()
		require("mini.basics").setup()
		require("mini.extra").setup()
		require("mini.misc").setup()

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
					width = "auto",  -- Autoscale window to fit clue content
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

				-- Builtins
				clue.gen_clues.builtin_completion(),
				clue.gen_clues.g(),
				clue.gen_clues.marks(),
				clue.gen_clues.registers(),
				clue.gen_clues.windows({ submode_resize = true }),
				clue.gen_clues.z(),

				-- Submodes
                { mode = "n", keys = "<leader>a", desc = "Avante" },
                { mode = "v", keys = "<leader>a", desc = "Avante" },
				{ mode = "n", keys = "<leader>b", desc = "Buffer" },
                { mode = "n", keys = "<leader>c", desc = "Commands" },
                { mode = "v", keys = "<leader>c", desc = "Commands" },
				{ mode = "n", keys = "<leader>d", desc = "Debug" },
				{ mode = "n", keys = "<leader>g", desc = "Git" },
				{ mode = "n", keys = "<leader>l", desc = "Lsp" },
				{ mode = "n", keys = "<leader>s", desc = "Search" },
				{ mode = "n", keys = "<leader>,", desc = "UI" },
				{ mode = "n", keys = "<leader>n", desc = "NeoTest" },
				{ mode = "n", keys = "<leader>,t", desc = "Treewalker" },
				{ mode = "n", keys = "<leader>w", desc = "Window" },

				-- DAP (Hydra style)
				{ mode = "n", keys = "<leader>dk", postkeys = "<leader>d", desc = "Step out" },
				{ mode = "n", keys = "<leader>dj", postkeys = "<leader>d", desc = "Step into" },
				{ mode = "n", keys = "<leader>dl", postkeys = "<leader>d", desc = "Step over" },

				-- Treewalker (Hydra style)
				{ mode = "n", keys = "<Leader>,tj", postkeys = "<Leader>,t", desc = "Down" },
				{ mode = "n", keys = "<Leader>,tk", postkeys = "<Leader>,t", desc = "Up" },
				{ mode = "n", keys = "<Leader>,th", postkeys = "<Leader>,t", desc = "Left" },
				{ mode = "n", keys = "<Leader>,tl", postkeys = "<Leader>,t", desc = "Right" },
				{ mode = "v", keys = "<Leader>,tj", postkeys = "<Leader>,t", desc = "Down" },
				{ mode = "v", keys = "<Leader>,tk", postkeys = "<Leader>,t", desc = "Up" },
				{ mode = "v", keys = "<Leader>,th", postkeys = "<Leader>,t", desc = "Left" },
				{ mode = "v", keys = "<Leader>,tl", postkeys = "<Leader>,t", desc = "Right" },
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
