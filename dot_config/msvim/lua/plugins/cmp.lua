return {
	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				completion = { completeopt = "menu,menuone,noinsert" },

				mapping = cmp.mapping.preset.insert({
					["<S-Down>"] = cmp.mapping.select_next_item(),
					["<S-Up>"] = cmp.mapping.select_prev_item(),
					["<S-Left>"] = cmp.mapping.scroll_docs(-4),
					["<S-Right>"] = cmp.mapping.scroll_docs(4),
					["<S-Enter>"] = cmp.mapping.confirm({ select = true }),

					["<C-Space>"] = cmp.mapping.complete({}),
				}),
				sources = {
					{ name = "buffer" },
					{ name = "path" },
					{ name = "cmdline" },
					{ name = "nvim_lsp" },
				},
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
