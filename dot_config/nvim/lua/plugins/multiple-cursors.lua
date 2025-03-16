return {
	"brenton-leighton/multiple-cursors.nvim",
	lazy = true,
	cmd = { "MultipleCursorsAddDown", "MultipleCursorsAddUp" },
	version = "*",
	opts = {
		pre_hook = function()
			vim.g.minipairs_disable = true
		end,
		post_hook = function()
			vim.g.minipairs_disable = false
		end,
	},
}
