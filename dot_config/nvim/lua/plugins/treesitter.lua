return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPre",
		config = function(_)
			dofile(vim.g.base46_cache .. "treesitter")
			require("nvim-treesitter.install").prefer_git = true
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"html",
					"latex",
					"lua",
					"luadoc",
					"markdown",
					"markdown_inline",
					"ninja",
					"python",
					"r",
					"rnoweb",
					"regex",
					"rst",
					"tmux",
					"toml",
					"vim",
					"vimdoc",
					"yaml",
				},
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})

			vim.treesitter.language.register("markdown", "rmd")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufReadPre",
	},
}
-- vim: ts=2 sts=2 sw=2 et
