return {
	"folke/flash.nvim",
	lazy = true,
	-- event = "BufRead",
	enabled = false,
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
				jump_labels = false,
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
