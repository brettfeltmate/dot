return {
	"MagicDuck/grug-far.nvim",
	event = "BufReadPost",
	config = function()
		require("grug-far").setup({ windowCreationCommand = "tabnew %" })
	end,
}
