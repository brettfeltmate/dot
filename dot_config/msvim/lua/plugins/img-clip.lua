return {
	"HakonHarnes/img-clip.nvim",
	event = "VeryLazy",
	config = function()
		require("img-clip").setup({
			default = {
				process_cmd = "convert - -resize 50% -",
			},
		})
	end,
}
