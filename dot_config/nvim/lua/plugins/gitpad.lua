return {
	"yujinyuz/gitpad.nvim",
	lazy = true,
	event = "BufReadPre",
	opts = {
		title = "Notepad",
		on_attach = function(bufnr)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "<cmd>wq<cr>", { noremap = true, silent = true })
		end,
	},
	config = function(_, opts)
		require("gitpad").setup(opts)
	end,
}
