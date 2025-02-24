return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	config = function()
		require("gitsigns").setup({
			numhl = true,
			signcolumn = false,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
				virt_text_priority = 100,
				use_focus = true,
			},
            preview_config = {
                border = 'rounded'
            }
		})
	end,
}
