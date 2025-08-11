return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	config = function()
		require("persistence").setup({
			options = { "globals" },
			pre_save = function()
				vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
			end,
		})
	end,
}
