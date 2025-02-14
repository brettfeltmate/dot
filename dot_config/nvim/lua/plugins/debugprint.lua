if true then
	return {}
end
return {
	"andrewferrier/debugprint.nvim",
	lazy = true,
	event = "BufRead",
	opts = function()
		local counter = 0

		local counter_func = function()
			counter = counter + 1
			return "[" .. tostring(counter) .. "]"
		end

		local opts = {
			keymaps = {
				normal = {
					plain_below = "g?p",
					plain_above = "g?P",
					variable_below = "",
					variable_above = "",
					variable_below_alwaysprompt = "g?v",
					variable_above_alwaysprompt = "g?V",
					textobj_below = "",
					textobj_above = "",
					toggle_comment_debug_prints = "g?t",
					delete_debug_prints = "g?d",
				},
				insert = {
					plain = "<C-G>p",
					variable = "<C-G>v",
				},
				visual = {
					variable_below_alwaysprompt = "g?v",
					variable_above_alwaysprompt = "g?V",
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
