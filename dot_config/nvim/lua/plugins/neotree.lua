return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = true,
	cmd = "Neotree",
	config = function()
		require("neo-tree").setup({
			sources = { "filesystem", "document_symbols", "buffers" },
			source_selector = {
				winbar = true,
				sources = {
					{ source = "filesystem", display_name = "   Files " },
					{ source = "document_symbols", display_name = "  Symbols " },
					{ source = "buffers", display_name = "  Buffers " },
				},
			},
		})
	end,
}
