return {
	"gruvw/strudel.nvim",
	build = "npm install",
	enabled = false,
	cmd = "StrudelLaunch",
	config = function()
		require("strudel").setup()
	end,
}
