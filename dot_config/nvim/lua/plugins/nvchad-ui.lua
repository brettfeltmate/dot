return {
	{
		"nvchad/ui",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("nvchad")
		end,
	},
	{
		"nvchad/base46",
		build = function()
			require("base46").load_all_highlights()
		end,
	},
}
