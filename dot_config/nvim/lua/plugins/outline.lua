return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	config = function()
		require("outline").setup({
			outline_window = {
				position = "right",
				width = 15,
				relative_width = true,
				focus_on_open = true,
				show_relative_numbers = false,
				show_numbers = false,
			},
			outline_items = {
				show_symbol_details = false,
			},
			preview_window = {
				auto_preview = true,
				live = false,
			},
			icons = {
				Key = { icon = " ", hl = "Type" },
			},
		})
	end,
}
