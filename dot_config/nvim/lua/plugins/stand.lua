return {
	"mvllow/stand.nvim",
	event = "BufReadPre",
	config = function()
		require("stand").setup({
			minute_interval = 30,
		})
	end,
}
