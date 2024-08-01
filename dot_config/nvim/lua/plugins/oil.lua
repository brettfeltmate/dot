return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		require("oil").setup({
			keymaps = {
				["<bs>"] = "actions.parent",
				["?"] = "actions.show_help",
				["<C-v>"] = {
					"actions.select",
					opts = { vertical = true },
					desc = "Open the entry in a vertical split",
				},
			},
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = false,
				natural_order = true,
				is_always_hidden = function(name, _)
					return name == ".." or name == ".git"
				end,
			},
			win_options = {
				wrap = true,
			},
			preview = {
				max_width = 0.4,
				max_height = 0.8,
			},
		})
	end,
}
