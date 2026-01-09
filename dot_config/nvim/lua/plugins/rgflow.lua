return {
	"mangelozzi/rgflow.nvim",
	dependencies = { "stevearc/quicker.nvim" },
	lazy = true,
	opts = { default_trigger_mappings = false },
	config = function(_, opts)
		vim.cmd("packadd cfilter")
		require("rgflow").setup(opts)
	end,
}
