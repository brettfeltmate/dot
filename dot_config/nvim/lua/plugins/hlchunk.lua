return {
	"shellRaining/hlchunk.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlchunk").setup({
			chunk = { enable = true },
			indent = { enable = true },
			line_num = { enable = true },
			blank = { enable = false },
		})
	end,
}
