vim.g.have_nerd_font = true
vim.g.autoformat = true
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

vim.cmd([[let g:sneak#label = 1]])

-- UI
vim.opt.cmdheight = 1
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.laststatus = 2
vim.opt.pumheight = 10
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 20
vim.opt.virtualedit = "block"
vim.opt.hlsearch = true
vim.opt.list = false
vim.opt.inccommand = "split"
vim.opt.smoothscroll = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.conceallevel = 3
vim.opt.signcolumn = "auto:1-2"
vim.opt.guicursor = ""
vim.opt.shortmess:append("WcC")
vim.opt.wrap = false

if vim.fn.has("nvim-0.10") == 0 then
	vim.opt.termguicolors = true
end

vim.opt.completeopt = "menu,menuone,preview,noselect"

if vim.fn.has("nvim-0.12") == 1 then
	require("vim._core.ui2").enable({ enable = true, msg = { target = "cmd" } })
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
vim.o.fillchars = "eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:"
vim.opt.foldcolumn = "0"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
