return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	version = "v0.*",
	enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	dependencies = {
		{ "saghen/blink.compat" },
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = { library = { path = "luvit-meta/library", words = { "vim%.uv" } } },
		},
		{ "bilal2453/luvit-meta" },
		{ "Kaiser-Yang/blink-cmp-dictionary" },
		{ "mikavilpas/blink-ripgrep.nvim" },
	},
	opts = function(_, opts)
		opts.completion = {
			trigger = {
				prefetch_on_insert = true,
				show_on_insert_on_trigger_character = true,
			},
			menu = {
				auto_show = true,
				border = "rounded",
				draw = {
					treesitter = { "lsp" },
					columns = {
						{ "label", "label_description", gap = 2 },
						{ "kind_icon", "kind" },
					},
				},
			},
			accept = { auto_brackets = { enabled = true } },
			documentation = { window = { border = "rounded" } },
		}

		opts.signature = { enabled = false }

		opts.sources = vim.tbl_deep_extend("force", opts.sources or {}, {
			default = {
				"lsp",
				"buffer",
				"ripgrep",
				"path",
				"dictionary",
			},
			providers = {
				lsp = {
					name = "lsp",
					enabled = true,
					module = "blink.cmp.sources.lsp",
					fallbacks = { "buffer" },
					score_offset = 80, -- the higher the number, the higher the priority
				},
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 70,
					enabled = true,
					max_items = 3,
					min_keyword_length = 4,
				},
				ripgrep = {
					module = "blink-ripgrep",
					name = "Ripgrep",
					opts = {
						project_root_marker = { ".git", ".rproj", ".here" },
					},
					score_offset = 60,
				},
				buffer = {
					name = "Buffer",
					enabled = true,
					max_items = 3,
					module = "blink.cmp.sources.buffer",
					min_keyword_length = 3,
					score_offset = 50,
				},
				path = {
					name = "Path",
					module = "blink.cmp.sources.path",
					score_offset = 40,
					fallbacks = { "buffer" },
					opts = {
						trailing_slash = false,
						label_trailing_slash = true,
						get_cwd = function(context)
							return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
						end,
						show_hidden_files_by_default = true,
					},
				},
				dictionary = {
					module = "blink-cmp-dictionary",
					name = "Dict",
					score_offset = 30,
					enabled = true,
					max_items = 8,
					min_keyword_length = 3,
					opts = {
						get_command = {
							"rg",
							"--color=never",
							"--no-line-number",
							"--no-messages",
							"--no-filename",
							"--ignore-case",
							"--",
							"${prefix}",
							vim.fn.expand("~/.config/dictionary"),
						},
						documentation = {
							enable = true,
							get_command = {
								"wn",
								"${word}",
								"-over",
							},
						},
					},
				},
			},
		})

		opts.cmdline = {
			sources = function()
				local type = vim.fn.getcmdtype()
				if type == "/" or type == "?" then
					return { "buffer" }
				end
				if type == ":" then
					return { "cmdline" }
				end
				return {}
			end,
		}
		opts.keymap = {
			preset = "default",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-l>"] = { "accept", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },
			["<Tab>"] = { "snippet_forward", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-Up>"] = { "scroll_documentation_up", "fallback" },
			["<C-Down>"] = { "scroll_documentation_down", "fallback" },
		}
		return opts
	end,
}
