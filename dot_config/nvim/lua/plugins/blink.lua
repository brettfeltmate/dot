return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	version = "v0.*",
	enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	dependencies = {
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	opts = function(_, opts)
		opts.completion = {
			menu = {
				auto_show = true,
				border = "single",
				draw = {
					treesitter = { "lsp" },
					columns = {
						{ "label", "label_description", gap = 2 },
						{ "kind_icon", "kind", gap = 2 },
					},
				},
			},
			accept = { auto_brackets = { enabled = true } },
			ghost_text = { enabled = false },
			documentation = { auto_show = false },
		}

		opts.signature = {
			enabled = true,
			trigger = { enabled = true },
			window = { border = "single" },
		}

		opts.sources = vim.tbl_deep_extend("force", opts.sources or {}, {
			default = { "lazydev", "lsp", "buffer", "path" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
				lsp = {
					name = "lsp",
					module = "blink.cmp.sources.lsp",
					fallbacks = { "buffer" },
					max_items = 5,
					score_offset = 30,
				},
				buffer = {
					name = "Buffer",
					module = "blink.cmp.sources.buffer",
					max_items = 5,
					min_keyword_length = 2,
					score_offset = 25,
				},
				path = {
					name = "Path",
					module = "blink.cmp.sources.path",
					score_offset = 10,
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
			},
		})

		opts.cmdline = {
			enabled = true,
			keymap = { preset = "inherit" },
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
			completion = {
				list = { selection = { preselect = false, auto_insert = true } },
				menu = { auto_show = true },
			},
		}
		opts.keymap = {
			preset = "none",
			["<C-k>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-l>"] = { "accept", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<C-u>"] = { "scroll_documentation_up", "fallback" },
			["<C-d>"] = { "scroll_documentation_down", "fallback" },
			["<Tab>"] = {
				function()
					return vim.lsp.inline_completion.get()
				end,
				"fallback",
			},
		}
		return opts
	end,
}
