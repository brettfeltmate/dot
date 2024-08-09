return {
	"ibhagwan/fzf-lua",
	lazy = true,
	config = function()
		require("fzf-lua").setup({
			files = {
				["ctrl-alt-q"] = require("fzf-lua.actions").file_sel_to_qf,
				["ctrl-alt-l"] = require("fzf-lua.actions").file_sel_to_ll,
			},
		})
		require("fzf-lua").register_ui_select()
	end,
}
