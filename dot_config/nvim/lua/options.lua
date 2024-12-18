vim.g.have_nerd_font = true
vim.g.autoformat = true
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

vim.g.lazygit_config = true
vim.g.lazygit_floating_window_scaling_factor = 1.0
vim.g.lazygit_floating_window_use_plenary = 1

vim.g.undotree_DiffAutoOpen = 0
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_ShortIndicators = 1

-- UI
vim.opt.cmdheight = 0
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.laststatus = 3 -- global statusline
vim.opt.pumheight = 6
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 30
vim.opt.virtualedit = "block"
vim.opt.hlsearch = true
vim.opt.list = false
vim.opt.listchars = { trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.completeopt = "menu,menuone,preview,noselect"
vim.opt.smoothscroll = true
vim.opt.termguicolors = true -- True color support
vim.opt.background = "dark"
vim.opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
-- vim.opt.signcolumn = "number"
vim.opt.guicursor = ""
vim.opt.shortmess:append("WIcC")

-- Behavior
vim.opt.swapfile = false
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

-- Folding
vim.opt.fillchars = "eob: ,fold:-,foldopen:,foldsep:|,foldclose:"
vim.opt.foldcolumn = "0"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
