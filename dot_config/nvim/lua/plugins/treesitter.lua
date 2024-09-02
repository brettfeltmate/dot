return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "UIEnter",
	config = function(_)
		require("nvim-treesitter.install").prefer_git = true
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"ninja",
				"python",
				"r",
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
	end,
}
-- vim: ts=2 sts=2 sw=2 et
