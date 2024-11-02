return {
	"otavioschwanck/arrow.nvim",
	lazy = true,
    event = "BufReadPre",
	dependencies = {
		{ "echasnovski/mini.icons" },
	},
	opts = {
		leader_key = "_",
		buffer_leader_key = "+",
		mappings = {
			edit = "e",
			delete_mode = "d",
			clear_all_items = "C",
			toggle = "s", -- used as save if separate_save_and_remove is true
			open_vertical = "v",
			open_horizontal = "h",
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
	},
}
