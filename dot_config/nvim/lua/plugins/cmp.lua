if true then
	return {}
end

return {
	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		lazy = true,
		event = "InsertEnter",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "onsails/lspkind.nvim" },
			{ "rafamadriz/friendly-snippets" },
			-- {
			-- 	"R-nvim/cmp-r",
			-- 	dependences = "R-nvim/R.nvim",
			-- },
			{
				"zbirenbaum/copilot.lua",
				cmd = "Copilot",
				opts = {
					panel = { enabled = false },
					suggestion = { enabled = false },
				},
			},
			{ "zbirenbaum/copilot-cmp", opts = { fix_pairs = false } },
			{
				"tzachar/cmp-fuzzy-buffer",
				dependencies = {
					{ "tzachar/fuzzy.nvim" },
					{ "romgrk/fzy-lua-native", run = "make" },
				},
			},
		},
		config = function()
			dofile(vim.g.base46_cache .. "cmp")

			local cmp = require("cmp")
			local lspkind = require("lspkind")

			cmp.setup({
				completion = { completeopt = "menu,menuone,noinsert", keyword_length = 1 },
				mapping = {
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-p>"] = cmp.mapping.scroll_docs(-4),
					["<C-n>"] = cmp.mapping.scroll_docs(4),
					["<C-l>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete({}),
					-- ["<Tab>"] = { "snippet_forward", "fallback" },
					-- ["<S-Tab>"] = { "snippet_backward", "fallback" },
				},
				sources = {
					{ name = "nvim_lsp", group_index = 2, max_item_count = 3, priority = 2 },
					-- { name = "cmp_r", group_index = 2, max_item_count = 3 },
					{ name = "copilot", group_index = 2, max_item_count = 2, priority = 1 },
					{ name = "fuzzy_buffer", group_index = 2, max_item_count = 5, priority = 2 },
					{ name = "cmdline", group_index = 2, max_item_count = 3, priority = 3 },
					{ name = "path", group_index = 2, max_item_count = 3, priority = 3 },
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol",
						maxwidth = { menu = 30, abbr = 30 },
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
