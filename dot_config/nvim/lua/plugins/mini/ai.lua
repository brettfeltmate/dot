return {
	"echasnovski/mini.ai",
	event = "InsertEnter",
	dependencies = { "echasnovski/mini.extra" },
	config = function()
		local extras = require("mini.extra")

		require("mini.ai").setup({
			n_lines = 500,
			custom_textobjects = {
				B = extras.gen_ai_spec.buffer(),
				D = extras.gen_ai_spec.diagnostic(),
				I = extras.gen_ai_spec.indent(),
				L = extras.gen_ai_spec.line(),
				N = extras.gen_ai_spec.number(),
			},
		})
	end,
}
