---@diagnostic disable: missing-fields
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim" },
	config = function()
		require("noice").setup({
			view = "virtualtext",
			cmdline = {
				view = "cmdline",
				format = {
					input = {
						view = "cmdline",
					},
				},
			},
			lsp = {
				signature = { enabled = false },
			},
			routes = {
				{ view = "notify", filter = { event = "msg_showmode" } },
			},
			presets = {
				lsp_doc_border = true,
			},
		})
	end,
}
