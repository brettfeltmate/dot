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
          "svelte",
					"tmux",
					"toml",
          "tsx",
          "typescript",
          "typst",
					"vim",
					"vimdoc",
          "vue",
					"yaml"
				},
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
			vim.treesitter.language.register("markdown", "rmd")
      vim.treesitter.language.register("r", "R")
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
