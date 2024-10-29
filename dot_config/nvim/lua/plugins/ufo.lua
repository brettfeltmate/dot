return {
	"kevinhwang91/nvim-ufo",
	lazy = true,
	event = "BufEnter",
	dependencies = { "kevinhwang91/promise-async", lazy = true },
	config = function()
		vim.o.foldcolumn = "0"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

		require("ufo").setup({
			-- Uncomment for treesitter based folds
			-- provider_selector = function(bufnr, filetype, buftype)
			-- 	return { "treesitter", "indent" }
			-- end,
		})
	end,
}
