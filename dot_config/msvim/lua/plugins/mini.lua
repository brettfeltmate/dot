return {
	{
		"echasnovski/mini.ai",
		config = function()
			require("mini.ai").setup()
		end,
	},
	{
		"echasnovski/mini.basics",
		config = function()
			require("mini.basics").setup()
		end,
	},
	{
		"echasnovski/mini.bracketed",
		config = function()
			require("mini.bracketed").setup()
		end,
	},
	{
		"echasnovski/mini.bufremove",
		config = function()
			require("mini.bufremove").setup()
		end,
	},
	{
		"echasnovski/mini.clue",
		config = function()
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
					{ mode = "n", keys = "<leader>t", desc = "Toggle" },
					{ mode = "n", keys = "<leader>m", desc = "Markdown" },
					-- { mode = "n", keys = "<leader>l", desc = "Limelight" },
					-- { mode = "n", keys = "<leader>s", desc = "Search" },
					-- { mode = "n", keys = "<leader>,", desc = "UI" },
					-- { mode = "n", keys = "<leader>w", desc = "Window" },

					clue.gen_clues.builtin_completion(),
					clue.gen_clues.g(),
					clue.gen_clues.marks(),
					clue.gen_clues.registers(),
					clue.gen_clues.windows({ submode_resize = true }),
					clue.gen_clues.z(),
				},
			})
		end,
	},
	{
		"echasnovski/mini.comment",
		config = function()
			require("mini.bufremove").setup()
		end,
	},
	{
		"echasnovski/mini.files",
		config = function()
			require("mini.files").setup({
				windows = {
					max_number = 2,
					preview = true,
					width_focus = 20,
					width_preview = 40,
				},
				options = { use_as_default_explorer = true },
			})
		end,
	},
	{
		"echasnovski/mini.icons",
		config = function()
			require("mini.icons").setup()
		end,
	},
	{
		"echasnovski/mini.move",
		config = function()
			require("mini.move").setup()
		end,
	},
	{
		"echasnovski/mini.notify",
		config = function()
			require("mini.notify").setup()
		end,
	},
	{
		"echasnovski/mini.pairs",
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"echasnovski/mini.pick",
		config = function()
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
		end,
	},
	{
		"echasnovski/mini.statusline",
		config = function()
			require("mini.statusline").setup()
		end,
	},
	{
		"echasnovski/mini.surround",
		config = function()
			require("mini.surround").setup()
		end,
	},
}
