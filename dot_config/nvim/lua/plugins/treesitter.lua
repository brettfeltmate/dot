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
					"latex",
					"lua",
					"luadoc",
					"markdown",
					"markdown_inline",
					"python",
					"r",
					"rnoweb",
					"regex",
					"rst",
					"stan",
					"typescript",
					"vim",
					"vimdoc",
				},
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
			vim.treesitter.language.register("markdown", "rmd")
			vim.treesitter.language.register("r", "R")
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			---@diagnostic disable-next-line: inject-field
			parser_config.stan = {
				-- NOTE: This will fail when installing treesitter. Reload nvim and run :TSInstall stan
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
