local function map(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, opts or {})
end

map("i", "<M-a>", " <- ", { buffer = 0 })

-- Slime bindings
map("n", "<CR>", "<Plug>SlimeParagraphSend}j", { buffer = 0, noremap = true, desc = "Send block" })
map("x", "<CR>", "<Plug>SlimeRegionSend", { buffer = 0, noremap = true, desc = "Send region" })

map(
	"n",
	"<localleader>g",
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

map("n", "<localleader>v", "<cmd>SlimeSend1 hgd_browse()<cr>", { buffer = 0, desc = "viewer" })

map("n", "localleader>w", function()
	vim.ui.input({ prompt = "Write to file: " }, function(input)
		if input and input ~= "" then
			vim.cmd("SlimeSend1 fwrite(as.data.table(" .. input .. ", keep.rownames = FALSE), file = './scratch.csv')")
		end
	end)
end, { buffer = 0, noremap = true, desc = "write csv" })

-- Calls R function on user input
local function r_popup_command(cmd)
	local function on_confirm(input)
		if input and input ~= "" then
			vim.cmd("SlimeSend1 " .. cmd .. "(" .. input .. ")")
		end
	end

	vim.ui.input({ prompt = cmd .. "(): " }, on_confirm)
end

-- Map common R commands to <localleader> + key
local popup_cmds = {
	["s"] = "str",
	["k"] = "skimr::skim",
	["u"] = "unique",
	["y"] = "summary",
	["h"] = "pclih",
	["p"] = "pclis",
	["b"] = "pclibx",
	["c"] = "print",
}

for key, cmd in pairs(popup_cmds) do
	map("n", "<localleader>" .. key, function()
		r_popup_command(cmd)
	end, { buffer = 0, noremap = true, desc = cmd })
end

vim.keymap.set("n", "<localleader>l", "<cmd>SlimeSend1 print(.Last.value)<cr>", {
	buffer = 0,
	noremap = true,
	desc = "Print last value",
})

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

local wk = require("which-key")
wk.add({
	{ "<localleader>", icon = "󰟔  ", group = "R..." },
	{ "<localleader>G", mode = "n" },
	{ "<localleader>v", mode = "n" },
	{ "<localleader>w", mode = "n" },
	{ "<localleader>s", mode = "n" },
	{ "<localleader>l", mode = "n" },
	{ "<localleader>k", mode = "n" },
	{ "<localleader>u", mode = "n" },
	{ "<localleader>y", mode = "n" },
	{ "<localleader>h", mode = "n" },
	{ "<localleader>p", mode = "n" },
	{ "<localleader>b", mode = "n" },
})
