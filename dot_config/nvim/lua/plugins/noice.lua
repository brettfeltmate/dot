return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim" },
	config = function()
		require("noice").setup({
			view = "mini",
			hover = { enabled = true },
			lsp = {
				signature = { enabled = false },
				-- override markdown rendering so that cmp and other plugins use Treesitter
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			views = {
				cmdline_popup = {
					position = {
						row = 1,
						col = "100%",
					},
					size = {
						width = 80,
						height = "auto",
					},
				},
				popupmenu = {
					relative = "editor",
					position = {
						row = 4,
						col = "100%",
					},
					size = {
						width = 80,
						height = 8,
					},
					border = {
						style = "rounded",
						padding = { 0, 1 },
					},
					win_options = {
						winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
					},
				},
			},
			presets = { bottom_search = false },
		})
	end,
}
