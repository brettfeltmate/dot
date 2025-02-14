return {
	"yetone/avante.nvim",
	event = "UIEnter",
	build = "make",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter", lazy = true },
		{ "stevearc/dressing.nvim", lazy = true },
		{ "nvim-lua/plenary.nvim", lazy = true },
		{ "MunifTanjim/nui.nvim", lazy = true },
		{ "echasnovski/mini.icons", lazy = true },
		{ "ibhagwan/fzf-lua", lazy = true },
	},
	opts = {
		provider = "claude",
		behaviour = { auto_suggestions = false, auto_set_keymaps = false },
        dual_boost = { enabled = true, },
		windows = {
			position = "right",
			width = 40,
			input = { height = 10 },
		},
		file_selector = { provider = "fzf" },
	},
	config = function(_, opts)
		require("avante_lib").load()
		require("avante").setup(opts)
	end,
}
