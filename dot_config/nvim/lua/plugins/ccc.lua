return {
	"uga-rosa/ccc.nvim",
	lazy = true,
	cmd = "CccPick",
	opts = function()
		local ccc = require("ccc")
		return {
			bar_len = 50,
			inputs = { ccc.input.rgb, ccc.input.oklch, ccc.input.okhsl },
		}
	end,
}
