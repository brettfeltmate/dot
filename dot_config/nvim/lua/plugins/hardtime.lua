return {
	"m4xshen/hardtime.nvim",
	dependencies = { "muniftanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	config = function()
		require("hardtime").setup({
			disabled_filetyes = { "mini", "cmdpalette" },
			enabled = false,
			disabled_keys = nil,
		})
	end,
}
