return {
	"gennaro-tedesco/nvim-possession",
	dependencies = { "ibhagwan/fzf-lua" },
	lazy = false,
	config = function()
		require("nvim-possession").setup({
			autoload = true,
			autoswitch = { enable = true },
		})
	end,
}
