return {
	"mvllow/modes.nvim",
	event = "VimEnter",
	config = function()
		require("modes").setup()
	end,
}
