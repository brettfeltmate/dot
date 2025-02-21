return {
	"yetone/avante.nvim",
    lazy = true,
	build = "make",
	enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
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
		dual_boost = {
			enabled = true,
			prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
		},
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
