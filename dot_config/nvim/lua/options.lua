vim.g.have_nerd_font = true
vim.g.autoformat = true
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

-- UI
vim.opt.cmdheight = 0
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.laststatus = 3 -- global statusline
vim.opt.pumheight = 6
vim.opt.splitright = true
vim.opt.splitbelow = false
vim.opt.scrolloff = 20
vim.opt.virtualedit = "block"
vim.opt.hlsearch = true
vim.opt.list = false
vim.opt.inccommand = "split"
vim.opt.completeopt = "menu,menuone,preview,noselect"
vim.opt.smoothscroll = true
vim.opt.termguicolors = true -- True color support
vim.opt.background = "dark"
vim.opt.conceallevel = 3 -- Hide * markup for bold and italic, but not markers with substitutions
vim.opt.signcolumn = "auto:2"
vim.opt.guicursor = ""
vim.opt.shortmess:append("WIcC")
vim.opt.wrap = false

-- Behavior
-- vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.breakindent = true
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.tabstop = 4
vim.opt.jumpoptions = "stack"

-- Folding
vim.opt.fillchars = "eob: ,fold:-,foldopen:,foldsep:|,foldclose:"
vim.opt.foldcolumn = "0"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldexpr = "v:lua.require('utils').markerOrTreeFold()"
