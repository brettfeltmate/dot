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

-- Non-leader mappings ===========================================================

nmap(":", "<Plug>(cmdpalette)")

imap("jk", "<esc>", "Exit insert mode", { silent = true })
tmap("jk", "<C-\\><C-n>", "Exit terminal mode", { silent = true })
tmap("<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")
-- Navigating in/across buffeers
nmap("H", C("lua MiniBracketed.buffer('backward')"), "Prev buffer")
nmap("L", C("lua MiniBracketed.buffer('forward')"), "Next buffer")

-- Navigating between neovim/wezterm splits
nmap("<C-Left>", C("lua require('smart-splits').move_cursor_left()"), "Left")
nmap("<C-Down>", C("lua require('smart-splits').move_cursor_down()"), "Down")
nmap("<C-Up>", C("lua require('smart-splits').move_cursor_up()"), "Up")
nmap("<C-Right>", C("lua require('smart-splits').move_cursor_right()"), "Right")
-- terminal mode analogs
tmap("<C-Left>", "<C-\\><C-N><C-Left>", "Left")
tmap("<C-Up>", "<C-\\><C-N><C-Up>", "Up")
tmap("<C-Down>", "<C-\\><C-N><C-Down>", "Down")
tmap("<C-Right>", "<C-\\><C-N><C-Right>", "Right")

-- Flash.nvim
map({ "n", "x", "o" }, ",", C("lua require('flash').jump()"))

vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
vim.keymap.set("n", "<C-p>", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "<C-n>", "<Plug>(YankyNextEntry)")

-- Leader mappings ==========================================================

-- | [B]uffer
nmap(L("bd"), C("lua MiniBufremove.delete()"), "Delete")
nmap(L("bs"), C("lua require('fzf-lua').blines()"), "Lines (open)")
nmap(L("bS"), C("lua require('fzf-lua').lines()"), "Lines (curr)")
nmap(L("bb"), C("lua require('fzf-lua').buffers()"), "Buffers")
nmap(L("b/"), C("lua require('fzf-lua').lgrep_curbuf()"), "Grep")
nmap(L("bw"), C("lua MiniBufremove.wipeout()"), "Wipeout")
nmap(L("bz"), C("lua MiniMisc.zoom()"), "Zoom")

-- | [C]hat
map({ "n", "i", "v" }, L("ct"), C("PrtChatToggle"), "Toggle")
nmap(L("cf"), C("PrtChatFinder"), "Find")
nmap(L("cr"), C("PrtRewrite"), "Rewrite")
vmap(L("cr"), C("'<,'>PrtRewrite"), "Rewrite")
nmap(L("ca"), C("PrtAppend"), "Append")
imap(L("ca"), C("PrtAppend"), "Append")
vmap(L("ca"), C("'<,'>PrtAppend"), "Append")
nmap(L("cp"), C("PrtPrepend"), "Prepend")
imap(L("cp"), C("PrtPrepend"), "Prepend")
vmap(L("cp"), C("'<,'>PrtPrepend"), "Prepend")
map({ "n", "i", "v" }, L("cs"), C("PrtStop"), "Stop")
nmap(L("cc"), C("PrtComplete"), "Complete")
imap(L("cc"), C("PrtComplete"), "Complete")
vmap(L("cc"), C("'<,'>PrtComplete"), "Complete")
nmap(L("cx"), C("PrtContext"), "Context")
nmap(L("ck"), C("PrtAsk"), "Ask")
nmap(L("cA"), C("PrtAgent"), "Agent")

