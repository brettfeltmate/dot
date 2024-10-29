return {
	"yetone/avante.nvim",
	lazy = true,
	event = "BufReadPre",
	cmd = "AvanteAsk",
	build = "make",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter", lazy = true },
		{ "stevearc/dressing.nvim", lazy = true },
		{ "nvim-lua/plenary.nvim", lazy = true },
		{ "MunifTanjim/nui.nvim", lazy = true },
		{ "echasnovski/mini.icons", lazy = true },
		{ "HakonHarnes/img-clip.nvim", lazy = true },
	},
	config = function()
		require("avante_lib").load()

		require("avante").setup({
			provider = "claude",
			behaviour = {
				auto_suggestions = false,
			},
			mappings = {
				diff = {
					ours = "co",
					theirs = "ct",
					all_theirs = "ca",
					both = "cb",
					cursor = "cc",
					next = "]x",
					prev = "[x",
				},
				suggestion = {
					accept = "<M-l>",
					next = "<M-j>",
					prev = "<M-k>",
					dismiss = "<M-h>",
				},
				jump = {
					next = "]]",
					prev = "[[",
				},
				submit = {
					normal = "<CR>",
					insert = "<C-s>",
				},
				sidebar = {
					apply_all = "A",
					apply_cursor = "a",
					switch_windows = "<Tab>",
					reverse_switch_windows = "<S-Tab>",
				},
			},
		})
	end,
}
