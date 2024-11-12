return {
	"otavioschwanck/arrow.nvim",
	lazy = true,
    event = "BufReadPre",
	dependencies = {
		{ "echasnovski/mini.icons" },
	},
	opts = {
		leader_key = "M",
		buffer_leader_key = "m",
		mappings = {
			edit = "e",
			delete_mode = "D",
			clear_all_items = "C",
			toggle = "b", -- used as save if separate_save_and_remove is true
			open_vertical = "V",
			open_horizontal = "H",
			quit = "q",
			remove = "x", -- only used if separate_save_and_remove is true
			next_item = "]",
			prev_item = "[",
		},
		window = { -- controls the appearance and position of an arrow window (see nvim_open_win() for all options)
			relative = "cursor",
			width = "auto",
			height = "auto",
			row = 0,
			col = 0,
			border = "double",
		},
        index_keys = "asdfzxcvjkl"
	},
}
