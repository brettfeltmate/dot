-- -| Helper methods |-
local map = function(mode, lhs, rhs, desc, opts)
	opts = opts or {}
	opts.desc = desc
	vim.keymap.set(mode, lhs, rhs, opts)
end

local imap = function(...)
	map("i", ...)
end
local nmap = function(...)
	map("n", ...)
end

local vmap = function(...)
	map("v", ...)
end

local tmap = function(...)
	map("t", ...)
end

local L = function(key)
	return "<leader>" .. key
end
local C = function(cmd)
	return "<Cmd>" .. cmd .. "<CR>"
end

nmap(":", "<Plug>(cmdpalette)")
imap("jk", "<esc>", "Exit insert mode", { silent = true })
tmap("jk", "<C-\\><C-n>", "Exit terminal mode", { silent = true })
tmap("<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")
-- Navigating in/across buffers
nmap("H", C("lua MiniBracketed.buffer('backward')"), "Prev buffer")
nmap("L", C("lua MiniBracketed.buffer('forward')"), "Next buffer")

nmap("<C-Left>", C("wincmd h"), "Left")
nmap("<C-Down>", C("wincmd j"), "Down")
nmap("<C-Up>", C("wincmd k"), "Up")
nmap("<C-Right>", C("wincmd l"), "Right")

-- Flash.nvim
map({ "n", "x", "o" }, ",", C("lua require('flash').jump()"))
nmap("%", C("lua require('snipe').open_buffer_menu()"), "Buffers")

vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
vim.keymap.set("n", "<C-p>", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "<C-n>", "<Plug>(YankyNextEntry)")

-- | Leader mappings

nmap(L("bs"), C("lua require('fzf-lua').blines()"), "Lines (open)")
nmap(L("bS"), C("lua require('fzf-lua').lines()"), "Lines (curr)")
nmap(L("bb"), C("lua require('fzf-lua').buffers()"), "Buffers")
nmap(L("b/"), C("lua require('fzf-lua').lgrep_curbuf()"), "Grep")
nmap(L("bw"), C("lua require('mini.bufremove.wipeout()')"), "Wipeout")
nmap(L("bz"), C("lua require('mini.misc').zoom()"), "Zoom")
nmap(L("bt"), C("lua require('mini.trailspace').trim()"), "Trim whitespace")

nmap(L("gf"), C("lua require('fzf-lua').git_files()"), "Files")
nmap(L("gs"), C("lua require('fzf-lua').git_status()"), "Status")
nmap(L("gp"), C("lua require('fzf-lua').git_commits()"), "Commits (proj)")
nmap(L("gb"), C("lua require('fzf-lua').git_bcommits()"), "Commits (buffer)")
nmap(L("gl"), C("LazyGit"), "LazyGit")

nmap(L("sy"), C("YankyRingHistory"), "Yanks")
nmap(L("s/"), C("lua require('fzf-lua').live_grep()"), "Grep")
nmap(L("sw"), C("lua require('fzf-lua').grep_cword()"), "Word")
nmap(L("sW"), C("lua require('fzf-lua').grep_cWORD()"), "WORD")
nmap(L("sh"), C("lua require('fzf-lua').helptags()"), "Help tags")
nmap(L("sf"), C("lua require('fzf-lua').files()"), "Files (.)")
nmap(L("s."), C("lua require('fzf-lua').resume()"), "Resume")
nmap(L("so"), C("lua require('fzf-lua').oldfiles()"), "Old files")

nmap(L("wx"), "<C-W>c", "X window", { remap = true })
nmap(L("w-"), "<C-W>s", "split up/down", { remap = true })
nmap(L("w|"), "<C-W>v", "split left/right", { remap = true })
nmap(L("wd"), C("windo diffsplit browse"), "diff split on")
nmap(L("wD"), C("windo diffoff"), "diff split off")
nmap(L("wl"), C("vertical resize +5"), "taller")
nmap(L("wk"), C("resize -5"), "thinner")
nmap(L("wj"), C("resize +5"), "wider")
nmap(L("wh"), C("vertical resize -5"), "shorter")

nmap(L(",t"), C("term"), "Terminal")
nmap(
	L(",c"),
	C(
		"lua require('fzf-lua').colorschemes({winopts={fullscreen = false, relative='cursor', row=0.1, col=0, height=0.3, width=0.3}})"
	),
	"Colours"
)
nmap(
	L(",C"),
	C(
		"lua require('fzf-lua').awesome_colorschemes({winopts={fullscreen = false, relative='cursor', row=0.1, col=0, height=0.3, width=0.3}})"
	),
	"Awesome colours"
)
nmap(L(",f"), C("lua require('oil').open()"), "Files")
nmap(L(",x"), C("lua MiniBufremove.delete()"), "Close")
nmap(L(",q"), C("qa!"), "Quit")
nmap(L(",p"), C("SoftfPencil"), "Soft Pencil")
nmap(
	L(",s"),
	C("lua require('fzf-lua').spell_suggest({winopts={relative='cursor', row=0.1, col=0, height=0.2, width=0.25}})"),
	"spellcheck"
)
