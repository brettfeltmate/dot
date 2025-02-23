-- LSPs, formatters, linters, etc.,
return {
	{ vim.diagnostic.config({ virtual_text = false }) },
	{
		"ray-x/lsp_signature.nvim",
		lazy = true,
		opts = {
			floating_window = false,
			hint_prefix = {
				above = "↙ ", -- when the hint is on the line above the current line
				current = "← ", -- when the hint is on the same line
				below = "↖ ", -- when the hint is on the line below the current line
			},
		},
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "LspAttach", -- Or `LspAttach`
		priority = 1000, -- needs to be loaded in first
		opts = {
			preset = "classic",
			options = { break_line = { enabled = true, after = 80 } },
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			{
				"williamboman/mason-lspconfig.nvim",
			},
			{ "whoissethdaniel/mason-tool-installer.nvim" },
		},
		config = function()
			local servers = {
				clangd = {},
				lua_ls = {},
				marksman = {},
				pyright = {},
				r_language_server = {},
				ruff = {},
				vtsls = {},
			}

			local ensure_installed = {
				"beautysh",
				"blue",
				"clangd",
				"debugpy",
				"lua-language-server",
				"luacheck",
				"markdownlint",
				"marksman",
				"prettier",
				"pyright",
				"r-languageserver",
				"ruff",
				"sqlfmt",
				"stylua",
				"vtsls",
			}

			require("mason").setup()

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			for server, config in pairs(servers or {}) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				config.on_attach = function(client, bufnr)
					require("lsp_signature").setup({
						floating_window = false,
						hint_prefix = {
							above = "↙ ", -- when the hint is on the line above the current line
							current = "← ", -- when the hint is on the same line
							below = "↖ ", -- when the hint is on the line below the current line
						},
					})
				end
				require("lspconfig")[server].setup(config)
			end
		end,
	},
	{
		"stevearc/conform.nvim",
		event = "BufWritepre",
		opts = {
			notify_on_error = true,
			formatters = {
				rprettify = {
					inherit = false,
					stdin = false,
					command = "/Users/brettfeltmate/.config/R/rprettify",
					args = { "$FILENAME" },
				},
			},
			formatters_by_ft = {
				sh = { "beautysh" },
				bash = { "beautysh" },
				zsh = { "beautysh" },
				lua = { "stylua" },
				json = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				python = { "ruff", "blue" },
				r = { "rprettify" },
				rmd = { "rprettify" },
				markdown = { "prettier" },
				sql = { "sqlfmt" },
			},
			format_on_save = nil,
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
