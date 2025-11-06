return {
	"mangelozzi/rgflow.nvim",
	dependencies = { "stevearc/quicker.nvim", "kevinhwang91/nvim-bqf" },
	lazy = true,
	-- event = "UIEnter",
	opts = {
		-- Set the default rip grep flags and options for when running a search via
		-- RgFlow. Once changed via the UI, the previous search flags are used for
		-- each subsequent search (until Neovim restarts).
		cmd_flags = "--smart-case --fixed-strings --ignore --max-columns 200",
		-- Mappings to trigger RgFlow functions
		default_trigger_mappings = false,
		-- These mappings are only active when the RgFlow UI (panel) is open
		default_ui_mappings = true,
		-- QuickFix window only mapping
		default_quickfix_mappings = true,
	},
	config = function(_, opts)
		vim.cmd("packadd cfilter")
		require("rgflow").setup(opts)
	end,
}
