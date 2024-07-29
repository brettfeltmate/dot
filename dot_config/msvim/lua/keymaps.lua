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

local toggle_background = function()
	if vim.opt.background == "dark" then
		vim.opt.background = "light"
	else
		vim.opt.background = "dark"
	end
end

map("n", "<leader>l", "<cmd>Limelight!!<cr>", { desc = "Limelight" })
map("n", "<leader>g", "<cmd>Goyo<cr>", { desc = "Goyo" })
map("n", "<leader>f", "<cmd>lua MiniFiles.open()<cr>", { desc = "Files" })
map("n", "<leader>p", "<cmd>SoftPencil<cr>", { desc = "Pencil" })
map("n", "<leader>x", "<cmd>lua MiniBufremove.delete()<cr>", { desc = "Close buffer" })
map("n", "<leader>b", "<cmd>Pick buffers<cr>", { desc = "Buffers" })
map("n", "<leader>B", toggle_background, { desc = "Background" })
map("n", "<leader>y", "<cmd>YankyRingHistory<cr>", { desc = "Yanks" })
map("n", "<leader>/", "<cmd>Pick grep_live<cr>", { desc = "Grep" })
map("n", "<leader>c", pick_colorscheme, { desc = "color schemes" })
map({ "n", "x" }, "y", "<cmd><Plug>(YankyYank)<cr>")
map({ "n", "x" }, "p", "<cmd><Plug>(YankyPutAfter)<cr>")
map({ "n", "x" }, "P", "<cmd><Plug>(YankyPutBefore)<cr>")
map({ "n", "x" }, "gp", "<cmd><Plug>(YankyGPutAfter)<cr>")
map({ "n", "x" }, "gP", "<cmd><Plug>(YankyGPutBefore)<cr>")
map("n", "<C-p>", "<cmd><Plug>(YankyPreviousEntry)<cr>")
map("n", "<C-n>", "<cmd><Plug>(YankyNextEntry)<cr>")
map("n", ":", "<Plug>(cmdpalette)")
map("n", "H", "<cmd>lua MiniBracketed.buffer('backward')<cr>")
map("n", "L", "<cmd>lua MiniBracketed.buffer('forward')<cr>")
map({ "n", "x", "o" }, "s", "<cmd> lua require('flash').jump()<cr>")
