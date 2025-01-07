function _G.get_oil_winbar()
	local dir = require("oil").get_current_dir()
	if dir then
		return vim.fn.fnamemodify(dir, ":~")
	else
		return vim.api.nvim_buf_get_name(0)
	end
end

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
			win_options = {
				winbar = "%!v:lua.get_oil_winbar()",
			},
		})
	end,
}
