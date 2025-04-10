return {
	"hat0uma/csvview.nvim",
	opts = function()
		return {
			parser = { comments = { "#", "//", "--" } },
			keymaps = {
				jump_next_field_end = { "<Right>", mode = { "n", "v" } },
				jump_prev_field_end = { "<Left>", mode = { "n", "v" } },
				jump_next_row = { "<Down>", mode = { "n", "v" } },
				jump_prev_row = { "<Up>", mode = { "n", "v" } },
			},
			view = {
				min_column_width = 8,
				spacing = 4,
				display_mode = "border",
				header_lnum = 1,
			},
		}
	end,
	cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
}
