return {
	"OXY2DEV/helpview.nvim",
	enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	ft = "help",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
}
