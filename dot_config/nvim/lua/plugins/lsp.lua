-- LSPs, formatters, linters, etc.,
return {
	{ vim.diagnostic.config({ virtual_text = false }) },
	-- {
	-- 	"sontungexpt/better-diagnostic-virtual-text",
	-- 	lazy = true,
	-- 	event = "LspAttach",
	-- 	opts = { ui = { above = true, wrap_line_after = 999 } },
	-- 	config = function(_, opts)
	-- 		require("better-diagnostic-virtual-text").setup(opts)
	-- 	end,
	-- },
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			{
				"williamboman/mason-lspconfig.nvim",
			},
			{ "whoissethdaniel/mason-tool-installer.nvim" },
		},
		config = function()
			dofile(vim.g.base46_cache .. "lsp")
			dofile(vim.g.base46_cache .. "mason")

			local servers = {
				bashls = {},
				clangd = {},
				html = {},
				julials = {},
				lua_ls = {},
				marksman = {},
				matlab_ls = {
					cmd = { "matlab-language-server", "--stdio" },
					matlab = {
						indexWorkspace = true,
						installPath = "/Applications/MATLAB_R2024b.app",
            matlabConnectionTiming = "onStart",
            telemetry = true,
					},
					root_dir = function(fname)
						return require("lspconfig.util").find_git_ancestor(fname)
							or require("lspconfig.util").root_pattern("compile_commands.json")(fname)
							or require("lspconfig.util").root_pattern("Makefile")(fname)
							or require("lspconfig.util").root_pattern("xmake.lua")(fname)
					end,

					single_file_support = true,
				},
				pyright = {},
				r_language_server = {},
				ruff = {},
				taplo = {},
				ts_ls = {},
			}

			local ensure_installed = {
				"bash-language-server",
				"beautysh",
				"black",
				"clangd",
				"debugpy",
				"html-lsp",
				"julia-lsp",
				"lua-language-server",
				"luacheck",
				"markdownlint",
				"marksman",
				"matlab-language-server",
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
			format_on_save = nil,
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
