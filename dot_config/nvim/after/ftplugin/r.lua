-- Slime bindings
vim.keymap.set("n", "<CR>", "<Plug>SlimeParagraphSend}j", { buffer = 0, noremap = true, desc = "Send block" })
vim.keymap.set("x", "<CR>", "<Plug>SlimeRegionSend", { buffer = 0, noremap = true, desc = "Send region" })
vim.keymap.set({ "n" }, "<localleader>r", "<cmd>SlimeSend1 r<cr>", { buffer = 0, noremap = true, desc = "Start REPL" })
vim.keymap.set({ "n" }, "<localleader>q", "<cmd>SlimeSend1 q<cr>", { buffer = 0, noremap = true, desc = "q" })
vim.keymap.set(
	{ "n" },
	"<localleader>Q",
	"<cmd>SlimeSend1 quit()<cr>",
	{ buffer = 0, noremap = true, desc = "Quit REPL" }
)
vim.keymap.set(
	{ "n" },
	"<localleader>c",
	"<cmd>SlimeSend1 rm(list=ls())<cr>",
	{ buffer = 0, noremap = true, desc = "Clear environment" }
)

-- NOTE:
-- I have iTerm keybound floating profile that monitors and redraws
-- .last_plot on file update
-- vim.keymap.set(
-- 	"n",
-- 	"<localleader>p",
-- 	"<cmd>SlimeSend1 "
-- 		.. "ggplot2::ggsave("
-- 		.. "file = '.last_plot.png',"
-- 		.. "path = '~/',"
-- 		.. "width = 12,"
-- 		.. "height = 8,"
-- 		.. "units = 'in',"
-- 		.. "dpi = 'retina'"
-- 		.. ")"
-- 		.. "<cr>",
-- 	{ buffer = 0, noremap = true, desc = "Save plot" }
-- )

-- Semi-working attempts to shorthanding common interactive functions
-- haven't quite figured out how best to handle R's $elector
local key_cmd_map = {
	["<cword>"] = {
		["?"] = "help",
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

-- R bespoke bindings
vim.keymap.set("i", "<M-a>", " <- ", { buffer = 0 })
vim.keymap.set("i", "<M-m>", " %>% ", { buffer = 0 })
vim.keymap.set("i", "<M-e>", " %$% ", { buffer = 0 })
vim.keymap.set("i", "<M-i>", " %in% ", { buffer = 0 })
vim.keymap.set("i", "<M-b>", " %between% ", { buffer = 0 })

-- Open oil as float in img dir, w/ preview
local function oil_images()
	require("oil").open(vim.fn.getcwd() .. "/out/fig/", { preview = { horizontal = true } })
end

vim.keymap.set("n", "_", oil_images, { buffer = 0, noremap = true, desc = "/imgs/" })

-- Auto-correct
vim.cmd([[
  iabbrev <buffer> true TRUE
  iabbrev <buffer> True TRUE
  iabbrev <buffer> tRue TRUE
  iabbrev <buffer> trUe TRUE
  iabbrev <buffer> truE TRUE
  iabbrev <buffer> TRue TRUE
  iabbrev <buffer> TrUe TRUE
  iabbrev <buffer> TruE TRUE
  iabbrev <buffer> tRUe TRUE
  iabbrev <buffer> tRuE TRUE
  iabbrev <buffer> TRuE TRUE
  iabbrev <buffer> tRUE TRUE
  iabbrev <buffer> false FALSE
  iabbrev <buffer> False FALSE
  iabbrev <buffer> fAlse FALSE
  iabbrev <buffer> faLse FALSE
  iabbrev <buffer> falSe FALSE
  iabbrev <buffer> falsE FALSE
  iabbrev <buffer> FAlse FALSE
  iabbrev <buffer> FaLse FALSE
  iabbrev <buffer> FalSe FALSE
  iabbrev <buffer> FalsE FALSE
  iabbrev <buffer> FALse FALSE
  iabbrev <buffer> FaLSe FALSE
  iabbrev <buffer> FaLsE FALSE
  iabbrev <buffer> FALSe FALSE
  iabbrev <buffer> FaLSE FALSE
  iabbrev <buffer> FAlSE FALSE
  iabbrev <buffer> FAlsE FALSE
  iabbrev <buffer> fALSE FALSE
  iabbrev <buffer> null NULL
  iabbrev <buffer> Null NULL
  iabbrev <buffer> nUll NULL
  iabbrev <buffer> nuLl NULL
  iabbrev <buffer> nulL NULL
  iabbrev <buffer> NUll NULL
  iabbrev <buffer> NuLl NULL
  iabbrev <buffer> NulL NULL
  iabbrev <buffer> nULl NULL
  iabbrev <buffer> NULl NULL
  iabbrev <buffer> NuLL NULL
  iabbrev <buffer> nULL NULL
]])

-- Indentation
vim.g.r_indent_align_args = 0 -- else: args on newline, aligned w/ (
vim.bo.shiftwidth = 2 -- 2 space convention
vim.bo.tabstop = 2

-- Disable ESS comments
vim.g.r_indent_ess_comments = 0
vim.g.r_indent_ess_compatible = 0

-- Use specific comment headers
vim.bo.comments = [[:#',:###,:##,:#]]
