return {
	"m4xshen/hardtime.nvim",
	event = "BufReadPre",
	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	config = function()
		require("hardtime").setup({
			disable_mouse = false,
			disabled_keys = {
				["<Up>"] = {},
				["<Down>"] = {},
				["<Left>"] = {},
				["<Right>"] = {},
			},
			-- Add "oil" to disabled (ignored) filetypes
			disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil", "neo-tree", "Outline" },
		})
	end,
}
