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

-- Comprehensive LSP prevention for minibuffer buffers
-- local function is_minibuffer_buffer(bufnr)
--     local bufname = vim.api.nvim_buf_get_name(bufnr)
--     local filetype = vim.bo[bufnr].filetype
--     local buftype = vim.bo[bufnr].buftype
--
--     return bufname:match("minibuffer://")
--         or filetype == "minibuffer"
--         or buftype == "nofile" and bufname == ""
--         or vim.b[bufnr].minibuffer_managed
-- end

-- local function disable_lsp_for_buffer(bufnr)
--     -- Detach any existing LSP clients
--     local clients = vim.lsp.get_clients({ bufnr = bufnr })
--     for _, client in ipairs(clients) do
--         vim.lsp.buf_detach_client(bufnr, client.id)
--     end
--
--     -- Set buffer properties to prevent LSP
--     vim.bo[bufnr].filetype = "minibuffer"
--     vim.bo[bufnr].buftype = "nofile"
--     vim.b[bufnr].lsp_ignore = true
--     vim.b[bufnr].minibuffer_managed = true
-- end

-- Catch buffer creation early
-- vim.api.nvim_create_autocmd({ "BufNew", "BufAdd", "BufEnter" }, {
-- 	desc = "Disable LSP for minibuffer buffers at creation",
-- 	callback = function(ev)
-- 		if is_minibuffer_buffer(ev.buf) then
-- 			vim.schedule(function()
-- 				disable_lsp_for_buffer(ev.buf)
-- 			end)
-- 		end
-- 	end,
-- })

-- Prevent LSP attachment to minibuffer buffers
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	desc = "Prevent LSP attachment to minibuffer buffers",
-- 	callback = function(ev)
-- 		if is_minibuffer_buffer(ev.buf) then
-- 			-- Immediately detach
-- 			vim.schedule(function()
-- 				local client = vim.lsp.get_client_by_id(ev.data.client_id)
-- 				if client then
-- 					vim.lsp.buf_detach_client(ev.buf, client.id)
-- 				end
-- 				disable_lsp_for_buffer(ev.buf)
-- 			end)
-- 		end
-- 	end,
-- })

-- Quick close for ephemeral buffers
vim.api.nvim_create_autocmd("FileType", {
	desc = "Quick close for utility buffers",
	pattern = { "qf", "help", "lsp", "lspinfo", "fugitive", "nvim-undotree" },
	callback = function(ev)
		vim.keymap.set("n", "q", "<cmd>close<cr>", {
			buffer = ev.buf,
			desc = "Close buffer",
		})
		vim.bo[ev.buf].buflisted = false
	end,
})
