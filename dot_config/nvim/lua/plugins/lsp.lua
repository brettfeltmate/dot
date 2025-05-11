-- LSPs, formatters, linters, etc.,
return {
	{ vim.diagnostic.config({ virtual_text = false }) },
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "LspAttach",
		priority = 1000,
		opts = {
			preset = "modern",
			transparent_bg = true,
			options = { break_line = { enabled = true, after = 45 } },
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "whoissethdaniel/mason-tool-installer.nvim" },
		},
		config = function()
			local servers = {
				clangd = {},
				cssls = {},
				html = {},
				lua_ls = {},
				marksman = { filetypes = { "markdown", "rmarkdown", "quarto" } },
				pyright = {},
				r_language_server = { settings = { r = { lsp = { rich_documentation = false } } } },
				taplo = {},
				vtsls = {},
			}

			local ensure_installed = {
				"air",
				"beautysh",
				"blue",
				"clangd",
				"debugpy",
				"lua-language-server",
				"markdownlint",
				"marksman",
				"prettier",
				"pyright",
				"r-languageserver",
				"stylua",
				"sqruff",
				"vtsls",
			}

			require("mason").setup()

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			for server, config in pairs(servers or {}) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				require("lspconfig")[server].setup(config)
			end
		end,
	},
	{
		"stevearc/conform.nvim",
		event = "BufRead",
		opts = {
			notify_on_error = true,
			formatters = {
				-- Because air doesn't handle rmarkdown yet
				my_styler = {
					command = "R",
					args = { "-s", "-e", "styler::style_file(commandArgs(TRUE)[1])", "--args", "$FILENAME" },
					stdin = false,
				},
			},
			formatters_by_ft = {
				sh = { "beautysh" },
				bash = { "beautysh" },
				css = { "prettier" },
				html = { "prettier" },
				scss = { "prettier" },
				zsh = { "beautysh" },
				lua = { "stylua" },
				json = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				python = { "blue" },
				r = { "air" },
				rmd = { "markdownlint", "my_styler" },
				rprofile = { "air" },
				markdown = { "markdownlint" },
				sql = { "sqruff" },
			},
			format_on_save = { timeout_ms = 3000 },
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
