return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	config = function()
		require("outline").setup({
			outline_window = {
				width = 25,
				relative_width = true,
				focus_on_open = true,
				show_relative_numbers = true,
				show_symbol_details = false,
			},
			preview_window = {
				auto_preview = true,
				width = 50,
				relative_width = true,
				min_width = 50,
				height = 20,
				relative_height = true,
				min_height = 25,
				live = true,
			},
			icons = {
				Function = { icon = "󰡱" },
			},
		})
	end,
}
