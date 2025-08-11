-- Highlight todo, notes, etc in comments
return {
	{
		"folke/todo-comments.nvim",
		event = "BufReadPost",
		enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			signs = true,
			-- colors = {
			--   error = { "DiagnosticError", "ErrorMsg", "#826271" },
			--   warning = { "DiagnosticWarn", "WarningMsg", "#857061" },
			--   info = { "DiagnosticInfo", "#7a8187" },
			--   hint = { "DiagnosticHint", "#6a7c72" },
			--   default = { "Identifier", "#685b6f" },
			--   test = { "Identifier", "#6d8287" }
			-- },
		},
		config = function()
			-- dofile(vim.g.base46_cache .. "todo")
			require("todo-comments").setup()
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
