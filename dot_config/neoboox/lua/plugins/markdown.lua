return {
	"tadmccorkle/markdown.nvim",
  lazy = true,
	ft = { "markdown", "rmd", "md" },
	config = function()
		require("markdown").setup({
			on_attach = function(bufnr)
				local opts = function(desc)
					return { buffer = bufnr, desc = desc }
				end

				vim.keymap.set({ "n", "i" }, "<M-n>", "<cmd>MDListItemBelow<cr>", opts("Add item below"))
				vim.keymap.set({ "n", "i" }, "<M-p>", "<cmd>MDListItemAbove<cr>", opts("Add item above"))

				local toggle = function(key)
					return "<Esc>gv<Cmd>lua require('markdown.inline')" .. ".toggle_emphasis_visual'" .. key .. "'<cr>"
				end

				vim.keymap.set("x", "<C-b>", toggle("b"), opts("Toggle bold"))
				vim.keymap.set("x", "<C-i>", toggle("i"), opts("Toggle italics"))
			end,
		})
	end,
}
