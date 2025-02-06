function _G.get_oil_winbar()
	local dir = require("oil").get_current_dir()
	if dir then
		return "Viewing: " .. vim.fn.fnamemodify(dir, ":~")
	else
		return "Viewing: " .. vim.api.nvim_buf_get_name(0)
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
				["gs"] = {
					function()
						-- get the current directory
						local prefills = { paths = require("oil").get_current_dir() }

						local grug_far = require("grug-far")
						-- instance check
						if not grug_far.has_instance("explorer") then
							grug_far.open({
								instanceName = "explorer",
								prefills = prefills,
								staticTitle = "Find and Replace from Explorer",
							})
						else
							grug_far.open_instance("explorer")
							-- updating the prefills without clearing the search and other fields
							grug_far.update_instance_prefills("explorer", prefills, false)
						end
					end,
					desc = "oil: Search in directory",
				},
				["<S-Down>"] = "actions.preview_scroll_down",
				["<S-Up>"] = "actions.preview_scroll_up",
			},
			-- columns = { "icon", "permissions", "size", "mtime" },
			win_options = {
				winbar = "%!v:lua.get_oil_winbar()",
			},
		})
	end,
}
