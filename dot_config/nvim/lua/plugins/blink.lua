return {
	"saghen/blink.cmp",
	lazy = true,
	event = "InsertEnter",
	version = "v0.*",
	dependencies = {
		"saghen/blink.compat",
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					path = "luvit-meta/library",
					words = { "vim%.uv" },
				},
			},
		},
		{ "bilal2453/luvit-meta", lazy = true },
	},
	opts = {
		nerd_font_variant = "mono",
		windows = {
			documentation = { auto_show = true, border = "single" },
			autocomplete = { border = "none" },
			ghost_text = { enabled = false },
		},
		keymap = {
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-h>"] = { "hide", "fallback" },
			["<C-l>"] = { "accept", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },
			["<Tab>"] = { "snippet_forward", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
		},
		sources = {
			completion = {
				enabled_providers = { "lsp", "path", "buffer", "lazydev" },
			},
			providers = {
				lsp = { fallback_for = { "lazydev" } },
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
				},
			},
		},
		-- signature = { enabled = true },
	},
	opts_extend = { "sources.completion.enabled_providers" },
}
