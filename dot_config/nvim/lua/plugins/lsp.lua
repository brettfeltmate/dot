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
			preset = "modern",
			transparent_bg = true,
			-- hi = { background = "None" },
			options = { break_line = { enabled = true, after = 45 } },
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
				cssls = {},
				lua_ls = {},
				marksman = {
					filetypes = { "markdown", "rmarkdown", "quarto" },
				},
				pyright = {},
				r_language_server = {
					settings = {
						r = {
							lsp = {
								rich_documentation = false,
							},
						},
					},
				},
				-- stan_language_server = {},
				ruff = {},
				taplo = {},
				vtsls = {},
			}

			local ensure_installed = {
				"beautysh",
				"blue",
				"clangd",
				"css-lsp",
				"debugpy",
				"lua-language-server",
				"luacheck",
				"markdownlint",
				"marksman",
				"mdslw",
				"prettier",
				"pyright",
				"r-languageserver",
				"ruff",
				"sqlfmt",
				"stylua",
				"taplo",
				"vtsls",
			}

			require("mason").setup()

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			-- -- Add custom config for stan_language_server
			-- local lspconfig = require("lspconfig")
			-- local configs = require("lspconfig.configs")
			--
			-- if not configs.stan_language_server then
			-- 	configs.stan_language_server = {
			-- 		default_config = {
			-- 			cmd = { "stan-language-server" },
			-- 			filetypes = { "stan" },
			-- 			root_dir = function(fname)
			-- 				return vim.fs.dirname(vim.fs.find({ ".git" }, { path = fname, upward = true })[1])
			-- 			end,
			-- 			single_file_support = true,
			-- 		},
			-- 	}
			-- end
			-- lspconfig.stan_language_server.setup({})

			for server, config in pairs(servers or {}) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				config.on_attach = function(_, _)
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
		event = "BufRead",
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
				css = { "prettier" },
				scss = { "prettier" },
				zsh = { "beautysh" },
				lua = { "stylua" },
				json = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				python = { "ruff", "blue" },
				r = { "rprettify" },
				rmd = { "rprettify" },
				rprofile = { "rprettify" },
				markdown = { "prettier", "markdownlint", "mdslw" },
				sql = { "sqlfmt" },
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 10000,
			},
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
