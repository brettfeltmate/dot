-- Slime settings
vim.g.slime_bracketed_paste = 1
vim.g.slime_preserve_curpos = 0
vim.g.slime_default_config = { socket_name = "default", target_pane = ":.2" }
vim.g.slime_cell_delimiter = "```"

-- Slime bindings
vim.keymap.set({ "n" }, "<localleader> ", "<Plug>SlimeParagraphSend}j", { buffer = 0, noremap = true, desc = "Send block" })
vim.keymap.set({ "x" }, "<localleader> ", "<Plug>SlimeRegionSend", { buffer = 0, noremap = true, desc = "Send selection" })
vim.keymap.set({ "n" }, "<localleader>r", "<cmd>SlimeSend1 bpython<cr>", { buffer = 0, noremap = true, desc = "Start REPL" })
vim.keymap.set({ "n" }, "<localleader>Q", "<cmd>SlimeSend1 quit()<cr>", { buffer = 0, noremap = true, desc = "Quit REPL" })

-- Auto-correct
vim.cmd([[
  iabbrev <buffer> true True
  iabbrev <buffer> TRUE True
  iabbrev <buffer> tRue True
  iabbrev <buffer> trUe True
  iabbrev <buffer> truE True
  iabbrev <buffer> TRue True
  iabbrev <buffer> TrUe True
  iabbrev <buffer> TruE True
  iabbrev <buffer> tRUe True
  iabbrev <buffer> tRuE True
  iabbrev <buffer> TRuE True
  iabbrev <buffer> tRUE True
  iabbrev <buffer> false False
  iabbrev <buffer> FALSE False
  iabbrev <buffer> fAlse False
  iabbrev <buffer> faLse False
  iabbrev <buffer> falSe False
  iabbrev <buffer> falsE False
  iabbrev <buffer> FAlse False
  iabbrev <buffer> FaLse False
  iabbrev <buffer> FalSe False
  iabbrev <buffer> FalsE False
  iabbrev <buffer> FALse False
  iabbrev <buffer> FaLSe False
  iabbrev <buffer> FaLsE False
  iabbrev <buffer> FALSe False
  iabbrev <buffer> FaLSE False
  iabbrev <buffer> FAlSE False
  iabbrev <buffer> FAlsE False
  iabbrev <buffer> fALSE False
]])
