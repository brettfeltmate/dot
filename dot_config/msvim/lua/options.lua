vim.cmd.colorscheme("zenburned")

-- Indentation
vim.opt.smartindent = true
vim.opt.wrap = true

---- Important Grammar and spell check
vim.opt.spelllang = "en"
vim.opt.spell = true

-- Search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.completeopt = "menuone,noselect"
-- Apperance

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 1
vim.opt.scrolloff = 10
-- Behaviour
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.autochdir = false
vim.opt.iskeyword:append("a")
vim.opt.clipboard:append("unnamedplus")
vim.opt.modifiable = true
vim.opt.encoding = "UTF-8"
