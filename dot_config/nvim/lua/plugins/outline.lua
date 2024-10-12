return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	config = function()
		require("outline").setup({
			outline_window = {
				position = "left",
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
				width = 83,
				relative_width = true,
				min_width = 50,
				height = 100,
				relative_height = true,
				min_height = 15,
				live = true,
			},
			icons = {
				Key = { icon = " ", hl = "Type" },
			},
		})
	end,
}
