return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	build = "make",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter", lazy = true },
		{ "stevearc/dressing.nvim", lazy = true },
		{ "nvim-lua/plenary.nvim", lazy = true },
		{ "MunifTanjim/nui.nvim", lazy = true },
		{ "echasnovski/mini.icons", lazy = true },
		{ "HakonHarnes/img-clip.nvim", lazy = true },
		{ "ibhagwan/fzf-lua", lazy = true },
		{
			"zbirenbaum/copilot.lua",
			opts = {
				panel = { enabled = false },
				suggestion = {
					enabled = false,
					auto_trigger = false,
					hide_during_completion = true,
					keymap = {
						accept = "<M-l>",
						accept_line = "<M-S-l>",
						next = "<M-j>",
						prev = "<M-k>",
						dismiss = "<M-space>",
					},
				},
				filetypes = { markdown = true, help = true },
			},
		},
	},
	opts = {
		provider = "claude",
		behaviour = { auto_suggestions = false },
		mappings = {
			suggestion = {
				-- accept = "<M-l>",
				-- next = "<M-j>",
				-- prev = "<M-k>",
				-- dismiss = "<M-h>",
			},
		},
		windows = {
			position = "right",
			width = 35,
			height = 45,
			input = { height = 10 },
			ask = { floating = false, start_insert = false },
		},
		file_selector = { provider = "fzf" },
	},
	config = function(_, opts)
		require("avante_lib").load()
		require("avante").setup(opts)
	end,
}
