return {
	"hiphish/rainbow-delimiters.nvim",
	event = "BufRead",
	after = "nvim-treesitter",
	config = function()
		local rainbow_delimiters = require("rainbow-delimiters")
		require("rainbow-delimiters.setup").setup({
			strategy = {
				[""] = rainbow_delimiters.strategy["global"],
				commonlisp = rainbow_delimiters.strategy["local"],
			},
			query = {
				[""] = "rainbow-delimiters",
				latex = "rainbow-blocks",
			},
			highlight = {
				"RainbowDelimiterYellow",
				"RainbowDelimiterRed",
				"RainbowDelimiterCyan",
				"RainbowDelimiterOrange",
			},
			blacklist = { "c", "cpp" },
		})
	end,
}