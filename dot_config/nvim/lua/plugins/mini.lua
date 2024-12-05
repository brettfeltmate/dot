return {
	"echasnovski/mini.nvim",
	lazy = true,
	event = "UIEnter",
	config = function()
		require("mini.align").setup()
		require("mini.ai").setup()
		require("mini.bracketed").setup()
		require("mini.comment").setup()
		require("mini.trailspace").setup()
		require("mini.surround").setup()
	end,
}
