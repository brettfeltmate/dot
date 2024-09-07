return {
	"romgrk/barbar.nvim",
	event = "BufReadPre",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		maximum_length = 15,
		auto_hide = true,
		maximum_padding = 1,
		icons = {
			buffer_index = true,
			separator = { left = "|  ", right = "" },
		},
		sidebar_filetypes = {
			["neo-tree"] = { event = "BufWinLeave", text = "Files", align = "left" },
			["Outline"] = { event = "BufWinLeave", text = "Outline", align = "right" },
		},
	},
}
