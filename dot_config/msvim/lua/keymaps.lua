local map = vim.keymap.set
local set_colorscheme = function(name)
	pcall(vim.cmd, "colorscheme " .. name)
end

local pick_colorscheme = function()
	local init_scheme = vim.g.colors_name
	local new_scheme = require("mini.pick").start({
		source = {
			items = vim.fn.getcompletion("", "color"),
			preview = function(_, item)
				set_colorscheme(item)
			end,
			choose = set_colorscheme,
		},
	})
	if new_scheme == nil then
		set_colorscheme(init_scheme)
	end
end
map("n", "<C-Left>", "<cmd>lua require('smart-splits').move_cursor_left()<cr>")
map("n", "<C-Right>", "<cmd>lua require('smart-splits').move_cursor_right()<cr>")
map("n", "<C-Up>", "<cmd>lua require('smart-splits').move_cursor_up()<cr>")
map("n", "<C-Down>", "<cmd>lua require('smart-splits').move_cursor_down()<cr>")
map("n", "<leader>/", "<cmd>Pick grep_live<cr>", { desc = "Grep" })
map("n", "<leader>f", "<cmd>lua MiniFiles.open()<cr>", { desc = "File" })
map("n", "<leader>x", "<cmd>lua MiniBufremove.delete()<cr>", { desc = "Close buffer" })
map("n", "<leader>b", "<cmd>Pick buffers<cr>", { desc = "Switch Buffer" })
map("n", "<leader>y", "<cmd>YankyRingHistory<cr>", { desc = "Yanks" })
map("n", "<leader>tz", "<cmd>ZenMode<cr>", { desc = "ZenMode" })
map("n", "<leader>tw", "<cmd>Twilight<cr>", { desc = "Twilight" })
map("n", "<leader>ts", "<cmd>SoftPencil<cr>", { desc = "SoftPencil" })
map("n", "<leader>tg", "<cmd>HardPencil<cr>", { desc = "HardPencil" })
map("n", "<leader>tc", pick_colorscheme, { desc = "Colorschemes" })
map("n", "<leader>tt", "<cmd>TWToggle<cr>", { desc = "Typewriter" })
map("n", "<leader>mv", "<cmd>Markview<cr>", { desc = "Toggle Markview" })
map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Toggle Preview" })
map("n", "<leader>mi", "<cmd>PasteImage<cr>", { desc = "Insert Image" })
map({ "n", "x" }, "y", "<Plug>(YankyYank)")
map({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
map({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
map({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
map({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
map("n", "<C-p>", "<Plug>(YankyPreviousEntry)")
map("n", "<C-n>", "<Plug>(YankyNextEntry)")
map("n", ":", "<Plug>(cmdpalette)")
map("n", "H", "<cmd>lua MiniBracketed.buffer('backward')<cr>")
map("n", "L", "<cmd>lua MiniBracketed.buffer('forward')<cr>")
map({ "n", "x", "o" }, "s", "<cmd> lua require('flash').jump()<cr>")
