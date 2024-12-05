return {
	"stevearc/oil.nvim",
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		require("oil").setup({
			keymaps = {
				["<bs>"] = "actions.parent",
				["?"] = "actions.show_help",
				["q"] = "actions.close",
				["gy"] = "actions.yank_entry",
				["gd"] = {
					function()
						require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
					end,
					desc = "Show file details",
				},
			},
			-- columns = { "icon", "permissions", "size", "mtime" },
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
		})
	end,
}
