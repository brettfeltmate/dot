return {
	"dmtrKovalenko/fff.nvim",
	dependencies = { "simifalaye/minibuffer.nvim" },
	build = "cargo build --release",
	enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	opts = {
		prompt = "Query: ",
		title = "Results",
		-- layout = { height = 0.9, width = 1 },
		layout = {
			height = 0.99,
			width = 0.5,
			prompt_position = "top", -- or 'top'
			preview_position = "top", -- or 'left', 'right', 'top', 'bottom'
			preview_size = 0.4,
		},
		hl = { normal = "NormalFloat" },
	},
	lazy = true,
	cmd = "FFFFind",
	event = "VeryLazy",
	config = function(_, opts)
		require("fff").setup(opts)

		local picker_ui = require("fff.picker_ui")
		picker_ui.open = require("minibuffer.integrations.fff")
	end,
}
