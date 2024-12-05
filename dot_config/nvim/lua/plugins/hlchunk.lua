return {
	"shellRaining/hlchunk.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlchunk").setup({
			line_num = { enable = false },
			blank = { enable = false },
			chunk = {
				enable = true,
				style = { { fg = "#b180a7" }, { fg = "#6f2f3b" } },
			},
			indent = {
				enable = true,
				style = { "#4c4f4f", "#675f69", "#636868", "#7a6d7b" },
			},
		})
	end,
}
