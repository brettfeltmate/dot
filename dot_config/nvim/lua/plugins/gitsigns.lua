return {
	"lewis6991/gitsigns.nvim",
	lazy = true,
	event = "BufReadPre",
	enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	opts = { signcolumn = true, numhl = false, linehl = false },
}
