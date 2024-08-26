return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		require("oil").setup({
			keymaps = {
				["<bs>"] = "actions.parent",
				["?"] = "actions.show_help",
				["q"] = "actions.close",
			},
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = false,
				natural_order = true,
			},
			win_options = {
				wrap = true,
			},
			float = {
				preview_split = "below",
			},
			preview = {
				max_width = 0.4,
				max_height = 0.8,
			},
		})
	end,
}
