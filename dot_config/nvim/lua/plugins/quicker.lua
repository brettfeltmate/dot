return {
	"stevearc/quicker.nvim",
    event = "UIEnter",
	config = function()
		require("quicker").setup({})
	end,
}
