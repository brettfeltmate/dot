-- Center view when entering insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
	desc = "Center cursor on insert",
	callback = function()
		vim.cmd("norm! zz")
	end,
})

-- Chezmoi integration for dotfile management
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	desc = "Enable chezmoi watch for dotfiles",
	pattern = { os.getenv("HOME") .. "/.local/share/chezmoi/*" },
	callback = function(ev)
		local bufnr = ev.buf
		vim.schedule(function()
			require("chezmoi.commands.__edit").watch(bufnr)
		end)
	end,
})

-- Load UI highlights on startup
vim.api.nvim_create_autocmd("UIEnter", {
	desc = "Load base46 highlights",
	callback = function()
		require("base46").load_all_highlights()
	end,
})

-- Quick close for ephemeral buffers
vim.api.nvim_create_autocmd("FileType", {
	desc = "Quick close for utility buffers",
	pattern = { "qf", "help", "lsp", "lspinfo", "git", "fugitive", "nvim-undotree" },
	callback = function(ev)
		vim.keymap.set("n", "q", "<cmd>close<cr>", {
			buffer = ev.buf,
			desc = "Close buffer",
		})
		vim.bo[ev.buf].buflisted = false
	end,
})
