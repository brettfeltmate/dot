vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.cmd("norm! zz")
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { os.getenv("HOME") .. "/.local/share/chezmoi/*" },
	callback = function(ev)
		local bufnr = ev.buf
		local edit_watch = function()
			require("chezmoi.commands.__edit").watch(bufnr)
		end
		vim.schedule(edit_watch)
	end,
})

-- Disable LSP diagnostics for nav.md files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*/nav.md",
	callback = function()
		vim.diagnostic.enable(false, { bufnr = 0 })
	end,
})

vim.api.nvim_create_autocmd("UIEnter", {
	callback = function()
		require("base46").load_all_highlights()
	end,
})
