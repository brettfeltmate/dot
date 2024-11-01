if true then
	return {}
end
return {
	{
		"saghen/blink.cmp",
		lazy = true,
		event = "BufReadPre",
		version = "v0.*",
		dependencies = {
			{ "saghen/blink.compat", opts = { impersonate_nvim_cmp = true } },
			{ "rafamadriz/friendly-snippets" },
			{ "R-nvim/cmp-r", dependences = "R-nvim/R.nvim" },
			{ "zbirenbaum/copilot.lua", opts = { suggestion = { enable = false }, panel = { enable = false } } },
			{ "zbirenbaum/copilot-cmp", opts = { fix_pairs = false, auto_trigger = false } },
		},
		opts = { keymap = "default", signature_help = { enabled = true } },
		sources = {
			completion = { enabled_providers = { "lsp", "path", "buffer", "snippets", "lazydev", "copilot", "cmp_r" } },
			providers = {
				lazydev = { name = "lazydev", module = "blink.compat.source", score_offset = 3 },
				copilot = { name = "copilot", module = "blink.compat.source", score_offset = 2 },
				cmp_r = { name = "cmp_r", module = "blink.compat.source", score_offset = 3 },
			},
			windows = {
				autocomplete = { min_width = 15, max_height = 10, selection = "manual" },
				documentation = { min_width = 10, max_width = 60, max_height = 10, auto_show = true },
				signature_help = { min_width = 1, max_width = 100, max_height = 10, border = "single" },
			},
		},
	},
}
