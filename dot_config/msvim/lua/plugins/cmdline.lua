return {
	"hachy/cmdpalette.nvim",
	lazy = false,
	config = function()
		vim.opt.cmdheight = 0
		require("cmdpalette").setup({
			win = {
				height = 0.1,
				width = 1,
				row_off = 99,
				title = "| cmd |",
				title_pos = "left",
			},
		})
	end,
}
