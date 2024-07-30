return {
	"mvllow/modes.nvim",
	event = "BufRead",
	config = function()
		require("modes").setup()
	end,
}
