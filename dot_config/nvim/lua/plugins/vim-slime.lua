return {
	"jpalardy/vim-slime",
	event = "BufReadPre",
	init = function()
		vim.g.slime_target = "kitty"
		vim.g.slime_bracketed_paste = 1
		vim.g.slime_preserve_curpos = 0
		vim.g.slime_default_config = { listen_on = os.getenv("KITTY_LISTEN_ON") }
		vim.g.slime_dont_ask_default = 0
		vim.g.slime_cell_delimiter = "```"
	end,
}
