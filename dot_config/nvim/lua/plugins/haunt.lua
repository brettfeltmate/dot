return {
	"TheNoeTrevino/haunt.nvim",
	event = "BufRead",
	-- default config: change to your liking, or remove it to use defaults
	---@class HauntConfig
	opts = {
		sign_hl = "HauntAnnotation",
		annotation_prefix = "--| ",
		vert_text_pos = "eol",
	},
	init = function()
		local haunt = require("haunt.api")
		local haunt_picker = require("haunt.picker")
		local map = vim.keymap.set
		local prefix = "<leader>h"

		-- annotations
		map("n", prefix .. "a", function()
			haunt.annotate()
		end, { desc = "Annotate" })

		map("n", prefix .. "d", function()
			haunt.delete()
		end, { desc = "De-annotate" })

		map("n", prefix .. "q", function()
			haunt.to_quickfix()
		end, { desc = "qf annotations" })
	end,
}
