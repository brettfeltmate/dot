return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = true,
	cmd = "Neotree",
	config = function()
		require("neo-tree").setup({
			sources = {
				"filesystem",
				"document_symbols",
				"git_status",
				"buffers",
			},
			source_selector = {
				winbar = true,
				sources = {
					{
						source = "filesystem", -- string
						display_name = "   Files ", -- string | nil
					},
					{
						source = "document_symbols",
						display_name = "  Symbols ",
					},
					{
						source = "git_status", -- string
						display_name = " 󰊢 Git ", -- string | nil
					},
					{
						source = "buffers", -- string
						display_name = "  Buffers ", -- string | nil
					},
				},
			},
		})
	end,
}
