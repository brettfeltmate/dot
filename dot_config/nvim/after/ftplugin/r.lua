-- Vim-Slime bindings
vim.keymap.set("n", "<CR>", "<Plug>SlimeParagraphSend", { buffer = 0, noremap = true, desc = "Send block" })
vim.keymap.set("x", "<CR>", "<Plug>SlimeRegionSend", { buffer = 0, noremap = true, desc = "Send region" })
vim.keymap.set("n", "<leader>rl", "<Plug>SlimeLineSend", { buffer = 0, noremap = true, desc = "Send line" })
vim.keymap.set("x", "<leader>rr", "<Plug>SlimeRegionSend", { buffer = 0, noremap = true, desc = "Send region" })
vim.keymap.set("n", "<leader>rb", "<Plug>SlimeParagraphSend", { buffer = 0, noremap = true, desc = "Send block" })
vim.keymap.set("n", "<leader>rm", "<Plug>SlimeMotionSend", { buffer = 0, noremap = true, desc = "Send motion" })

-- HACK:
-- Used in conjunction with entr which draws plots (when writ) in a floating terminal
-- I think it's a pretty slick setup (he proclaims to no audience)
vim.keymap.set(
	"n",
	"<leader>rp",
	"<cmd>SlimeSend1 "
		.. "ggplot2::ggsave("
		.. "file = '.last_plot.png',"
		.. "path = '~/',"
		.. "width = 9,"
		.. "height = 9,"
		.. "units = 'in',"
		.. "dpi = 'retina'"
		.. ")"
		.. "<cr>",
	{ buffer = 0, noremap = true, desc = "Save plot" }
)

vim.keymap.set("i", "<M-a>", " <- ", { buffer = 0 })
vim.keymap.set("i", "<M-p>", " %>% ", { buffer = 0 })
vim.keymap.set("i", "<M-e>", " %$% ", { buffer = 0 })
vim.keymap.set("i", "<M-i>", " %in% ", { buffer = 0 })
vim.keymap.set("i", "<M-b>", " %between% ", { buffer = 0 })

-- Indentation
vim.g.r_indent_align_args = 0 -- else: args on newline, aligned w/ (

vim.bo.shiftwidth = 2 -- 2 space convention
vim.bo.tabstop = 2

-- Disable ESS comments
vim.g.r_indent_ess_comments = 0
vim.g.r_indent_ess_compatible = 0

-- Use specific comment headers
vim.bo.comments = [[:#',:###,:##,:#]]

vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#cac4b5" })
vim.api.nvim_set_hl(0, "Operator", { fg = "#a087a2" })
vim.api.nvim_set_hl(0, "Delimiter", { fg = "#a6c5b2" })
vim.api.nvim_set_hl(0, "Float", { fg = "#d9d4e6" })
