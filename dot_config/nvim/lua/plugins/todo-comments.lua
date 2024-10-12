-- Highlight todo, notes, etc in comments
return {
	{
		"folke/todo-comments.nvim",
		event = "BufReadPost",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = true },
		config = function()
			dofile(vim.g.base46_cache .. "todo")
			require("todo-comments").setup()
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
