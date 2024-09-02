-- Colors inspired by NvChad's nightlamp
require("mini.base16").setup({
	palette = {
		base00 = "#272427",
		base01 = "#232123",
		base02 = "#262226",
		base03 = "#696a73",
		base04 = "#696a73",
		base05 = "#cbc6b4",
		base06 = "#d5ccbb",
		base07 = "#e0d6bd",
		base08 = "#caa8d0",
		base09 = "#c18c7e",
		base0A = "#ccb29c",
		base0B = "#c9c4c5",
		base0C = "#a7a6e0",
		base0D = "#c799a2",
		base0E = "#afbdd6",
		base0F = "#a9c9bf",
	},
})

vim.g.colors_name = "desklight"
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#e0d6bd" })
vim.api.nvim_set_hl(0, "Operator", { fg = "#aaabb1" })
vim.api.nvim_set_hl(0, "Delimiter", { fg = "#ccbaa7" })
vim.api.nvim_set_hl(0, "Float", { fg = "#e2d6e4" })
