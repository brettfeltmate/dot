return {
	"folke/noice.nvim",
	event = "UIEnter",
    dependencies = { "MunifTanjim/nui.nvim" },
	config = function()
		require("noice").setup({
			view = "virtualtext",
            cmdline = { view = "cmdline" },
            popupmenu = { backend = "nui" },
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
		})
	end,
}
