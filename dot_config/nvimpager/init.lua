vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.opt.syntax = 'on'
vim.opt.termguicolors = true
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.linebreak = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.showmode = false
vim.opt.showcmd = false

vim.opt.laststatus = 3

vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

vim.opt.background = 'dark'

vim.cmd('source ~/.config/nvimpager/highlights.vim')
