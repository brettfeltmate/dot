return {
	{ -- Highlight, edit, and navigate code
		event = "BufRead",
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"python",
				"r",
				"regex",
				"rust",
				"stan",
				"tmux",
				"vim",
				"vimdoc",
			},

			-- Autoinstall languages that are not installed
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		},
		config = function(_, opts)
			local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
			parser_configs.stan = {
				install_info = {
					url = "/opt/homebrew/lib/node_modules/@wardbrian/tree-sitter-stan",
					files = { "src/parser.c" },
					branch = "main",
				},
				filetype = "stan",
			}

			require("nvim-treesitter.install").prefer_git = true
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
