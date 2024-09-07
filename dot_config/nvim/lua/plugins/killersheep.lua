return {
	"seandewar/killersheep.nvim",
	lazy = true,
	cmd = "KillKillKill",
	config = function()
		require("killersheep").setup({
			gore = true,
			keymaps = {
				move_left = "a",
				move_right = "f",
				shoot = "<space>",
			},
		})
	end,
}
