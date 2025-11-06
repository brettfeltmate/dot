return {
	"andrewferrier/debugprint.nvim",
	event = "BufRead",
	enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	opts = function()
		local opts = {
			keymaps = {
				normal = {
					plain_above = "gdpa",
					plain_below = "gdpb",
					surround_plain = "gdps",
					variable_above = "gdva",
					variable_below = "gdvb",
					surround_variable = "gdvs",
					variable_below_alwaysprompt = "",
					variable_above_alwaysprompt = "",
					surround_variable_alwaysprompt = "",
					textobj_above = "gdoa",
					textobj_below = "gdob",
					textobj_surround = "gdos",
					toggle_comment_debug_prints = "gdC",
					delete_debug_prints = "gdD",
				},
				insert = {
					plain = "<C-G>p",
					variable = "<C-G>v",
				},
				visual = {
					variable_above = "gdva",
					variable_below = "gdvb",
				},
			},
			commands = {
				toggle_comment_debug_prints = "CommentDebugs",
				delete_debug_prints = "DeleteDebugs",
				reset_debug_prints_counter = "ResetDebugs",
			},
			print_tag = "DEBUG",
		}
		return opts
	end,
}
