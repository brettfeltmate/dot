---@diagnostic disable: missing-fields
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim" },
	enabled = true,
	config = function()
		require("noice").setup({
			cmdline = { view = "cmdline" },
			lsp = {
				hover = {
					enabled = true,
					silent = true,
				},
				signature = {
					enabled = true,
					auto_open = { enabled = false },
				},
				documentation = {
					view = "hover",
					opts = {
						lang = "markdown",
						replace = true,
						render = "markdown",
						format = { "{message}" },
						win_options = { concealcursor = "n", conceallevel = 3 },
					},
				},
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				lsp_doc_border = true,
			},
		})
	end,
}
