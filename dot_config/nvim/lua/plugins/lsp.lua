-- LSP Configuration & Plugins
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ -- Automatically install LSPs and related tools to stdpath for Neovim
				"williamboman/mason.nvim",
				config = true, -- NOTE: Must be loaded before dependents
			},
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			{ "j-hui/fidget.nvim", opts = {} }, -- Useful status updates for LSP.

			{ -- completion, annotations and signatures of Neovim apis
				"folke/neodev.nvim",
				opts = {
					library = {
						plugins = false,
					},
				},
			},
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("augrp-lsp-attach", { clear = true }),
				callback = function(event)
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						local highlight_augroup = vim.api.nvim_create_augroup("augrp-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("augrp-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "augrp-lsp-highlight", buffer = event2.buf })
							end,
						})
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
			local servers = {
				clangd = {},
				basedpyright = {},
				marksman = {},
				matlab_ls = {},
				r_language_server = {},
				rust_analyzer = {},
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
								showWord = "Disable",
								workspaceWord = false,
							},
							diagnostics = {
								globals = { "vim" },
								disable = { "missing-fields" },
							},
							hint = {
								enabled = true,
							},
						},
					},
				},
			}

			require("mason").setup()

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"clangd",
				"basedpyright",
				"blue",
				"marksman",
				"matlab_ls",
				"prettier",
				"r_language_server",
				"rust_analyzer",
				"stylua",
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
	{ -- NOTE: disabled for not playing nice with plugins below
		vim.diagnostic.config({ virtual_text = false }),
	},
	{ -- minimal & pleasent in-line rendering of LSP supplied diagnostic info
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		config = function()
			require("tiny-inline-diagnostic").setup({
				hi = { error = "DiagnosticsWarn" },
				break_line = { enable = true, after = 50 },
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
