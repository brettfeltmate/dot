return {
	"leath-dub/snipe.nvim",
	event = "UIEnter",
	config = function()
		require("snipe").setup({
			ui = { position = "cursor" },
			hints = { dictionary = "asdfweghiolcmp" },
			navigate = { under_cursor = "<BS>" },
			sort = "last",
		})
	end,
}
