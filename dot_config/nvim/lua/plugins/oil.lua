return {
	"stevearc/oil.nvim",
	lazy = true,
	cmd = { "Oil" },
	enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	opts = function()
		-- Custom function to open preview with dynamic split direction
		local function preview_dynamic_split()
			local width = vim.api.nvim_win_get_width(0)
			local height = vim.api.nvim_win_get_height(0)

			-- Choose split direction based on which dimension is larger
			if width > height then
				require("oil.actions").select.callback({ vertical = true })
			else
				require("oil.actions").select.callback({ horizontal = true })
			end
		end

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
				["<C-p>"] = {
					callback = preview_dynamic_split,
					desc = "Preview (dynamic split)",
				},
				["<C-f>"] = "actions.preview_scroll_down",
				["<C-b>"] = "actions.preview_scroll_up",
			},
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			constrain_cursor = "name",
			watch_for_changes = true,
			preview_win = { preview_method = "load" },
		}
		return opts
	end,
}
