return {
	"ibhagwan/fzf-lua",
	lazy = true,
	config = function()
		require("fzf-lua").setup({})
		require("fzf-lua").register_ui_select()
	end,
}
