return {
	"stevearc/quicker.nvim",
	event = "BufReadPre",
	config = function()
		require("quicker").setup({})
	end,
}
