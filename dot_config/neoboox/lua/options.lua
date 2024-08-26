vim.cmd.colorscheme("neobones")

-- Indentation
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.breakindent = true

---- Important Grammar and spell check
vim.opt.spelllang = "en"
vim.opt.spell = true

-- Search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.inccommand = "split"
-- Appearance
vim.opt.conceallevel = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 0
vim.opt.scrolloff = 10

-- Behaviour
vim.opt.mouse = "a"
vim.opt.pumheight = 6 -- max completions shown at once
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.autochdir = true
vim.opt.iskeyword:append("a")
vim.opt.clipboard:append("unnamedplus")
vim.opt.modifiable = true
vim.opt.encoding = "UTF-8"
vim.opt.virtualedit = "block"
if vim.fn.has("nvim-0.10") == 1 then
	vim.opt.smoothscroll = true
end
