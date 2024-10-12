-- LSP Configuration & Plugins
return {
	{ -- Annoying as fuck
		vim.diagnostic.config({ virtual_text = false }),
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "BufReadPre",
		config = function()
			require("tiny-inline-diagnostic").setup({
				options = {
					show_source = true,
					softwrap = 30,
				},
			})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "BufReadPre",
		config = function()
			require("lsp_signature").setup({
				floating_window = false,
				-- floating_window_above_current_line = true,
				hint_prefix = {
					above = "↙ ", -- when the hint is on the line above the current line
					current = "← ", -- when the hint is on the same line
					below = "↖ ", -- when the hint is on the line below the current line
				},
				toggle_key = "<M-x>",
			})
		end,
	},
	{
		event = "BufReadPre",
		"neovim/nvim-lspconfig",
		dependencies = {
			{ -- Automatically install LSPs and related tools to stdpath for Neovim
				"williamboman/mason.nvim",
				config = true, -- NOTE: Must be loaded before dependents
			},
			{ "williamboman/mason-lspconfig.nvim" },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },

			{ -- completion, annotations and signatures of Neovim apis
				"folke/neodev.nvim",
				lazy = true,
				opts = {
					library = {
						plugins = true,
					},
				},
			},
		},
		config = function()
			dofile(vim.g.base46_cache .. "lsp")
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
			capabilities = vim.tbl_deep_extend(
				"force",
				capabilities,
				-- require("cmp_nvim_lsp").default_capabilities(),
				require("lsp-file-operations").default_capabilities()
			)
			local servers = {
				ast_grep = {},
				bashls = {},
				clangd = {},
				html = {},
				jedi_language_server = {},
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
				marksman = {},
				markdownlint = {},
				matlab_ls = {},
				prettier = {},
				r_language_server = {},
				shellcheck = {},
				python_lsp_server = {},
				taplo = {},
			}

			dofile(vim.g.base46_cache .. "mason")
			require("mason").setup()

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"ast_grep",
				"bashls",
				"beautysh",
				"blue",
				"clangd",
				"html_lsp",
				"jedi_language_server",
				"lua_ls",
				"markdownlint",
				"markdownlint-cli2",
				"marksman",
				"matlab_ls",
				"prettier",
				"python_lsp_server",
				"r_language_server",
				"shellcheck",
				"stylua",
				"taplo",
			})
			require("mason-tool-installer").setup({
				ensure_installed = ensure_installed,
				automatic_installation = true,
			})

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
}
-- vim: ts=2 sts=2 sw=2 et
