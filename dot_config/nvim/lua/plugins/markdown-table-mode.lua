return {
	"Kicamon/markdown-table-mode.nvim",
	lazy = true,
	ft = { "markdown", "rmd" },
	config = function()
		require("markdown-table-mode").setup()
	end,
}
