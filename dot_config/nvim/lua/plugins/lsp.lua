-- LSPs, formatters, linters, etc.,
return {
	{ vim.diagnostic.config({ virtual_text = false }) },
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "LspAttach", -- Or `LspAttach`
		priority = 1000, -- needs to be loaded in first
		opts = {
			blend = { factor = 0.35 },
			options = {
				softwrap = 20,
				format = function(diagnostic)
					return diagnostic.message .. " |" .. diagnostic.source .. "|"
				end,
				severity = {
					vim.diagnostic.severity.ERROR,
					vim.diagnostic.severity.WARN,
					vim.diagnostic.severity.INFO,
					vim.diagnostic.severity.HINT,
				},
			},
		},
		config = function(_, opts)
			require("tiny-inline-diagnostic").setup(opts)
		end,
	},
	{
		event = "VeryLazy",
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			{
				"williamboman/mason-lspconfig.nvim",
			},
			{ "whoissethdaniel/mason-tool-installer.nvim" },
			{ "antosha417/nvim-lsp-file-operations" },
		},
		config = function()
			dofile(vim.g.base46_cache .. "lsp")
			dofile(vim.g.base46_cache .. "mason")

			local capabilities = vim.lsp.protocol.make_client_capabilities()

			-- cmp.nvim, comment out if using blink.cmp
			-- capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
			-- require("mason-lspconfig").setup_handlers({
			-- 	function(server_name)
			-- 		require("lspconfig")[server_name].setup({})
			-- 	end,
			-- })

			-- LSP driven file operations (used by nvim-tree)
			capabilities =
				vim.tbl_deep_extend("force", capabilities, require("lsp-file-operations").default_capabilities())

			-- (nvim-ufo) Get folds from LSP
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

			local servers = {
				bashls = {},
				clangd = {},
				html = {},
				-- jedi_language_server = {},
				julials = {},
				lua_ls = {},
				marksman = {},
				matlab_ls = {},
				pyright = {},
				-- basedpyright = {
				-- 	{
				-- 		basedpyright = {
				-- 			analysis = {
				-- 				autoSearchPaths = true,
				-- 				diagnosticMode = "openFilesOnly",
				-- 				useLibraryCodeForTypes = true,
				-- 			},
				-- 		},
				-- 	},
				-- },
				-- pylsp = {
				-- 	plugins = {
				-- 		-- Refactoring plugins
				-- 		rope = { enabled = true },
				-- 		pylsp_rope = { enabled = true },
				-- 		rope_completion = { enabled = true },
				-- 		rope_autoimport = { enabled = true },
				-- 		rope_rename = { enabled = false },
				--
				-- 		-- Code quality plugins
				-- 		pycodestyle = { enabled = true },
				-- 		pyflakes = { enabled = true },
				-- 		pylint = { enabled = false }, -- Using ruff instead
				-- 	},
				-- 	settings = {
				-- 		rope = {
				-- 			extensionModules = {},
				-- 			ropeFolder = { ".ropeproject", "src" },
				-- 		},
				-- 	},
				-- },
				r_language_server = {},
				ruff = {},
				taplo = {},
				ts_ls = {},
			}

			local ensure_installed = {
				-- "basedpyright",
				"bash-language-server",
				"beautysh",
				-- "blue",
				"black",
				"clangd",
				"html-lsp",
				-- "jedi-language-server",
				"julia-lsp",
				"lua-language-server",
				"luacheck",
				"markdownlint",
				"marksman",
				"matlab-language-server",
				-- "python-lsp-server",
				"prettier",
				"pyright",
				"r-languageserver",
				"ruff",
				"shellcheck",
				"sqlfmt",
				"stylua",
				"taplo",
				"typescript-language-server",
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
				python = { "ruff", "black" },
				r = { "rprettify" },
				rmd = { "rprettify" },
				markdown = { "prettier" },
				sql = { "sqlfmt" },
			},
			format_on_save = { timeout_ms = 2000 },
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
