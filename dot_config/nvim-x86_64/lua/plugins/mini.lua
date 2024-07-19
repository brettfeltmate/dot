return {
	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			require("mini.align").setup()
			-- require("mini.animate").setup()
			require("mini.basics").setup()
			require("mini.bracketed").setup()
			require("mini.bufremove").setup()
			require("mini.comment").setup()
			require("mini.extra").setup()
			require("mini.icons").setup()
			require("mini.indentscope").setup()
			require("mini.misc").setup()
			require("mini.move").setup()
			require("mini.notify").setup()
			require("mini.pairs").setup()
			require("mini.trailspace").setup()
			require("mini.visits").setup()

			local extras = require("mini.extra")

			require("mini.ai").setup({
				n_lines = 500,
				custom_textobjects = {
					B = extras.gen_ai_spec.buffer(),
					D = extras.gen_ai_spec.diagnostic(),
					I = extras.gen_ai_spec.indent(),
					L = extras.gen_ai_spec.line(),
					N = extras.gen_ai_spec.number(),
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
					{ mode = "n", keys = "<leader>s", desc = "Search" },
					{ mode = "n", keys = "<leader>p", desc = "Possession" },
					{ mode = "n", keys = "<leader>l", desc = "Lsp" },
					{ mode = "n", keys = "<leader>r", desc = "Repl" },
					{ mode = "v", keys = "<leader>r", desc = "Repl" },
					{ mode = "n", keys = "<leader>u", desc = "UI" },
					{ mode = "n", keys = "<leader>w", desc = "Window" },

					clue.gen_clues.builtin_completion(),
					clue.gen_clues.g(),
					clue.gen_clues.marks(),
					clue.gen_clues.registers(),
					clue.gen_clues.windows({ submode_resize = true }),
					clue.gen_clues.z(),
				},
			})

			require("mini.files").setup({
				windows = {
					max_number = 2,
					preview = true,
					width_focus = 25,
					width_preview = 50,
				},
				options = {
					permanent_delete = false,
					use_as_default_explorer = true,
				},
			})

			require("mini.pick").setup({
				window = {
					config = {
						border = "rounded",
						height = math.floor(0.30 * vim.o.lines),
						width = math.floor(0.35 * vim.o.columns),
					},
					prompt_prefix = "|>...",
				},
				mappings = {
					scroll_up = "<S-Up>",
					scroll_down = "<S-Down>",
					scroll_left = "<S-Left>",
					scroll_right = "<S-Right>",
					toggle_info = "<S-tab>",
					toggle_preview = "<tab>",
				},
			})

			vim.ui.select = MiniPick.ui_select
			MiniPick.registry.colorschemes = function()
				local colorschemes = vim.fn.getcompletion("", "color")
				return MiniPick.start({
					source = {
						items = colorschemes,
						choose = function(item)
							vim.cmd("colorscheme " .. item)
						end,
					},
				})
			end
			local statusline = require("mini.statusline")
			-- set use_icons to true if you have a Nerd Font
			statusline.setup({ use_icons = vim.g.have_nerd_font })
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et