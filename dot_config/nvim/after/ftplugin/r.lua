-- Vim-Slime bindings
-- TODO:
-- local function to execute then move cursor to next chunk
vim.keymap.set("n", "<CR>", "<Plug>SlimeParagraphSend", { buffer = 0, noremap = true, desc = "Send block" })
vim.keymap.set("x", "<CR>", "<Plug>SlimeRegionSend", { buffer = 0, noremap = true, desc = "Send region" })
vim.keymap.set("n", "<C-CR>", "<Plug>SlimeLineSend", { buffer = 0, noremap = true, desc = "Send line" })

-- HACK:
-- Used in conjunction with entr which draws plots (when writ) in a floating terminal
-- I think it's a pretty slick setup (he proclaims to no audience)
vim.keymap.set(
	"n",
	"<leader>p",
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

vim.keymap.set({ "n" }, "<leader>r", "<cmd>SlimeSend1 r<cr>", { buffer = 0, noremap = true, desc = "Start R" })
vim.keymap.set({ "n" }, "<leader>q", "<cmd>SlimeSend1 q<cr>", { buffer = 0, noremap = true, desc = "Emit q" })
vim.keymap.set({ "n" }, "<leader>Q", "<cmd>SlimeSend1 q()<cr>", { buffer = 0, noremap = true, desc = "Quit R" })

-- #FIX: sends ^C resultng in 'invalid token in ""'
--  vim.keymap.set({ "n" }, "<leader>c", "<cmd>SlimeSend1 \x03<cr>", { buffer = 0, noremap = true, desc = "Emit C-c" })

local key_cmd_map = {
	["<cword>"] = {
		["H"] = "help",
	},
	["<cWORD>"] = {
		["s"] = "str",
		["d"] = "pclid",
		["S"] = "summary",
		[","] = "print",
		["h"] = "pclih",
		["t"] = "tail",
		["k"] = "skimr::skim",
		["u"] = "unique",
	},
}

for cword_type, cmd_map in pairs(key_cmd_map) do
	for key, cmd in pairs(cmd_map) do
		vim.keymap.set("n", "<localleader>" .. key, function()
			local kw = vim.fn.expand(cword_type)
			vim.cmd("SlimeSend1 " .. cmd .. "(" .. kw .. ")")
		end, { buffer = 0, noremap = true, desc = cmd })
	end
end

vim.keymap.set("i", "<M-a>", " <- ", { buffer = 0 })
vim.keymap.set("i", "<M-m>", " %>% ", { buffer = 0 })
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
