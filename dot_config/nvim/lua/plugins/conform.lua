vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

return { -- Autoformat
	"stevearc/conform.nvim",
	event = "BufReadPre",
	config = function()
		require("conform").setup({
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
				bash = { "beautysh", "shfmt" },
				lua = { "stylua" },
				python = { "ruff", "blue" },
				r = { "rprettify" },
				rmd = { "rprettify", "prettier" },
				markdown = { "prettier" },
			},
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 3000,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
		})
	end,
}
-- vim: ts=2 sts=2 sw=2 et
