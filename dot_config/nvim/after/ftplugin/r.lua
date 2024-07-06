-- Show line after desired maximum text width
vim.cmd("setlocal colorcolumn=81")

-- Keybindings
vim.keymap.set("i", "<C-M-i>", " <- ", { buffer = 0 })
vim.keymap.set("i", "<C-M-p>", " |> ", { buffer = 0 })
vim.keymap.set("i", "<C-M-m>", " %>% ", { buffer = 0 })
vim.keymap.set("i", "<C-M-f>", " %$% ", { buffer = 0 })

-- Indentation
-- Don't align indentation of function args on new line with opening `(`
vim.g.r_indent_align_args = 0

-- R convention of 2 space per tab
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2

-- Disable ESS comments
vim.g.r_indent_ess_comments = 0
vim.g.r_indent_ess_compatible = 0

-- Use specific comment headers
vim.bo.comments = [[:#',:###,:##,:#]]
