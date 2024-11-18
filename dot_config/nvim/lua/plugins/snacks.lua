return {
	"folke/snacks.nvim",
	opts = {
		styles = { notifications = { wo = { wrap = true } } },
		notifier = { enabled = false },
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
	config = function(_, opts)
		require("snacks").setup(opts)
	end,
}
