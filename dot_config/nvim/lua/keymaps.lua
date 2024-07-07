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
tmap("<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")
nmap("<S-k>", C("Lspsaga hover_doc"), "Hover")

-- nmap("j", "jzz", "", { remap = true, silent = true })
-- nmap("k", "kzz", "", { remap = true, silent = true })
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

-- nvim-ufo (for folds)
nmap("zR", require("ufo").openAllFolds, "open all folds (ufo)")
nmap("zM", require("ufo").closeAllFolds, "close all folds (ufo)")

-- Leader mappings ==========================================================

-- | [B]uffer
nmap(L("bd"), C("lua MiniBufremove.delete()"), "Delete")
nmap(L("bg"), C("GrugFar"), "Search & Replace")
nmap(L("bf"), C("lua vim.lsp.buf.formatting()"), "Format")
nmap(L("bs"), C("Pick buffers"), "Switch")
nmap(L("bt"), C("Inspect"), "node (TS)")
nmap(L("bT"), C("InspectTree"), "tree (TS)")
nmap(L("bw"), C("lua MiniBufremove.wipeout()"), "Wipeout")
nmap(L("b/"), C("Pick buf_lines scope='current'"), "Grep (buffer)")

-- | [C]opilot
-- nmap(L("co"), C("lua require('CopilotChat').open()"), "Open chat (float)")
-- nmap(L("cc"), C("lua require('CopilotChat').close()"), "Close chat")
-- nmap(L("cv"), C("lua require('CopilotChat').toggle()"), "Toggle chat")
--
-- nmap(L("ce"), C("lua require('CopilotChat').toggle()"), "Toggle chat")
-- nmap(L("cd"), C("lua require('CopilotChat').toggle()"), "Toggle chat")
-- nmap(L("ce"), C("lua require('CopilotChat').toggle()"), "Toggle chat")
-- nmap(L("ci"), C())
-- nmap(L("ct"), C("lua require('CopilotChat').toggle()"), "Toggle chat")
-- nmap(L("cr"), C("lua require('CopilotChat').toggle()"), "Toggle chat")

-- | [G]it
-- nmap(L("go"), C("LazyGit"), "open (cwd)")
-- nmap(L("gO"), C("LazyGitCurrentFile"), "open (root)")
-- nmap(L("gc"), C("LazyGitFilter"), "commits (root)")
-- nmap(L("gC"), C("LazyGitFilterCurrentFile"), "commits (buffer)")

-- | [H]arpoon
local harpoon = require("harpoon")
harpoon:setup()

nmap(L("ha"), function()
	harpoon:list():add()
end, "Add mark")

nmap(L("hl"), function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, "List marks")

nmap(L("hf"), function()
	harpoon:list():next()
end, "Next mark")

nmap(L("hs"), function()
	harpoon:list():prev()
end, "Previous mark")

nmap(L("hc"), function()
	harpoon:list():select(1)
end, "1st mark")

nmap(L("hd"), function()
	harpoon:list():select(2)
end, "2nd mark")

nmap(L("he"), function()
	harpoon:list():select(3)
end, "3rd mark")

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

nmap(L("sc"), pick_colorscheme, "colorscheme")
nmap(L("sd"), C("Pick help"), "doc")
nmap(L("sf"), C("Pick files"), "file")
nmap(L("sk"), C("Pick keymaps"), "keymap")
nmap(L("sh"), C("Pick history"), "cmd history")
nmap(L("sn"), C("Pick grep pattern='(TODO|FIXME|HACK|NOTE):'"), "note")
nmap(L("so"), C("Pick options"), "option")
nmap(L("sr"), C("Pick visit_paths"), "recent files (proj)")
nmap(L("sR"), C("Pick oldfiles"), "recent files (all)")
nmap(L("ss"), C("Pick lsp scope='document_symbol'"), "Document symbols")
nmap(L("sS"), C("Pick lsp scope='workspace_symbol'"), "Workspace symbols")
nmap(L("st"), C("Pick treesitter"), "treesitter node")
nmap(L("s/"), C("Pick grep_live"), "grep (cwd)")
nmap(L('s"'), C("Pick registers"), "register")
nmap(L("s."), C("Pick resume"), "resume")

-- | [S]ession management
nmap(L("Sd"), C("lua MiniSessions.delete()"), "delete")
nmap(L("Sl"), C("lua MiniSessions.select()"), "load")
nmap(L("Sm"), C("mksession"), "make")
nmap(L("Ss"), C("lua MiniSessions.save()"), "save")

-- | [U]I
nmap(L("ub"), C("qa!"), "bail")
nmap(L("uc"), C("lua require('stay-centered').toggle()"), "centre cursor")
nmap(L("ud"), C("qa"), "dip")
nmap(L("uf"), C("lua MiniFiles.open()"), "files")
nmap(L("uh"), C("vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()"), "inlay hints")
nmap(L("ul"), C("Lazy"), "lazy")
nmap(L("um"), C("lua MiniMap.toggle()"), "map")
map({ "i", "x", "n", "s" }, L("us"), "<cmd>w<cr><esc>", "save buffer")
map({ "i", "x", "n", "s" }, L("uS"), "<cmd>wa<cr><esc>", "save all")
nmap(L("uy"), C("lua require('yazi').yazi()"), "yazi")
nmap(L("up"), C("CccPick"), "pick color")

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

nmap(L("wf"), FlipSplit, "flip split")
nmap(L("wx"), "<C-W>c", "X window", { remap = true })
nmap(L("wr"), RotateBuffersCW, "rotate buffers (CW)", { remap = true })
nmap(L("w-"), "<C-W>s", "split up/down", { remap = true })
nmap(L("w|"), "<C-W>v", "split left/right", { remap = true })
nmap(L("wg"), C("windo diffthis"), "diff split on")
nmap(L("wG"), C("windo diffoff"), "diff split off")
nmap(L("wh"), C("vertical resize +5"), "shift splitline left")
nmap(L("wj"), C("resize -5"), "shift splitline down")
nmap(L("wk"), C("resize +5"), "Shift splitline up")
nmap(L("wl"), C("vertical resize -5"), "shift splitline right")

-- | [T]erminal

nmap(L("to"), "IronRepl", "Open")
nmap(L("th"), "IronHide", "Hide")
nmap(L("tf"), "IronFocus", "Hide")
nmap(L("tx"), "IronExit", "Exit")
nmap(L("ti"), "lua require('iron.core').interrupt", "Interrupt")
nmap(L("tl"), "lua require('iron.core').send_line", "Line")
nmap(L("tp"), "lua require('iron.core').send_paragraph", "Pragraph")
nmap(L("tc"), "lua require('iron.core').send_until_cursor", "Cursor")
nmap(L("tv"), "lua require('iron.core').visual_send", "Visual")
vmap(L("tC"), "lua require('iron.core').clear", "Clear")
