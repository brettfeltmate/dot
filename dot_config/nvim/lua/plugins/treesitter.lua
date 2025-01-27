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
      vim.treesitter.language.register("r", "R")
		end,
	},
	-- {
	-- 	"nvim-treesitter/nvim-treesitter-context",
	-- 	lazy = true,
	-- 	event = "BufReadPre",
	-- },
	{
		"aaronik/treewalker.nvim",
		lazy = true,
		event = "BufReadPre",
		opts = {
			highlight = true,
			highlight_duration = 100,
			highlight_group = "WinSeparator",
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
