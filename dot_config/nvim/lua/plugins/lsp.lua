-- LSPs, formatters, linters, etc.,
return {
	{
		vim.diagnostic.config({
			virtual_text = {
				-- current_line = true,
				spacing = 4,
				source = "if_many",
				prefix = "●",
				virt_text_pos = "eol_right_align",
				severity = { min = vim.diagnostic.severity.WARN },
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "✘",
					[vim.diagnostic.severity.WARN] = "▲",
					[vim.diagnostic.severity.HINT] = "⚑",
					[vim.diagnostic.severity.INFO] = "",
				},
			},
			underline = false,
			update_in_insert = false,
			severity_sort = true,
		}),
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
			local ensure_installed = {
				"air",
				"bash-language-server",
				"beautysh",
				"blue",
				"clangd",
				"copilot-language-server",
				"debugpy",
				"lua-language-server",
				"markdownlint",
				"marksman",
				"prettier",
				"pyright",
				"r-languageserver",
				"ruff",
				"stylua",
				"vtsls",
			}

			require("mason").setup()

			-- Auto-enable inlay hints for supported servers
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("InlayHints", {}),
				callback = function(ev)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					if client and client.server_capabilities.inlayHintProvider then
						vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
					end
				end,
			})

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			-- Configure LSP hover window with borders
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
			})

			-- Optionally also configure signature help with borders
			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "rounded",
			})

			-- Enable LSP servers (configs are auto-discovered from lsp/ directory)
			local servers = {
				"bashls",
				"clangd",
				"cssls",
				"copilot-language-server",
				"html",
				"lua_ls",
				"marksman",
				"pyright",
				"r_language_server",
				"taplo",
				"vtsls",
			}

			for _, server in ipairs(servers) do
				vim.lsp.enable(server)
			end
		end,
	},
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {
			notify_on_error = true,
			formatters = {
				rprettify = {
					inherit = false,
					stdin = false,
					command = vim.fn.expand("~/.config/R/rprettify"),
					args = { "$FILENAME" },
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
				python = { "ruff", "blue" },
				r = { "air", "rprettify" },
				R = { "air", "rprettify" },
				rmd = { "rprettify", "markdownlint" },
				rprofile = { "air", "rprettify" },
				markdown = { "markdownlint" },
			},
			format_on_save = { timeout_ms = 5000 },
			injected = {
				options = {
					-- Map of treesitter language to file extension
					-- A temporary file name with this extension will be generated during formatting
					-- because some formatters care about the filename.
					lang_to_ext = {
						bash = "sh",
						javascript = "js",
						julia = "jl",
						latex = "tex",
						markdown = "md",
						python = "py",
						r = "r",
					},
				},
			},
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
