return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	version = "v0.*",
	enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	dependencies = {},
	opts = function(_, opts)
		opts.completion = {
			menu = {
				auto_show = true,
				border = "rounded",
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
			documentation = { auto_show = false, window = { border = "rounded" } },
		}

		opts.signature = {
			enabled = true,
			window = { border = "rounded" },
		}

		opts.sources = vim.tbl_deep_extend("force", opts.sources or {}, {
			default = { "lsp", "buffer", "path" },
			providers = {
				lsp = {
					name = "lsp",
					enabled = true,
					module = "blink.cmp.sources.lsp",
					fallbacks = { "buffer" },
					score_offset = 30,
				},
				buffer = {
					name = "Buffer",
					enabled = true,
					max_items = 3,
					module = "blink.cmp.sources.buffer",
					min_keyword_length = 2,
					score_offset = 20,
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
			["<C-h>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-l>"] = { "accept", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
		}
		return opts
	end,
}
