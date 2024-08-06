return {
	"folke/zen-mode.nvim",
	event = "VeryLazy",
	config = function()
		require("zen-mode").setup({
			window = {
				width = 120,
				options = {
					signcolumn = "no",
					number = false,
					relativenumber = false,
				},
			},
			plugins = {
				twilight = { enabled = false },
				options = { laststatus = 3 },
			},
		})
	end,
}
