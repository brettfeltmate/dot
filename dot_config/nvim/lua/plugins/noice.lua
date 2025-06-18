---@diagnostic disable: missing-fields
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim" },
	config = function()
		require("noice").setup({
			view = "virtualtext",
			cmdline = { view = "cmdline" },
			hover = { enabled = true },
			routes = {
				{ view = "notify", filter = { event = "msg_showmode" } },
			},
		})
	end,
}
