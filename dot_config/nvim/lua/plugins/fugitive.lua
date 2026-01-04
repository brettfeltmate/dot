return {
	{

		"tpope/vim-fugitive",
		event = "BufRead",
		cmd = { "G", "Git" },
		enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	},
	-- {
	-- 	"junegunn/gv.vim",
	-- 	event = "BufRead",
	-- 	dependencies = { "tpope/vim-fugitive" },
	-- 	enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	-- },
	-- {
	-- 	"justinmk/vim-ug",
	-- 	event = "BufRead",
	-- 	dependencies = { "tpope/vim-fugitive" },
	-- 	enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	-- },
}
