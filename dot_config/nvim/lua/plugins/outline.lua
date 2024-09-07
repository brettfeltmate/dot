return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	config = function()
		require("outline").setup({
			outline_window = {
				width = 35,
				relative_width = false,
				focus_on_open = false,
				show_relative_numbers = true,
			},
			preview_window = {
				auto_preview = true,
				width = 40,
				relative_width = true,
				height = 35,
				relative_height = true,
				live = true,
			},
		})
	end,
}
