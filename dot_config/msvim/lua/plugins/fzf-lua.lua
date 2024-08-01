return {
	"ibhagwan/fzf-lua",
	event = "BufWinEnter",
	config = function()
		require("fzf-lua").setup({})
		require("fzf-lua").register_ui_select()
	end,
}
