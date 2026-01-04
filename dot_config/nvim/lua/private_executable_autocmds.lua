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
		vim.lsp.inline_completion.enable()
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

vim.api.nvim_create_autocmd("User", {
	pattern = "OpencodeEvent",
	callback = function(args)
		-- See the available event types and their properties
		vim.notify(vim.inspect(args.data.event))
		-- Do something useful
		if args.data.event.type == "session.idle" then
			vim.notify("`opencode` finished responding")
		end
	end,
})
