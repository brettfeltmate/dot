return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	config = function()
		require("gitsigns").setup({
			numhl = true,
			signcolumn = false,
		})
	end,
}
