return {
	"m4xshen/hardtime.nvim",
	lazy = true,
	event = "BufReadPre",
	enabled = false,
	opts = {
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
