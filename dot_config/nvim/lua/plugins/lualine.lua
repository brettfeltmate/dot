return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		-- "rrethy/nvim-base16",
	},
	config = function()
		require("lualine").setup({
			options = {
				-- theme = "base16",
				section_separators = { "|>", "<|" },
				component_separators = { "|", "|" },
			},
		})
	end,
}
