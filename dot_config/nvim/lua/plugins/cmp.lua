return {
	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- additional deps for completion sources
			"hrsh7th/cmp-nvim-lsp",
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
					require("copilot_cmp").setup({ fix_pairs = false })
				end,
			},
		},
		config = function()
			-- See `:help cmp`
			local cmp = require("cmp")

			cmp.setup({
				completion = { completeopt = "menu,menuone,noinsert" },

				mapping = cmp.mapping.preset.insert({
					["<S-Down>"] = cmp.mapping.select_next_item(),
					["<S-Up>"] = cmp.mapping.select_prev_item(),
					["<S-Left>"] = cmp.mapping.scroll_docs(-4),
					["<S-Right>"] = cmp.mapping.scroll_docs(4),
					["<S-Enter>"] = cmp.mapping.confirm({ select = true }),

					-- Manually trigger a completion from nvim-cmp.
					-- Generally unnecessary
					["<C-Space>"] = cmp.mapping.complete({}),
				}),
				sources = {
					{ name = "copilot" },
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = "cmdline" },
					{ name = "cmp_r" },
				},
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
