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

local xmap = function(...)
	map("x", ...)
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

-- nmap(":", "<Plug>(cmdpalette)")
nmap("<Esc>", "<cmd>nohlsearch<CR>")
tmap("<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")

-- Navigating between neovim/tmux splits
nmap("<C-Left>", C("lua require('smart-splits').move_cursor_left()"), "Left")
nmap("<C-Down>", C("lua require('smart-splits').move_cursor_down()"), "Down")
nmap("<C-Up>", C("lua require('smart-splits').move_cursor_up()"), "Up")
nmap("<C-Right>", C("lua require('smart-splits').move_cursor_right()"), "Right")

nmap("<C-S-Left>", C("lua require('smart-splits').resize_left()"), "Left")
nmap("<C-S-Down>", C("lua require('smart-splits').resize_down()"), "Down")
nmap("<C-S-Up>", C("lua require('smart-splits').resize_up()"), "Up")
nmap("<C-S-Right>", C("lua require('smart-splits').resize_right()"), "Right")

-- Multiple cursors
map({ "n", "x" }, "<C-j>", C("MultipleCursorsAddDown"), "Add cursor, move down")
map({ "n", "x" }, "<C-k>", C("MultipleCursorsAddUp"), "Add cursor, move up")
map({ "i" }, "<M-Up>", C("MultipleCursorsAddUp"), "Add cursor, move up")
map({ "i" }, "<M-Down>", C("MultipleCursorsAddDown"), "Add cursor, move down")
map({ "n", "i" }, "<C-LeftMouse>", C("MultipleCursorsMouseAddDelete"), "Add or remove cursor")
map({ "n", "x" }, L("ma"), C("MultipleCursorsAddMatches"), "Add to cword")
map({ "n", "x" }, L("mA"), C("MultipleCursorsAddMatchesV"), "Add to cword, previous area")
map({ "n", "x" }, L("md"), C("MultipleCursorsAddJumpNextMatch"), "Add, jump to cword")
map({ "n", "x" }, L("mD"), C("MultipleCursorsJumpNextMatch"), "Jump to cword")
map({ "n", "x" }, L("ml"), C("MultipleCursorsLock"), "Lock")

-- Flash.nvim
map({ "n", "x", "o" }, ",", C("lua require('flash').jump()"))

-- Yanky
vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
vim.keymap.set("n", "<C-p>", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "<C-n>", "<Plug>(YankyNextEntry)")

-- remap increment/decrement to not conflict with tmux
nmap("+", "<C-a>", "Increment", { noremap = true })
nmap("-", "<C-x>", "Decrement", { noremap = true })

-- wtf.nvim
nmap("gw", C("lua require('wtf').ai()"), "wtf is this")
xmap("gw", C("lua require('wtf').ai()"), "wtf is this")

-- Snipe buffers
nmap("%", C("lua require('snipe').open_buffer_menu()"), "Snipe")
-- buffer navigation (barbar)
local op = function(desc)
	return { silent = true, noremap = true, desc = desc }
end

-- Move to previous/next
vim.keymap.set("n", "-,", "<Cmd>BufferPrevious<CR>", op("Previous buffer"))
vim.keymap.set("n", "-.", "<Cmd>BufferNext<CR>", op("Next buffer"))
vim.keymap.set("n", "H", "<Cmd>BufferPrevious<CR>", op("Previous buffer"))
vim.keymap.set("n", "L", "<Cmd>BufferNext<CR>", op("Next buffer"))
-- Goto buffer in position...
vim.keymap.set("n", "-1", "<Cmd>BufferGoto 1<CR>", op("Goto 1"))
vim.keymap.set("n", "-2", "<Cmd>BufferGoto 2<CR>", op("Goto 2"))
vim.keymap.set("n", "-3", "<Cmd>BufferGoto 3<CR>", op("Goto 3"))
vim.keymap.set("n", "-4", "<Cmd>BufferGoto 4<CR>", op("Goto 4"))
vim.keymap.set("n", "-5", "<Cmd>BufferGoto 5<CR>", op("Goto 5"))
vim.keymap.set("n", "-6", "<Cmd>BufferGoto 6<CR>", op("Goto 6"))
vim.keymap.set("n", "-7", "<Cmd>BufferGoto 7<CR>", op("Goto 7"))
vim.keymap.set("n", "-8", "<Cmd>BufferGoto 8<CR>", op("Goto 8"))
vim.keymap.set("n", "-9", "<Cmd>BufferGoto 9<CR>", op("Goto 9"))
-- Pin/unpin buffer
vim.keymap.set("n", "--", "<Cmd>BufferPin<CR>", op("Pin buffer"))
-- Close buffer
vim.keymap.set("n", "-%", "<Cmd>BufferClose<CR>", op("Close buffer"))
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

-- Leader mappings ==========================================================