-- | [L]SP
nmap(
	L("la"),
	C(
		"lua require('fzf-lua').lsp_code_actions({ winopts = { relative='cursor', row=1.01, col=0, height=0.3, width=0.6} })"
	),
	"Actions"
)
nmap(L("lx"), C("lua require('fzf-lua').lsp_document_diagnostics()"), "Diagnostics (doc)")
nmap(L("lX"), C("lua require('fzf-lua').lsp_workspace_diagnostics()"), "Diagnostics (proj)")
nmap(L("lf"), C("lua require('fzf-lua').lsp_finder()"), "Ref's, Def's, & Impl's")
-- nmap(L("lf"), C("lua require('fzf-lua').lsp_definitions()"), "Definitions")
-- nmap(L("lr"), C("lua require('fzf-lua').lsp_references()"), "References")
-- nmap(L("lu"), C("lua require('fzf-lua').lsp_implementations()"), "Implementations")
nmap(L("ld"), C("lua require('fzf-lua').lsp_document_symbols()"), "Document symbols")
nmap(L("lw"), C("lua require('fzf-lua').lsp_workspace_symbols()"), "Workspace symbols")
nmap(L("li"), C("lua require('fzf-lua').lsp_incoming_calls()"), "Incoming calls")
nmap(L("lo"), C("lua require('fzf-lua').lsp_outgoing_calls()"), "Outgoing calls")
nmap(L("lr"), C("lua vim.lsp.buf.rename()"), "Rename Symbol")

-- [M]olten
-- nmap(L("mi"), C("MoltenInit"), "Init")
-- nmap(L("m "), C("MoltenEvaluateLine"), "Eval: line")
-- nmap(L("mc"), C("MoltenReevaluateCell"), "Eval: cell")
-- vmap(L("m "), C("MoltenEvaluateVisual"), "Eval: visual")
-- nmap(L("md"), C("MoltenDelete"), "Del: cell")
-- nmap(L("mh"), C("MoltenHideOutput"), "Output: hide")
-- nmap(L("ms"), C("noautocmd MoltenEnterOutput"), "Output: show")

-- | [s]earch
nmap(L("ss"), C("lua require('fzf-lua').colorschemes()"), "Schemes")
nmap(L("sS"), C("lua require('fzf-lua').awesome_colorschemes()"), "Awesome schemes")
nmap(L("sy"), C("YankyRingHistory"), "yanks")
nmap(L("s/"), C("lua require('fzf-lua').live_grep()"), "Live Grep")
nmap(L("sh"), C("lua require('fzf-lua').helptags()"), "Help tags")
nmap(L("sf"), C("lua require('fzf-lua').files()"), "Files (.)")
nmap(L("sF"), C("lua require('fzf-lua').files({ cwd = '~/'})"), "Files (~)")
nmap(L("sC"), C("lua require('fzf-lua').files({ cwd = '~/.config/'})"), "Files (cfg)")
nmap(L("sm"), C("lua require('fzf-lua').manpages()"), "Manpages")
nmap(L("s."), C("lua require('fzf-lua').resume()"), "Resume")
nmap(L("so"), C("lua require('fzf-lua').oldfiles()"), "Old files")
nmap(L("sj"), C("lua require('fzf-lua').jumps()"), "Jumps")
nmap(L("sr"), C("lua require('fzf-lua').registers()"), "Registers")
nmap(L("sq"), C("lua require('fzf-lua').quickfix()"), "Quickfix")
nmap(L("sc"), C("lua require('fzf-lua').changes()"), "Changes")
nmap(L("sw"), C("lua require('fzf-lua').grep_cword()"), "Word")
nmap(L("sW"), C("lua require('fzf-lua').grep_cWORD()"), "WORD")

nmap(L("gf"), C("lua require('fzf-lua').git_files()"), "Files")
nmap(L("gs"), C("lua require('fzf-lua').git_status()"), "Status")
nmap(L("gp"), C("lua require('fzf-lua').git_commits()"), "Commits (proj)")
nmap(L("gb"), C("lua require('fzf-lua').git_bcommits()"), "Commits (buffer)")
nmap(L("gl"), C("LazyGit"), "LazyGit")

