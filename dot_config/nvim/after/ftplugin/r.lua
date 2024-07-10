-- Keybindings
vim.keymap.set("i", "<C-M-i>", " <- ", { buffer = 0 })
vim.keymap.set("i", "<C-M-p>", " |> ", { buffer = 0 })
vim.keymap.set("i", "<C-M-m>", " %>% ", { buffer = 0 })
vim.keymap.set("i", "<C-M-f>", " %$% ", { buffer = 0 })

-- Indentation
vim.g.r_indent_align_args = 0 -- else, args on newline, aligned w/ (

vim.bo.shiftwidth = 2 -- 2 space convention
vim.bo.tabstop = 2

-- Disable ESS comments
vim.g.r_indent_ess_comments = 0
vim.g.r_indent_ess_compatible = 0

-- Use specific comment headers
vim.bo.comments = [[:#',:###,:##,:#]]
