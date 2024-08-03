return {
	"ggandor/leap.nvim",
	dependencies = { "tpope/vim-repeat" },
	config = function()
		require("leap").setup({
			opts = { equivalence_classes = { " \t\r\n", "([{", "}])", "'\"`" } },
		})
	end,
}
