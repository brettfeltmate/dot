return {
	"shortcuts/no-neck-pain.nvim",
	lazy = true,
	dependencies = { "nvchad/base46" },
	cmd = "NoNeckPain",
	opts = function()
		local base30 = require("base46").get_theme_tb("base_30")
		local shade = require("base46.colors").change_hex_lightness
		local o = {
			buffers = {
				bo = { filetype = "md" },
				colors = { background = shade(base30.one_bg, -2) },
				scratchPad = { enabled = true },
				left = { scratchPad = { pathToFile = "devnotes.md" } },
				right = { enabled = false },
			},
		}
		return o
	end,
}
