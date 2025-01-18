-- Slime settings
vim.g.slime_bracketed_paste = 1
vim.g.slime_preserve_curpos = 0
vim.g.slime_default_config = { socket_name = "default", target_pane = ":.2" }
vim.g.slime_cell_delimiter = "```"

-- Slime bindings
vim.keymap.set("n", "<CR>", "<Plug>SlimeParagraphSend}j", { buffer = 0, noremap = true, desc = "Send block" })
vim.keymap.set("x", "<CR>", "<Plug>SlimeRegionSend", { buffer = 0, noremap = true, desc = "Send region" })
vim.keymap.set({ "n" }, "<localleader>r", "<cmd>SlimeSend1 r<cr>", { buffer = 0, noremap = true, desc = "Start REPL" })
vim.keymap.set({ "n" }, "<localleader>Q", "<cmd>SlimeSend1 quit()<cr>", { buffer = 0, noremap = true, desc = "Quit REPL" })
vim.keymap.set({"n"}, "<localleader>c", "<cmd>SlimeSend1 rm(list=ls())<cr>", { buffer = 0, noremap = true, desc = "Clear environment" })

-- #FIX: sends ^C resultng in 'invalid token in ""'
-- vim.keymap.set({ "n" }, "<localleader>c", "<cmd>SlimeSend1 \003<cr>", { buffer = 0, noremap = true, desc = "Emit C-c" })

-- NOTE:
-- I have iTerm keybound floating profile that monitors and redraws
-- .last_plot when over/re-writ
vim.keymap.set(
	"n",
	"<localleader>p",
	"<cmd>SlimeSend1 "
		.. "ggplot2::ggsave("
		.. "file = '.last_plot.png',"
		.. "path = '~/',"
		.. "width = 9,"
		.. "height = 8,"
		.. "units = 'in',"
		.. "dpi = 'retina'"
		.. ")"
		.. "<cr>",
	{ buffer = 0, noremap = true, desc = "Save plot" }
)

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

-- Auto-correct
vim.cmd([[
  iabbrev <buffer> true TRUE
  iabbrev <buffer> True TRUE
  iabbrev <buffer> false FALSE
  iabbrev <buffer> False FALSE
  iabbrev <buffer> null NULL
  iabbrev <buffer> Null NULL
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

