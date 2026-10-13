-- LSPs, formatters, linters, etc.,
return {
	{
		vim.diagnostic.config({
			virtual_text = false,
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
				"alejandra",
				"bash-language-server",
				"beautysh",
				"blue",
				"css-lsp",
				"clangd",
				"copilot-language-server",
				"debugpy",
				"lua-language-server",
				"markdownlint",
				"marksman",
				"prettier",
				"pyright",
				"r-languageserver",
				"rnix-lsp",
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
				"rnix-lsp",
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
				my_styler = {
					command = "R",
					-- A list of strings, or a function that returns a list of strings
					-- Return a single string instead of a list to run the command in a shell
					args = { "-s", "-e", "styler::style_file(commandArgs(TRUE)[1])", "--args", "$FILENAME" },
					stdin = false,
				},
			},
			formatters_by_ft = {
				bash = { "beautysh" },
				css = { "prettier" },
				html = { "prettier" },
				javascript = { "prettier" },
				json = { "prettier" },
				less = { "prettier" },
				lua = { "stylua" },
				markdown = { "markdownlint" },
				nix = { "alejandra" },
				python = { "ruff", "blue" },
				r = { "styler" },
				rprofile = { "styler" },
				rmd = { "styler" },
				scss = { "prettier" },
				sh = { "beautysh" },
				typescript = { "prettier" },
				zsh = { "beautysh" },
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
						less = "less",
					},
				},
			},
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
