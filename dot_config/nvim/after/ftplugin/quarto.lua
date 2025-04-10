-- Copy settings from ft/rmd
vim.cmd("runtime! ftplugin/rmd.lua")

local api = vim.api
local ts = vim.treesitter

vim.b.slime_cell_delimiter = '```'
vim.b['quarto_is_r_mode'] = nil
vim.b['reticulate_running'] = false

-- wrap text, but by word no character
-- indent the wrappped line
vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.breakindent = true
vim.wo.showbreak = '|'
