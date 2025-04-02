vim.keymap.set("i", "<M-a>", " <- ", { buffer = 0 })

-- Slime bindings
vim.keymap.set("n", "<CR>", "<Plug>SlimeParagraphSend}j", { buffer = 0, noremap = true, desc = "Send block" })
vim.keymap.set("x", "<CR>", "<Plug>SlimeRegionSend", { buffer = 0, noremap = true, desc = "Send region" })

vim.keymap.set(
	"n",
	"<localleader>G",
	"<cmd>SlimeSend1 "
		.. "ggplot2::ggsave("
		.. "file = 'scratch.png',"
		.. "width = 10,"
		.. "height = 8,"
		.. "units = 'in'"
		.. ")"
		.. "<cr>",
	{ buffer = 0, noremap = true, desc = "ggsave" }
)

-- Semi-working attempts to shorthanding common interactive functions
-- haven't quite figured out how best to handle R's $elector
local key_cmd_map = {
	["<cword>"] = {
		["?"] = "help",
	},
	["<cWORD>"] = {
		["s"] = "str",
		["g"] = "dplyr::glimpse",
		["l"] = "levels",
		[","] = "print",
		["h"] = "pclih",
		["u"] = "unique",
		["r"] = "range",
		["a"] = "mean",
		["m"] = "median",
        ["y"] = "summary",
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
