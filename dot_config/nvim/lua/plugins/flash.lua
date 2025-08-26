return {
	"folke/flash.nvim",
	lazy = true,
	event = "BufRead",
	---@type Flash.Config
	---@diagnostic disable: missing-fields
	opts = {
		search = {
			mode = function(str)
				return "\\<" .. str
			end,
		},
		label = {
			uppercase = false,
			current = false,
			after = false,
			before = true,
			style = "inline",
		},
		modes = {
			search = { enabled = false },
			char = {
				jump_labels = true,
				char_actions = function(motion)
					return {
						-- clever-f style
						[motion:lower()] = "next",
						[motion:upper()] = "prev",
					}
				end,
			},
		},
	},
}