-- [,] convience mappings
nmap(L(",b"), C("qa!"), "bail")
nmap(L(",l"), C("Lazy"), "Lazy")
nmap(L(",e"), C("ChezFzf"), "EditMoi")
nmap(L(",o"), C("AerialToggle"), "Aerial")
nmap(L(",n"), C("AerialNavToggle"), "AerialNav")
nmap(L(",s"), C("w"), "Save")
nmap(L(",a"), C("wa!"), "Save (all)")
nmap(L(",f"), C("lua require('oil').toggle_float()"), "Files")
nmap(L(",t"), C("lua MiniTrailspace.trim()"), "Trim whitespace")
nmap(L(", "), C("term"), "Terminal")
nmap(L(" "), C("lua require('snipe').open_buffer_menu()"), "Buffers")

-- | [W]indows
-- TODO: refactor functions as script and require
local FlipSplit = function()
	local initial = vim.fn.winnr()

	if vim.fn.winwidth(0) > vim.fn.winheight(0) then
		vim.cmd("wincmd K")
	else
		vim.cmd("wincmd H")
	end

	local affected = vim.fn.winnr()

	if initial == affected then
		vim.cmd("wincmd H")
	else
		vim.cmd("wincmd K")
	end
end

local RotateBuffersCW = function()
	local visible_buffers = {}
	local win_count = vim.fn.winnr("$")

	for i = 1, win_count do
		vim.fn.win_gotoid(vim.fn.win_getid(i))
		table.insert(visible_buffers, vim.fn.bufnr("%"))
	end

	table.insert(visible_buffers, 1, table.remove(visible_buffers))

	for i = 1, win_count do
		vim.fn.win_gotoid(vim.fn.win_getid(i))
		vim.cmd("buffer " .. visible_buffers[i])
	end
end

function ScrollBind()
	for i = 1, vim.fn.winnr("$") do
		vim.cmd(i .. "windo set scrollbind")
	end
end

function ScrollUnbind()
	for i = 1, vim.fn.winnr("$") do
		vim.cmd(i .. "windo set scrollbind!")
	end
end
nmap(L("wf"), FlipSplit, "flip split")
nmap(L("wx"), "<C-W>c", "X window", { remap = true })
nmap(L("wr"), RotateBuffersCW, "rotate buffers (CW)", { remap = true })
nmap(L("w-"), "<C-W>s", "split up/down", { remap = true })
nmap(L("w|"), "<C-W>v", "split left/right", { remap = true })
nmap(L("wd"), C("windo diffsplit browse"), "diff split on")
nmap(L("wD"), C("windo diffoff"), "diff split off")
nmap(L("ws"), ScrollBind, "scrollbind on")
nmap(L("wS"), ScrollUnbind, "scrollbind off")
nmap(L("wl"), C("vertical resize +5"), "taller")
nmap(L("wk"), C("resize -5"), "thinner")
nmap(L("wj"), C("resize +5"), "wider")
nmap(L("wh"), C("vertical resize -5"), "shorter")

-- | [R]epl (iron.nvim)
nmap(L("ro"), C("IronRepl"), "Open")
nmap(L("rr"), C("IronRestart"), "Restart")
nmap(L("rf"), C("IronFocus"), "Focus")
nmap(L("rg"), C("IronSend gg()"), "Send: gg()")
nmap(L("ri"), C("IronSend <C-c>"), "Send: interrupt")
nmap(L("rc"), C("IronSend <C-l>"), "Send: clear")
nmap(L("rh"), C("IronHide"), "Hide")
nmap(L("rx"), C("lua require('iron.core').close_repl()"), "Close")
nmap(L("r%"), C("lua require('iron.core').send_paragraph()"), "Send: para")
nmap(L("r:"), C("lua require('iron.core').send_until_cursor()"), "Send: cursor")
nmap(L("r;"), C("lua require('iron.core').send_file()"), "Send: file")
nmap(L("r "), C("lua require('iron.core').send_line()"), "Send: line")
vmap(L("r "), C("lua require('iron.core').visual_send()"), "Send: select")
