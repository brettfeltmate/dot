if true then
	return {}
end

return {
	"leath-dub/snipe.nvim",
	event = "UIEnter",
	config = function()
		require("snipe").setup({
			ui = { position = "cursor" },
			hints = { dictionary = "123456789" },
			navigate = { under_cursor = "<space>" },
			sort = "last",
		})
	end,
}
