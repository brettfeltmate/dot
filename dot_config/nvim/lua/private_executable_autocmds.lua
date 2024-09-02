---@diagnostic disable: unused-function
local function nvim_create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		vim.api.nvim_command("augroup " .. group_name)
		vim.api.nvim_command("autocmd!")
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
			vim.api.nvim_command(command)
		end
		vim.api.nvim_command("augroup END")
	end
end

-- local function semshi_highlights()
-- 	vim.cmd("hi semshiLocal           ctermfg=209 guifg=#e1967d")
-- 	vim.cmd("hi semshiGlobal          ctermfg=214 guifg=#edb882")
-- 	vim.cmd("hi semshiImported        ctermfg=214 guifg=#edb882 cterm=bold gui=bold")
-- 	vim.cmd("hi semshiParameter       ctermfg=75  guifg=#9db6d0")
-- 	vim.cmd("hi semshiParameterUnused ctermfg=117 guifg=#9db6d0 cterm=underline gui=underline")
-- 	vim.cmd("hi semshiFree            ctermfg=218 guifg=#f7b7d7")
-- 	vim.cmd("hi semshiBuiltin         ctermfg=207 guifg=#7aacaa")
-- 	vim.cmd("hi semshiAttribute       ctermfg=49  guifg=#aad7a4")
-- 	vim.cmd("hi semshiSelf            ctermfg=249 guifg=#c99297")
-- 	vim.cmd("hi semshiUnresolved      ctermfg=226 guifg=#e9e9a2 cterm=underline gui=underline")
-- 	vim.cmd("hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d18baa")
-- 	vim.cmd("hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d18baa")
-- 	vim.cmd("hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d18baa")
-- end
--
-- vim.api.nvim_create_autocmd("FileType", {
-- 	group = vim.api.nvim_create_augroup("python_highlights", { clear = true }),
-- 	pattern = "python",
-- 	callback = semshi_highlights
-- })

local autocmds = {
	numberlines = {
		{ "TermOpen", "*", "setlocal nonu nornu signcolumn=no" },
		{ "TermEnter", "*", "setlocal nonu nornu signcolumn=no" },
		{ "BufEnter", "*", "if &nu | set rnu | endif" },
		{ "WinEnter", "*", "if &nu | set rnu | endif" },
		{ "FocusGained", "*", "if &nu | set rnu | endif" },
		{ "BufLeave", "*", "if &nu | set nornu | endif" },
	},
	modechange = {
		{ "BufEnter", "*", 'if &buftype == "terminal" | :startinsert | endif' },
		{ "TermOpen", "*", 'if &buftype == "terminal" | :startinsert | endif' },
		{ "BufLeave", "*", "if &buftype == 'terminal' | :stopinsert  | endif" },
	},
	gopass = {
		{ "BufNewFile", "/dev/shm/gopass*", "setlocal noswapfile nobackup noundofile shada=''" },
		{ "BufRead", "/dev/shm/gopass*", "setlocal noswapfile nobackup noundofile shada=''" },
	},
	winsplits = {
		{ "BufWinEnter", "*", 'if &buftype == "help" | :wincmd L | endif' },
	},
}

nvim_create_augroups(autocmds)
