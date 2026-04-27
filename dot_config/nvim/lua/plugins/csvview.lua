return {
	"hat0uma/csvview.nvim",
	enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	ft = { "csv", "tsv" },
	cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
	opts = {
		parser = { comments = { "#", "//" } },
		keymaps = {
			-- Text objects for selecting fields
			textobject_field_inner = { "if", mode = { "o", "x" } },
			textobject_field_outer = { "af", mode = { "o", "x" } },
			-- Excel-like navigation:
			-- Use <Tab> and <S-Tab> to move horizontally between fields.
			-- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
			-- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
			jump_next_field_end = { "<C-f>", mode = { "n", "v" } },
			jump_prev_field_end = { "<C-b>", mode = { "n", "v" } },
			jump_next_row = { "<C-n>", mode = { "n", "v" } },
			jump_prev_row = { "<C-p>", mode = { "n", "v" } },
		},
	},
}
