vim.keymap.set({ "n" }, "<localleader>,", function()
	require("quicker").toggle_expand({ before = 2, after = 2, add_to_existing = true })
end, { buffer = 0, noremap = true, silent = true, expr = false })

vim.keymap.set({ "n" }, "<localleader>r", function()
	require("quicker").refresh({ opts = { keep_diagnostics = true } })
end, { buffer = 0, noremap = true, silent = true, expr = false })
