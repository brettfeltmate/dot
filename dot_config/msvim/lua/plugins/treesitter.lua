return {
	{ -- Highlight, edit, and navigate code
		event = "BufRead",
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"html",
				"latex",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"regex",
				"vim",
				"vimdoc",
			},

			-- Autoinstall languages that are not installed
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		},
		config = function(_, opts)
			require("nvim-treesitter.install").prefer_git = true
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
