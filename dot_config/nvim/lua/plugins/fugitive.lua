return {
	"tpope/vim-fugitive",
	event = "BufRead",
	cmd = { "G", "Git" },
	enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
}
