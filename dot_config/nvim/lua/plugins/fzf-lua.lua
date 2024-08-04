return {
	"ibhagwan/fzf-lua",
	lazy = true,
	config = function()
		require("fzf-lua").setup({ "fzf-native" })
		require("fzf-lua").register_ui_select()
	end,
}
