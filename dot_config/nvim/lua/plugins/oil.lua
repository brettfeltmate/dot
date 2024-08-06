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
				["<C-s>"] = "<cmd>oil.save()<cr>",
				["gd"] = function()
					require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
				end,
			},
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
		})
	end,
}
