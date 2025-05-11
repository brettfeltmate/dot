function _G.get_oil_winbar()
	local append = require("oil").get_current_dir()
	if not append then
		append = vim.api.nvim_buf_get_name(0)
	end
	return "Viewing: " .. vim.fn.fnamemodify(append, ":~")
end

return {
	"stevearc/oil.nvim",
	event = "VeryLazy",
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
			win_options = { winbar = "%!v:lua.get_oil_winbar()" },
		}
		return opts
	end,
}
