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
	-- dependencies = { "MagicDuck/grug-far.nvim" },
	opts = function()
		-- local oil = require("oil")
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
				-- ["gs"] = {
				-- 	callback = function()
				-- 		-- get the current directory
				-- 		local prefills = { paths = oil.get_current_dir() }
				--
				-- 		local grug_far = require("grug-far")
				-- 		-- instance check
				-- 		if not grug_far.has_instance("explorer") then
				-- 			grug_far.open({
				-- 				instanceName = "explorer",
				-- 				prefills = prefills,
				-- 				staticTitle = "Find and Replace from Explorer",
				-- 			})
				-- 		else
				-- 			grug_far.open_instance("explorer")
				-- 			-- updating the prefills without clearing the search and other fields
				-- 			grug_far.update_instance_prefills("explorer", prefills, false)
				-- 		end
				-- 	end,
				-- 	desc = "oil: Search in directory",
				-- },
			},
			win_options = { winbar = "%!v:lua.get_oil_winbar()" },
		}
		return opts
	end,
}
