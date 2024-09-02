-- Keybindings
vim.keymap.set("n", "<cr>", "<Plug>SlimeParagraphSend", { buffer = 0, desc = "Slime: send" })
vim.keymap.set("x", "<cr>", "<Plug>SlimeRegionSend", { buffer = 0, desc = "Slime: send" })
vim.keymap.set("n", "<C-g>", "<Plug>SimeSend1 gg()", { buffer = 0, desc = "Slime: draw" })

vim.keymap.set("i", "<M-z>", " <- ", { buffer = 0 })
vim.keymap.set("i", "<M-v>", " |> ", { buffer = 0 })
vim.keymap.set("i", "<M-m>", " %>% ", { buffer = 0 })

-- Indentation
vim.g.r_indent_align_args = 0 -- else, args on newline, aligned w/ (

vim.bo.shiftwidth = 2 -- 2 space convention
vim.bo.tabstop = 2

-- Disable ESS comments
vim.g.r_indent_ess_comments = 0
vim.g.r_indent_ess_compatible = 0

-- Use specific comment headers
vim.bo.comments = [[:#',:###,:##,:#]]
