-- Slime settings
vim.g.slime_bracketed_paste = 1
vim.g.slime_preserve_curpos = 0
vim.g.slime_default_config = { socket_name = "default", target_pane = ":.2" }
vim.g.slime_cell_delimiter = "```"

-- Slime bindings
vim.keymap.set("n", "<CR>", "<Plug>SlimeParagraphSend}j", { buffer = 0, noremap = true, desc = "Send block" })
vim.keymap.set("x", "<CR>", "<Plug>SlimeRegionSend", { buffer = 0, noremap = true, desc = "Send region" })
vim.keymap.set({ "n" }, "<localleader>r", "<cmd>SlimeSend1 bpython<cr>", { buffer = 0, noremap = true, desc = "Start REPL" })
vim.keymap.set({ "n" }, "<localleader>Q", "<cmd>SlimeSend1 quit()<cr>", { buffer = 0, noremap = true, desc = "Quit REPL" })

-- Auto-correct
vim.cmd([[
  iabbrev <buffer> true True
  iabbrev <buffer> TRUE True
  iabbrev <buffer> false False
  iabbrev <buffer> FALSE False
  iabbrev <buffer> none None
  iabbrev <buffer> NONE None
]])
