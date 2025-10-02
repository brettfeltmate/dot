return {
	"kevinhwang91/nvim-fundo",
	dependencies = "kevinhwang91/promise-async",
	lazy = true,
	event = "BufReadPost",
	build = function()
		require("fundo").install()
	end,
}