-- | [B]uffer
nmap(L("bd"), C("lua require('mini.bufremove').delete()"), "Delete")
nmap(L("bs"), C("lua require('fzf-lua').blines()"), "Lines (open)")
nmap(L("bS"), C("lua require('fzf-lua').lines()"), "Lines (curr)")
nmap(L("bb"), C("lua require('fzf-lua').buffers()"), "Buffers")
nmap(L("b/"), C("lua require('fzf-lua').lgrep_curbuf()"), "Grep")
nmap(L("bw"), C("lua require('mini.bufremove.wipeout()')"), "Wipeout")
nmap(L("bz"), C("lua require('mini.misc').zoom()"), "Zoom")
nmap(L("bt"), C("lua require('mini.trailspace').trim()"), "Trim whitespace")
nmap(L("bm"), C("MarkdownPreviewToggle"), "Toggle Preview")
nmap(L("bp"), C("PasteImage"), "Insert Image")

-- | [C]hat
nmap(L("cn"), C("PrtChatNew tabnew"), "New")
nmap(L("ct"), C("PrtChatToggle"), "Toggle")
nmap(L("cr"), C("PrtRewrite"), "Rewrite")
vmap(L("cr"), C("'<,'>PrtRewrite"), "Rewrite")
nmap(L("ca"), C("PrtAppend"), "Append")
vmap(L("ca"), C("'<,'>PrtAppend"), "Append")
nmap(L("cp"), C("PrtPrepend"), "Prepend")
vmap(L("cp"), C("'<,'>PrtPrepend"), "Prepend")
nmap(L("cs"), C("PrtStop"), "Stop")
vmap(L("cs"), C("PrtStop"), "Stop")
nmap(L("cc"), C("PrtComplete"), "Complete")
vmap(L("cc"), C("'<,'>PrtComplete"), "Complete")
nmap(L("cx"), C("PrtContext"), "Context")
nmap(L("ck"), C("PrtAsk"), "Ask")

-- | [L]SP
nmap(
	L("la"),
	C(
		"lua require('fzf-lua').lsp_code_actions({ winopts = {fullscreen=false, relative='editor', row=0.5, col=0, height=0.5, width=1} })"
	),
	"Actions"
)
nmap(L("lx"), C("lua require('fzf-lua').lsp_document_diagnostics()"), "Diagnostics (doc)")
nmap(L("lX"), C("lua require('fzf-lua').lsp_workspace_diagnostics()"), "Diagnostics (proj)")
nmap(L("lf"), C("lua require('fzf-lua').lsp_finder()"), "Ref's, Def's, & Impl's")
nmap(L("ld"), C("lua require('fzf-lua').lsp_document_symbols()"), "Document symbols")
nmap(L("lw"), C("lua require('fzf-lua').lsp_workspace_symbols()"), "Workspace symbols")
nmap(L("lr"), C("lua vim.lsp.buf.rename()"), "Rename Symbol")
nmap(L("lo"), C("Outline!"), "Toggle Outline")

-- | [s]earch
nmap(L("sy"), C("YankyRingHistory"), "Yanks")
nmap(L("sc"), C("ChezFzf"), "Config")
nmap(L("s/"), C("lua require('fzf-lua').live_grep()"), "Live Grep")
nmap(L("sh"), C("lua require('fzf-lua').helptags()"), "Help tags")
nmap(L("sf"), C("lua require('fzf-lua').files()"), "Files (.)")
nmap(L("sF"), C("lua require('fzf-lua').files({ cwd = '~/'})"), "Files (~)")
nmap(L("s."), C("lua require('fzf-lua').resume()"), "Resume")
nmap(L("so"), C("lua require('fzf-lua').oldfiles()"), "Old files")
nmap(L("sq"), C("lua require('fzf-lua').quickfix()"), "Quickfix")

nmap(L("gf"), C("lua require('fzf-lua').git_files()"), "Files")
nmap(L("gs"), C("lua require('fzf-lua').git_status()"), "Status")
nmap(L("gp"), C("lua require('fzf-lua').git_commits()"), "Commits (proj)")
nmap(L("gb"), C("lua require('fzf-lua').git_bcommits()"), "Commits (buffer)")
nmap(L("gl"), C("LazyGit"), "LazyGit")

-- [,] convience mappings
nmap(L(",f"), C("lua require('oil').open()"), "Oil")
nmap(L(",n"), C("Neotree"), "Neotree")
nmap(L(",b"), C("StandNow"), "Break")
nmap(L(",t"), C("term"), "Terminal")
nmap(L(",s"), C("lua require('persistence').load()"), "Session")
nmap(L(",h"), C("lua require('hardtime').toggle()"), "Hardtime")
nmap(
	"<,c>",
	C(
		"lua require('fzf-lua').colorschemes({ winopts = {fullscreen=false, relative='editor', row=0, col=1, height=0.3, width=0.2} })"
	),
	"Colorschemes"
)
nmap(
	"<,C>",
	C(
		"lua require('fzf-lua').awesome_colorschemes({ winopts = {fullscreen=false, relative='editor', row=0, col=1, height=0.3, width=0.2} })"
	),
	"Awesome Colorschemes"
)

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
