function _G.get_oil_winbar()
	local dir = require("oil").get_current_dir()
	if dir then
		return "Viewing: " .. vim.fn.fnamemodify(dir, ":~")
	else
		return "Viewing: " .. vim.api.nvim_buf_get_name(0)
	end
end

return {
	{
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
					["<C-f>"] = "actions.preview_scroll_down",
					["<C-b>"] = "actions.preview_scroll_up",
				},
				win_options = {
					winbar = "%!v:lua.get_oil_winbar()",
					signcolumn = "yes:2",
				},
			})
		end,
	},
	{
		"refractalize/oil-git-status.nvim",
		dependencies = { "stevearc/oil.nvim" },
		config = true,
	},
}
