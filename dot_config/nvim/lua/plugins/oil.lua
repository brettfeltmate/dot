return {
	"stevearc/oil.nvim",
	event = "VeryLazy",
	enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	opts = function()
		local opts = {
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
				["<C-f>"] = "actions.preview_scroll_down",
				["<C-b>"] = "actions.preview_scroll_up",
			},
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			constrain_cursor = "name",
			watch_for_changes = true,
			float = {
				max_width = 0.8,
				max_height = 0.8,
			},
			-- preview_win = {
			-- 	preview_method = "load",
			-- },
		}
		return opts
	end,
}
