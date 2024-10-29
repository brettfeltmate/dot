return {
	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		lazy = true,
		event = "InsertEnter",
		dependencies = {
			-- additional deps for completion sources
			"hrsh7th/cmp-nvim-lsp",
			-- "hrsh7th/cmp-buffer",
			{
				"tzachar/cmp-fuzzy-buffer",
				dependencies = {
					{ "tzachar/fuzzy.nvim" },
					{ "romgrk/fzy-lua-native", run = "make" },
				},
			},
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			{
				"R-nvim/cmp-r",
				dependences = "R-nvim/R.nvim",
			},
			{
				"zbirenbaum/copilot.lua",
				cmd = "Copilot",
				config = function()
					require("copilot").setup({
						suggestion = { enabled = false },
						panel = { enabled = false },
					})
				end,
			},
			{
				"zbirenbaum/copilot-cmp",
				config = function()
					require("copilot_cmp").setup({ fix_pairs = false, auto_trigger = false })
				end,
			},
			{
				"onsails/lspkind.nvim",
			},
		},
		config = function()
			dofile(vim.g.base46_cache .. "cmp")
			-- See `:help cmp`
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			cmp.setup({
				completion = { completeopt = "menu,menuone,noinsert" },

				mapping = cmp.mapping.preset.insert({
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-p>"] = cmp.mapping.scroll_docs(-4),
					["<C-n>"] = cmp.mapping.scroll_docs(4),
					["<C-l>"] = cmp.mapping.confirm({ select = true }),

					-- Manually trigger a completion from nvim-cmp.
					-- Generally unnecessary
					["<C-Space>"] = cmp.mapping.complete({}),
				}),
				sources = {
					{ name = "copilot", group_index = 1, max_item_count = 1 },
					{ name = "nvim_lsp", group_index = 2, max_item_count = 3 },
					{ name = "fuzzy_buffer", group_index = 3, max_item_count = 3 },
					{ name = "cmp_r", group_index = 2, max_item_count = 3 },
					{ name = "path" },
					{ name = "cmdline", group_index = 6, max_item_count = 2 },
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol",
						maxwidth = { menu = 30, abbr = 30 },
						ellipsis_char = "...",
						show_labelDetails = true,
						before = function(entry, item)
							local menu_icon = {
								copilot = " ",
								nvim_lsp = " ",
								fuzzy_buffer = " ",
								cmp_r = " ",
								path = " ",
								cmdline = " ",
							}
							item.menu = menu_icon[entry.source.name]
							return item
						end,
					}),
				},
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
