return {
	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- additional deps for completion sources
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			{ "R-nvim/cmp-r", dependences = "R-nvim/R.nvim" },
			{
				"zbirenbaum/copilot-cmp",
				dependencies = "copilot.lua",
				config = function()
					require("copilot_cmp").setup()
				end,
			},
		},
		config = function()
			-- See `:help cmp`
			local cmp = require("cmp")

			cmp.setup({
				completion = { completeopt = "menu,menuone,noinsert" },

				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),

					-- Manually trigger a completion from nvim-cmp.
					-- Generally unnecessary
					["<C-Space>"] = cmp.mapping.complete({}),
				}),
				sources = {
					{ name = "copilot" },
					{ name = "buffer" },
					{ name = "nvim_lsp" },
					{ name = "cmp_r" },
					{ name = "path" },
					{ name = "cmdline" },
				},
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
