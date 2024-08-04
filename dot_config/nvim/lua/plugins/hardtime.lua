return {
	"m4xshen/hardtime.nvim",
	lazy = true,
	cmd = "Hardtime enable",
	dependencies = { "muniftanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	config = function()
		require("hardtime").setup({
			disabled_filetyes = { "mini", "cmdpalette", "lazy", "mason", "oil" },
			enabled = false,
			disabled_keys = {
				["Up"] = {},
				["Down"] = {},
				["Left"] = {},
				["Right"] = {},
			},
		})
	end,
}
