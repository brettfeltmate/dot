return {
	"brenton-leighton/multiple-cursors.nvim",
	lazy = true,
	cmd = { "MultipleCursorsAddDown", "MultipleCursorsAddUp" },
	version = "*",
	opts = {
		pre_hook = function()
			vim.g.minipairs_disable = true
			require("nvim-autopairs").disable()
		end,
		post_hook = function()
			vim.g.minipairs_disable = false
			require("nvim-autopairs").enable()
		end,
	},
}
