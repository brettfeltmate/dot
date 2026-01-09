return {
	"gruvw/strudel.nvim",
	build = "npm install",
	cmd = "StrudelLaunch",
	config = function()
		require("strudel").setup()
	end,
}
