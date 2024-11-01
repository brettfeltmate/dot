-- Vim-Slime bindings
-- TODO:
-- local function to execute then move cursor to next chunk
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

local function get_cword()
	local cword = vim.fn.expand("<cword>")
	local line = vim.api.nvim_get_current_line()
	local col = vim.fn.col(".")
	local before_cursor = line:sub(1, col)
	local dollar_pos = before_cursor:match(".*()%$")

	local kw = cword
	if dollar_pos then
		-- FIXME: this duplicates chars from $ to cursor
		local id_start = before_cursor:match(".*%f[%w_]().*%$")
		if id_start then
			kw = line:sub(id_start, col - 1) .. "$" .. cword
		end
	end
end

vim.keymap.set({ "n" }, "<localleader>s", function()
	local kw = vim.fn.expand("<cWORD>")
	vim.cmd("SlimeSend1 str(" .. kw .. ")")
end, { buffer = 0, noremap = true, desc = "Structure" })

vim.keymap.set({ "n" }, "<localleader>m", function()
	local kw = vim.fn.expand("<cWORD>")
	vim.cmd("SlimeSend1 " .. "summary(" .. kw .. ")")
end, { buffer = 0, noremap = true, desc = "Summary" })

vim.keymap.set({ "n" }, "<localleader><localleader>", function()
	local kw = vim.fn.expand("<cWORD>")
	vim.cmd("SlimeSend1 " .. kw)
end, { buffer = 0, noremap = true, desc = "Print" })

vim.keymap.set({ "n" }, "<localleader>t", function()
	local kw = vim.fn.expand("<cWORD>")
	vim.cmd("SlimeSend1 tail(" .. kw .. ")")
end, { buffer = 0, noremap = true, desc = "Tail" })

vim.keymap.set({ "n" }, "<localleader>d", function()
	local kw = vim.fn.expand("<cWORD>")
	vim.cmd("SlimeSend1 pclid(" .. kw .. ")")
end, { buffer = 0, noremap = true, desc = "Density" })

vim.keymap.set({ "n" }, "<localleader>h", function()
	local kw = vim.fn.expand("<cWORD>")
	vim.cmd("SlimeSend1 pclih(" .. kw .. ")")
end, { buffer = 0, noremap = true, desc = "Histogram" })

vim.keymap.set({ "n" }, "<localleader>k", function()
	local kw = vim.fn.expand("<cWORD>")
	vim.cmd("SlimeSend1 skimr::skim(" .. kw .. ")")
end, { buffer = 0, noremap = true, desc = "Skim" })

-- Shorthands for interactive usage

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
