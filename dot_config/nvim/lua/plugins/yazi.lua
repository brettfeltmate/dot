return {
	"mikavilpas/yazi.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	config = function()
		require("yazi").setup({
			open_for_directories = true,
			floating_window_scaling_factor = 0.9,
			yazi_floating_window_winblend = 20,
			yazi_floating_window_border = "single",
		})
	end,
}
