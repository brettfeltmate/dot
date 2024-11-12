-- LSPs, formatters, linters, etc.,
return {
	{ vim.diagnostic.config({ virtual_text = true }) },
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = { floating_window = false },
	},
	{
		event = "BufReadPre",
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
			capabilities = vim.tbl_deep_extend(
        "force",
        capabilities,
        require("lsp-file-operations").default_capabilities()
      )

			-- (nvim-ufo) Get folds from LSP
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

      local servers = {
        bashls = {},
        clangd = {},
        html = {},
        jedi_language_server = {},
        julials = {},
        lua_ls = {},
        marksman = {},
        matlab_ls = {},
        r_language_server = {},
        taplo = {},
        ts_ls = {},
      }

      local ensure_installed = {
        "bash-language-server",
        "beautysh",
        "blue",
        "clangd",
        "html-lsp",
        "jedi-language-server",
        "julia-lsp",
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
