return {
	{ -- Autoformat
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = true,
			format_on_save = function(bufnr)
				-- Disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. You can add additional
				-- languages here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true, r = true }
				return {
					timeout_ms = 3000,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters = {
				rprettify = {
					inherit = false,
					stdin = false,
					command = "/Users/brettfeltmate/.config/R/rprettify",
					args = { "$FILENAME" },
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "blue" },
				r = { "rprettify" },
				rmd = { "rprettify" },
			},
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
