-- Using `vim.cmd` instead of `vim.wo` because it is yet more reliable
vim.cmd("setlocal spell")
vim.cmd("setlocal wrap")
vim.keymap.set({ "n", "x" }, "<C-c>m", ":Checkbox toggle<CR>", { desc = "Toggle Checkbox" })
vim.keymap.set({ "n", "x" }, "<C-c>M", ":Checkbox interactive<CR>", { desc = "Set Checkbox" })
-- vim.cmd("set conceallevel=2")
-- vim.api.nvim_set_hl(0, "MarkviewCode", { bg = "#1e171c" })
