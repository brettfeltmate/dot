vim.g.have_nerd_font = true
vim.g.autoformat = true
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

-- vim.o.winborder = "single"

-- UI
vim.opt.cmdheight = 1
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.laststatus = 3
vim.opt.pumheight = 10
vim.opt.splitright = true
vim.opt.splitbelow = false
vim.opt.scrolloff = 20
vim.opt.virtualedit = "block"
vim.opt.hlsearch = true
vim.opt.list = false
vim.opt.inccommand = "split"
vim.opt.smoothscroll = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.conceallevel = 3
vim.opt.signcolumn = "auto:2"
vim.opt.guicursor = ""
vim.opt.shortmess:append("WIcC")
vim.opt.wrap = false

if vim.fn.has("nvim-0.10") == 0 then
	vim.opt.termguicolors = true
end

-- vim.opt.completeopt = "menu,menuone,preview,noselect"
vim.opt.completeopt = "menuone,noselect"

if vim.fn.has("nvim-0.11") == 1 then
	vim.opt.completeopt = "menuone,noselect,fuzzy,nosort"
end

if vim.fn.has("nvim-0.12") == 1 then
	vim.opt.pummaxwidth = 100
	vim.opt.completefuzzycollect = "keyword,files,whole_line"

	require("vim._extui").enable({ enable = true, msg = { target = "msg" } })

	vim.cmd([[autocmd CmdlineChanged [:/\?@] call wildtrigger()]])
	vim.opt.wildmode = "noselect:lastused"
	vim.opt.wildoptions = "pum,fuzzy"
	vim.keymap.set("c", "<Up>", "<C-u><Up>")
	vim.keymap.set("c", "<Down>", "<C-u><Down>")
end

-- Behavior
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.jumpoptions = "stack"

-- Folding
vim.opt.fillchars = "eob: ,fold:-,foldopen:,foldsep:|,foldclose:"
vim.opt.foldcolumn = "0"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.require('utils').markerOrTreeFold()"
