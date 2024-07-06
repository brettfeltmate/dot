return {
	"akinsho/toggleterm.nvim",
	version = "*",
	event = "VimEnter",
	cmd = "ToggleTerm",
	opts = {
		open_mapping = [[<c-/>]],
		direction = "float",
		hide_numbers = true,
		insert_mappings = true,
		terminal_mappings = true,
		start_in_insert = true,
		close_on_exit = true,
	},
	config = function(opts)
		require("toggleterm").setup(opts)
	end,
}
