return {
	"ibhagwan/fzf-lua",
	event = "BufWinEnter",
	config = function()
		require("fzf-lua").setup({})
		require("fzf-lua").register_ui_select()
		-- -- Ensure fzf-lua is installed and required
		-- local fzf_lua = require("fzf-lua")
		--
		-- -- Set fzf-lua as the handler for vim.ui.select
		-- vim.ui.select = function(items, opts, on_choice)
		-- 	local options = opts or {}
		-- 	fzf_lua.fzf_select({
		-- 		prompt = options.prompt or "",
		-- 		format_item = options.format_item or tostring,
		-- 		items = items,
		-- 		callback = function(item)
		-- 			if item then
		-- 				on_choice(item)
		-- 			else
		-- 				on_choice(nil, "No item selected")
		-- 			end
		-- 		end,
		-- 	})
		-- end
	end,
}
