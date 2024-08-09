return {
	"okuuva/auto-save.nvim",
	config = function()
		require("auto-save").setup({
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
