return {
	"stevearc/oil.nvim",
	lazy = true,
	cmd = { "Oil" },
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
				padding = 2,
				max_width = 0.75,
				max_height = 0.75,
				border = "single",
			},
			preview_win = {
				preview_method = "load",
			},
		}
		return opts
	end,
}
