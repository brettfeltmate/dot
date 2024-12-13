return {
	{
		"nvchad/ui",
        dependencies = { "nvim-lua/plenary.nvim", "echasnovski/mini.icons" },
		config = function()
			require("nvchad")
		end,
	},
	{
		"nvchad/base46",
		lazy = true,
		build = function()
			require("base46").load_all_highlights()
		end,
	},
}
