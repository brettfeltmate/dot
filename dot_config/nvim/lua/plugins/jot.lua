return {
	"letieu/jot.lua",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("jot").setup({
			win_opts = {
				relative = "editor",
				anchor = "SE",
				row = 0.95,
				col = 0.95,
			},
		})
	end,
}
