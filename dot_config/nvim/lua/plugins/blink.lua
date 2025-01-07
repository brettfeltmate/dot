return {
	"saghen/blink.cmp",
	lazy = true,
	event = "VeryLazy",
	version = "v0.*",
	dependencies = {
		"saghen/blink.compat",
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = { library = { path = "luvit-meta/library", words = { "vim%.uv" } } },
		},
		{ "bilal2453/luvit-meta", lazy = true },
	},
	opts = {
		keymap = {
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-l>"] = { "accept", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },
			["<Tab>"] = { "snippet_forward", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-Up>"] = { "scroll_documentation_up", "fallback" },
			["<C-Down>"] = { "scroll_documentation_down", "fallback" },
		},
		completion = {
			trigger = {
				prefetch_on_insert = false,
				show_on_insert_on_trigger_character = false,
			},
			menu = {
				auto_show = true,
				border = "rounded",
				draw = {
					treesitter = { "lsp" },
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind" },
					},
				},
			},
			accept = { auto_brackets = { enabled = true } },
			documentation = { window = { border = "rounded" } },
			ghost_text = { enabled = false },
		},
		sources = {
			providers = {
				lsp = { fallbacks = { "lazydev" } },
				lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
			},
		},
		signature = {
			enabled = true,
			window = { border = "rounded" },
		},
	},
}
