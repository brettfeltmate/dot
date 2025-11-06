return {
	"kevinhwang91/nvim-fundo",
	dependencies = "kevinhwang91/promise-async",
	enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	lazy = true,
	event = "BufReadPost",
	build = function()
		require("fundo").install()
	end,
}
