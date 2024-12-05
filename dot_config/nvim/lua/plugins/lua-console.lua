return {
	"yarospace/lua-console.nvim",
	lazy = true,
	ft = "lua",
	keys = "`",
	opts = {
		window = {
			border = "rounded",
			height = 0.4,
		},
		mappings = {
			toggle = "`",
			quit = "q",
			eval = "<CR>",
			clear = "C",
			messages = "M",
			save = "S",
			load = "L",
			resize_up = "<C-Up>",
			resize_down = "<C-Down>",
			help = "H",
		},
	},
}
