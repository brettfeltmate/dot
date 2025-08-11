return {
	"andrewferrier/debugprint.nvim",
	event = "BufRead",
	enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	opts = function()
		local counter = 0

		local counter_func = function()
			counter = counter + 1
			return "[" .. tostring(counter) .. "]"
		end

		local opts = {
			keymaps = {
				normal = {
					plain_below = "gdp",
					plain_above = "gdP",
					variable_below = "gdv",
					variable_above = "gdV",
					variable_below_alwaysprompt = "",
					variable_above_alwaysprompt = "",
					surround_plain = "gdsp",
					surround_variable = "gdsv",
					surround_variable_alwaysprompt = "",
					textobj_below = "gdo",
					textobj_above = "gdO",
					textobj_surround = "gdso",
					toggle_comment_debug_prints = "",
					delete_debug_prints = "",
				},
				insert = {
					plain = "<C-G>p",
					variable = "<C-G>v",
				},
				visual = {
					variable_below = "gdv",
					variable_above = "gdV",
				},
			},
			commands = {
				toggle_comment_debug_prints = "ToggleCommentDebugPrints",
				delete_debug_prints = "DeleteDebugPrints",
				reset_debug_prints_counter = "ResetDebugPrintsCounter",
			},
			display_counter = counter_func,
		}
		return opts
	end,
}
