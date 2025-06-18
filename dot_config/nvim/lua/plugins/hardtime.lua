return {
	"m4xshen/hardtime.nvim",
	lazy = true,
	event = "BufReadPre",
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {
		disable_mouse = false,
		disabled_keys = {
			["<Up>"] = false,
			["<Down>"] = false,
			["<Left>"] = false,
			["<Right>"] = false,
		},
		disabled_filetypes = {
			["Otree"] = true,
		},
	},
}
