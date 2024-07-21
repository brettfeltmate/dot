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
imap("jk", "<esc>", "Exit insert mode", { silent = true })
tmap("jk", "<C-\\><C-n>", "Exit terminal mode", { silent = true })
tmap("<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")
-- Navigating in/across buffeers
nmap("H", C("lua MiniBracketed.buffer('backward')"), "Prev buffer")
nmap("L", C("lua MiniBracketed.buffer('forward')"), "Next buffer")

nmap("gD", C("Pick lsp scope='declaration'"), "Declaration")
nmap("gd", C("Pick lsp scope='definition'"), "Definition")
nmap("gi", C("Pick lsp scope='implementation'"), "Implementation")
nmap("gr", C("Pick lsp scope='references'"), "References")
nmap("gt", C("Pick lsp scope='type_definition'"), "Type definition")

-- Navigating between neovim/wezterm splits
nmap("<C-Left>", C("lua require('smart-splits').move_cursor_left()"), "Left")
nmap("<C-Down>", C("lua require('smart-splits').move_cursor_down()"), "Down")
nmap("<C-Up>", C("lua require('smart-splits').move_cursor_up()"), "Up")
nmap("<C-Right>", C("lua require('smart-splits').move_cursor_right()"), "Right")

tmap("<C-Left>", "<C-\\><C-N><C-Left>", "Left")
tmap("<C-Up>", "<C-\\><C-N><C-Up>", "Up")
tmap("<C-Down>", "<C-\\><C-N><C-Down>", "Down")
tmap("<C-Right>", "<C-\\><C-N><C-Right>", "Right")

