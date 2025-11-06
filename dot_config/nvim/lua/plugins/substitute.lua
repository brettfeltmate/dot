return {
	"gbprod/substitute.nvim",
	dependencies = { "rachartier/tiny-glimmer.nvim" },
	event = "BufRead",
	opts = function()
		local o = {
			on_substitute = require("tiny-glimmer.support.substitute").substitute_cb,
			yank_substituted_text = false,
			preserve_cursor_position = false,
			modifiers = nil,
			highlight_substituted_text = { enabled = false },
			range = {
				prefix = "x",
				prompt_current_text = false,
				confirm = false,
				complete_word = false,
				subject = nil,
				range = nil,
				suffix = "",
				auto_apply = false,
				cursor_position = "end",
			},
			exchange = {
				motion = false,
				use_esc_to_cancel = true,
				preserve_cursor_position = false,
			},
		}
		return o
	end,
	config = true,
}
