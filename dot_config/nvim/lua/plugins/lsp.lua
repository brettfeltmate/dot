-- LSPs, formatters, linters, etc.,
return {
	{ vim.diagnostic.config({ virtual_text = false }) },
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "whoissethdaniel/mason-tool-installer.nvim" },
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
		},
		config = function()
			local servers = {
				bashls = {},
				clangd = {},
				cssls = {},
				html = {},
				lua_ls = {},
				marksman = { filetypes = { "markdown", "rmarkdown", "quarto" } },
				pyright = {},
				r_language_server = { settings = { r = { lsp = { rich_documentation = true } } } },
				taplo = {},
				vtsls = {},
			}

			local ensure_installed = {
				"air",
				"bash-language-server",
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
				"ruff",
				"stylua",
				"vtsls",
			}

			require("mason").setup()

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			-- Function to preprocess R documentation HTML content
			-- local function preprocess_r_documentation(content)
			-- 	if type(content) == "table" then
			-- 		for i, line in ipairs(content) do
			-- 			-- Remove HTML span tags but keep content
			-- 			line = line:gsub('<span class="[^"]*">([^<]*)</span>', '`%1`')
			-- 			-- Convert HTML tables to markdown
			-- 			line = line:gsub('<table[^>]*>', '')
			-- 			line = line:gsub('</table>', '')
			-- 			line = line:gsub('<tr[^>]*>', '')
			-- 			line = line:gsub('</tr>', '')
			-- 			line = line:gsub('<td[^>]*>', '| ')
			-- 			line = line:gsub('</td>', ' ')
			-- 			-- Clean up other common HTML tags
			-- 			line = line:gsub('<[^>]*>', '')
			-- 			content[i] = line
			-- 		end
			-- 	end
			-- 	return content
			-- end

			-- Custom hover handler with R documentation preprocessing
			-- vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
			-- 	config = config or {}
			-- 	config.border = config.border or "rounded"
			-- 	config.max_width = config.max_width or 120
			-- 	config.max_height = config.max_height or 30
			--
			-- 	if not (result and result.contents) then
			-- 		return
			-- 	end
			--
			-- 	-- Check if this is from R language server and preprocess if needed
			-- 	local client = vim.lsp.get_client_by_id(ctx.client_id)
			-- 	if client and client.name == "r_language_server" then
			-- 		local contents = result.contents
			-- 		if contents and contents.value then
			-- 			local lines = vim.split(contents.value, '\n')
			-- 			lines = preprocess_r_documentation(lines)
			-- 			contents.value = table.concat(lines, '\n')
			-- 		end
			-- 	end
			--
			-- 	return vim.lsp.handlers.hover(_, result, ctx, config)
			-- end
			--
			-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			-- 	border = "rounded",
			-- 	close_events = { "CursorMoved", "BufHidden", "InsertCharPre" },
			-- })

			for server, config in pairs(servers or {}) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				require("lspconfig")[server].setup(config)
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
					command = "/Users/brettfeltmate/.config/R/rprettify",
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
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
