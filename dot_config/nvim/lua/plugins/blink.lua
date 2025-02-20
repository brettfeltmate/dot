return {
	"saghen/blink.cmp",
	lazy = true,
	event = "VeryLazy",
	version = "v0.*",
	dependencies = {
		{ "saghen/blink.compat", lazy = true },
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = { library = { path = "luvit-meta/library", words = { "vim%.uv" } } },
		},
		{ "bilal2453/luvit-meta", lazy = true },
		{ "Kaiser-Yang/blink-cmp-dictionary", lazy = true },
		{ "mikavilpas/blink-ripgrep.nvim", lazy = true },
	},
	opts = function(_, opts)
		opts.completion = {
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
		}

		opts.signature = {
			enabled = false,
			window = { border = "rounded" },
		}

		opts.sources = vim.tbl_deep_extend("force", opts.sources or {}, {
			default = {
				"lsp",
				"buffer",
				"ripgrep",
				"path",
				"dictionary",
				"avante_commands",
				"avante_mentions",
				"avante_files",
			},
			providers = {
				avante_mentions = {
					name = "avante_mentions",
					module = "blink.compat.source",
					score_offset = 110,
					opts = {},
				},
				avante_files = {
					name = "avante_files",
					module = "blink.compat.source",
					score_offset = 100,
					opts = {},
				},
				avante_commands = {
					name = "avante_commands",
					module = "blink.compat.source",
					score_offset = 90,
					opts = {},
				},
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
				-- In macOS to get started with a dictionary:
				-- cp /usr/share/dict/words ~/.config/dictionary
				dictionary = {
					module = "blink-cmp-dictionary",
					name = "Dict",
					score_offset = 30,
					enabled = true,
					max_items = 8,
					min_keyword_length = 3,
					opts = {
						get_command = {
							"rg", -- make sure this command is available in your system
							"--color=never",
							"--no-line-number",
							"--no-messages",
							"--no-filename",
							"--ignore-case",
							"--",
							"${prefix}", -- this will be replaced by the result of 'get_prefix' function
							vim.fn.expand("~/.config/dictionary"), -- where you dictionary is
						},
						documentation = {
							enable = true, -- enable documentation to show the definition of the word
							get_command = {
								-- make sure "wn" is available in your system (brew install wordnet)
								"wn",
								"${word}", -- this will be replaced by the word to search
								"-over",
							},
						},
					},
				},
			},
			-- command line completion, thanks to dpetka2001 in reddit
			-- https://www.reddit.com/r/neovim/comments/1hjjf21/comment/m37fe4d/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
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
