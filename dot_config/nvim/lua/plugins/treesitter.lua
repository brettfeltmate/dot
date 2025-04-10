return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = true,
		event = "BufReadPre",
		config = function(_)
			require("nvim-treesitter.install").prefer_git = true
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"css",
					"cpp",
					"diff",
					"html",
					"javascript",
					"json",
					"julia",
					"latex",
					"lua",
					"luadoc",
					"markdown",
					"markdown_inline",
					"matlab",
					"ninja",
					"norg",
					"python",
					"r",
					"rnoweb",
					"regex",
					"rst",
					"scss",
					"stan",
					"svelte",
					"tmux",
					"toml",
					"tsx",
					"typescript",
					"typst",
					"vim",
					"vimdoc",
					"vue",
					"yaml",
				},
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
			vim.treesitter.language.register("markdown", "rmd")
			vim.treesitter.language.register("r", "R")
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.stan = {
				install_info = {
					url = "https://github.com/kingcol13/tree-sitter-stan.git",
					files = { "src/parser.c" },
					branch = "dev",
					generate_requires_npm = false,
					requires_generate_from_grammar = false,
				},
			}
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
