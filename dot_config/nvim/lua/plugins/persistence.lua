return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	config = function()
		require("persistence").setup({
			options = { "globals" },
			pre_save = function()
				vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
			end,
		})
	end,
}