-- Flash.nvim
map({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, "Flash")
map({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, "Flash TS")
map("o", "r", function()
	require("flash").remote()
end, "Remote Flash")
map({ "o", "x" }, "R", function()
	require("flash").treesitter_search()
end, "TS search")
map("c", "<C-s>", function()
	require("flash").toggle()
end, "Toggle Flash Search")

-- yanky.nvim
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
vim.keymap.set("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)")
vim.keymap.set("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)")
vim.keymap.set("n", "]P", "<Plug>(YankyPutIndentAfterLinewise)")
vim.keymap.set("n", "[P", "<Plug>(YankyPutIndentBeforeLinewise)")

vim.keymap.set("n", ">p", "<Plug>(YankyPutIndentAfterShiftRight)")
vim.keymap.set("n", "<p", "<Plug>(YankyPutIndentAfterShiftLeft)")
vim.keymap.set("n", ">P", "<Plug>(YankyPutIndentBeforeShiftRight)")
vim.keymap.set("n", "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)")

vim.keymap.set("n", "=p", "<Plug>(YankyPutAfterFilter)")
vim.keymap.set("n", "=P", "<Plug>(YankyPutBeforeFilter)")

-- Leader mappings ==========================================================

-- | [B]uffer
nmap(L("bd"), C("lua MiniBufremove.delete()"), "Delete")
nmap(L("bg"), C("GrugFar"), "Search & Replace")
nmap(L("bf"), C("lua vim.lsp.buf.formatting()"), "Format")
nmap(L("bs"), C("Pick buffers"), "Switch")
nmap(L("bt"), C("lua MiniTrailspace.trim()"), "Trim trailing")
nmap(L("bw"), C("lua MiniBufremove.wipeout()"), "Wipeout")
nmap(L("b/"), C("Pick buf_lines scope='current'"), "Grep (buffer)")
nmap(L("bz"), C("lua MiniMisc.zoom()"), "Zoom")

-- | [L]SP
nmap(L("la"), C("Lspsaga code_action"), "Actions")
nmap(L("lk"), C("lua require('tiny-inline-diagnostic').get_diagnostic_under_cursor(bufnr)"), "Dignostics (cursor)")
nmap(L("ld"), C("lua require('tiny-inline-diagnostic').toggle()"), "Toggle inline diagnostics")
nmap(L("lD"), C("Lspsaga show_workspace_diagnostics ++float"), "Diagnostics (buffer)")
nmap(L("lh"), C("Lspsaga hover_doc"), "Hover")
nmap(L("lH"), C("Lspsaga hover_doc ++keep"), "Hover (sticky)")
nmap(L("lo"), C("Lspsaga outline"), "Outline")
nmap(L("lf"), C("Lspsaga finder"), "find def's, ref's, & impl's")
nmap(L("lr"), C("Lspsaga rename"), "Rename (buffer)")
nmap(L("lR"), C("Lspsaga rename ++project"), "Rename (project)")

-- | [s]earch

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

-- [M]olten
nmap(L("mi"), C("MoltenInit"), "Init")
nmap(L("m "), C("MoltenEvaluateLine"), "Eval: line")
nmap(L("mc"), C("MoltenReevaluateCell"), "Eval: cell")
vmap(L("m "), C("MoltenEvaluateVisual"), "Eval: visual")
nmap(L("md"), C("MoltenDelete"), "Del: cell")
nmap(L("mh"), C("MoltenHideOutput"), "Output: hide")
nmap(L("ms"), C("noautocmd MoltenEnterOutput"), "Output: show")

nmap(L("sc"), pick_colorscheme, "colorscheme")
nmap(L("sd"), C("Pick help"), "doc")
nmap(L("sf"), C("Pick files"), "file")
nmap(L("sn"), C("Pick grep pattern='(TODO|FIXME|HACK|NOTE):'"), "note")
nmap(L("sr"), C("Pick visit_paths"), "recent files (proj)")
nmap(L("ss"), C("Pick lsp scope='document_symbol'"), "Document symbols")
nmap(L("sS"), C("Pick lsp scope='workspace_symbol'"), "Workspace symbols")
nmap(L("sy"), C("YankyRingHistory"), "yanks")
nmap(L("s/"), C("Pick grep_live"), "grep (cwd)")
nmap(L('s"'), C("Pick registers"), "register")

-- [p]ossession
local possession = require("nvim-possession")
nmap(L("pl"), possession.list, "List")
nmap(L("pn"), possession.new, "New")
nmap(L("pu"), possession.update, "Update")
nmap(L("pd"), possession.delete, "Delete")

-- | [U]I
nmap(L("ub"), C("quitall!"), "bail")
nmap(L(",b"), C("quitall!"), "bail")
nmap(L("ud"), C("confirm xall"), "dip")
nmap(L(",d"), C("confirm xall"), "dip")
nmap(L("ul"), C("Lazy"), "lazy")
nmap(L("ue"), C("ChezFzf"), "Edit confs")
nmap(L("ua"), C("lua require('autosave.actions').buf_toggle()"), "Autosave: toggle buf")
nmap(L("uA"), C("lua require('autosave.actions').global_toggle()"), "Autosave: toggle all")
map({ "i", "x", "n", "s" }, L(",s"), "<cmd>w<cr><esc>", "save buffer")
map({ "i", "x", "n", "s" }, L(",S"), "<cmd>wa<cr><esc>", "save all")
map({ "i", "x", "n", "s" }, L("us"), "<cmd>w<cr><esc>", "save buffer")
map({ "i", "x", "n", "s" }, L("uS"), "<cmd>wa<cr><esc>", "save all")
nmap(L("uf"), MiniFiles.open, "files (cwd)")
nmap(L(",f"), MiniFiles.open, "files (cwd)")
local fterm = require("FTerm")
nmap(L("u,"), fterm.toggle, "toggle term")
nmap(L(",,"), fterm.toggle, "toggle term")
tmap(L("u,"), "<C-\\><C-n><cmd>lua require('FTerm').toggle()<cr>", "toggle term")
tmap(L(",,"), "<C-\\><C-n><cmd>lua require('FTerm').toggle()<cr>", "toggle term")

-- | [W]indows
-- TODO: refactor as plugin
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
nmap(L("wh"), C("vertical resize +5"), "taller")
nmap(L("wj"), C("resize -5"), "thinner")
nmap(L("wk"), C("resize +5"), "wider")
nmap(L("wl"), C("vertical resize -5"), "shorter")

-- | [R]epl
local iron = require("iron.core")
nmap(L("ro"), C("IronRepl"), "Open")
nmap(L("rr"), C("IronRestart"), "Restart")
nmap(L("rf"), C("IronFocus"), "Focus")
nmap(L("rg"), C("IronSend gg()"), "Send: gg()")
nmap(L("ri"), C("IronSend <C-c>"), "Send: interrupt")
nmap(L("rc"), C("IronSend <C-l>"), "Send: clear")
nmap(L("rh"), C("IronHide"), "Hide")
nmap(L("rx"), iron.close_repl, "Close")
nmap(L("r%"), iron.send_paragraph, "Send: para")
nmap(L("r:"), iron.send_until_cursor, "Send: cursor")
nmap(L("r;"), iron.send_file, "Send: file")
nmap(L("r "), iron.send_line, "Send: line")
vmap(L("r "), iron.visual_send, "Send: select")
