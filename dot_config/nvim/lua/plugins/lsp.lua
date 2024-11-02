-- LSPs, formatters, linters, etc.,
return {
	{ vim.diagnostic.config({ virtual_text = true }) },
	{
		"ray-x/lsp_signature.nvim",
		event = "BufReadPre",
		opts = { floating_window = false },
	},
	{
		event = "BufRead",
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "whoissethdaniel/mason-tool-installer.nvim" },
			{ "antosha417/nvim-lsp-file-operations" },
			{ "folke/neodev.nvim", lazy = true, opts = { library = { plugins = true } } },
		},
		config = function()
			dofile(vim.g.base46_cache .. "lsp")
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			-- (nvim-ufo) Get folds from LSP
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

			-- cmp.nvim, comment out if using blink.cmp
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
			-- LSP driven file operations (used by nvim-tree)
			capabilities =
				vim.tbl_deep_extend("force", capabilities, require("lsp-file-operations").default_capabilities())

			dofile(vim.g.base46_cache .. "mason")

			require("mason").setup()

			require("mason-tool-installer").setup({
				ensure_installed = {
					"bash-language-server",
					"beautysh",
					"blue",
					"clangd",
					"jedi-language-server",
					"lua-language-server",
					"luacheck",
					"markdownlint",
					"marksman",
					"matlab-language-server",
					"prettier",
					"r-languageserver",
					"ruff",
					"shellcheck",
					"sqlfmt",
					"stylua",
					"taplo",
				},
			})

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = "BufReadPre",
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
				python = { "blue" },
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
