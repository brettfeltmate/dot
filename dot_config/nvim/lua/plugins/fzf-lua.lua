return {
	"ibhagwan/fzf-lua",
	event = "BufWinEnter",
	config = function()
		require("fzf-lua").setup({})
	end,
}
