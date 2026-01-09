return {
	"tanvirtin/vgit.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "echasnovski/mini.icons" },
	event = "VeryLazy",
	opts = {
		live_blame = { enabled = false },
	},
	config = function(_, opts)
		require("vgit").setup(opts)
		-- VGit highlights are now defined in lua/themes/amber.lua
	end,
}
