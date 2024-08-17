local map = vim.keymap.set
map({ "n", "x" }, "y", "<Plug>(YankyYank)")
map({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
map({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
map({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
map({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
map("n", "<C-p>", "<Plug>(YankyPreviousEntry)")
map("n", "<C-n>", "<Plug>(YankyNextEntry)")

map("n", "H", "<cmd>lua MiniBracketed.buffer('backward')<cr>")
map("n", "L", "<cmd>lua MiniBracketed.buffer('forward')<cr>")

map({ "n", "x", "o" }, ",", "<cmd> lua require('flash').jump()<cr>")
map("n", "%", "<cmd>lua require('snipe').open_buffer_menu()<cr>", {desc = "Snipe"})

map("n", ":", "<Plug>(cmdpalette)")

map("n", "<C-Left>", "<cmd>lua require('smart-splits').move_cursor_left()<cr>")
map("n", "<C-Right>", "<cmd>lua require('smart-splits').move_cursor_right()<cr>")
map("n", "<C-Up>", "<cmd>lua require('smart-splits').move_cursor_up()<cr>")
map("n", "<C-Down>", "<cmd>lua require('smart-splits').move_cursor_down()<cr>")

map("n", "<leader>x", "<cmd>lua MiniBufremove.delete()<cr>", { desc = "Close" })
map("n", "<leader>y", "<cmd>YankyRingHistory<cr>", { desc = "Yanks" })
map("n", "<leader>f", "<cmd>lua require('oil').toggle_float()<cr>", { desc = "Browse" })
map("n", "<leader>,", "<cmd>lua require('fzf-lua').files()<cr>", { desc = "Find" })
map("n", "<leader>/", "<cmd>lua require('fzf-lua').live_grep()<cr>", { desc = "Grep" })
map(
	"n",
	"<leader>s",
	"<cmd>lua require('fzf-lua').spell_suggest({ winopts = { relative='cursor', row=0.01, col=0, height=0.2, width=0.2}})<cr>",
	{ desc = "Spellings" }
)

map("n", "<leader>tz", "<cmd>ZenMode<cr>", { desc = "ZenMode" })
map("n", "<leader>tw", "<cmd>Twilight<cr>", { desc = "Twilight" })
map("n", "<leader>ts", "<cmd>SoftPencil<cr>", { desc = "SoftPencil" })
map("n", "<leader>tg", "<cmd>HardPencil<cr>", { desc = "HardPencil" })
map("n", "<leader>tc", "<cmd>lua require('fzf-lua').colorschemes()<cr>", { desc = "Schemes" })
map("n", "<leader>tb", "<cmd>lua require('fzf-lua').buffers()<cr>", { desc = "Buffers" })
map("n", "<leader>mv", "<cmd>Markview<cr>", { desc = "Toggle Markview" })
map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Toggle Preview" })
map("n", "<leader>mi", "<cmd>PasteImage<cr>", { desc = "Insert Image" })
