return {
	"hachy/cmdpalette.nvim",
	config = function()
		require("cmdpalette").setup({
			win = {
				height = 0.1,
				width = 1,
				row_off = 99,
				title = " <|| command ||> ",
				title_pos = "left",
			},
		})
        vim.opt.cmdheight = 0
	end,
}
