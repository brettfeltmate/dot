return {
	"otavioschwanck/arrow.nvim",
	lazy = true,
	event = "UIEnter",
	dependencies = {
		{ "echasnovski/mini.icons" },
	},
	opts = {
		leader_key = "_",
		buffer_leader_key = "-",
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
		custom_actions = {
			open = function(target_file_name, current_file_name) end, -- target_file_name = file selected to be open, current_file_name = filename from where this was called
			split_vertical = function(target_file_name, current_file_name) end,
			split_horizontal = function(target_file_name, current_file_name) end,
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
