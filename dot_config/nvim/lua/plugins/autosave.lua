return {
	"okuuva/auto-save.nvim",
	event = "InsertEnter",
    enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= 'true',
	config = function()
		require("auto-save").setup({
			debounce_delay = 5000,
			lockmarks = true,
			condition = function(buf)
				local fn = vim.fn
				local utils = require("auto-save.utils.data")

				if utils.not_in(fn.getbufvar(buf, "&filetype"), { "oil" }) then
					return true
				end
				return false
			end,
		})
	end,
}
