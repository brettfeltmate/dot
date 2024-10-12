-- -| Helper methods |-
local map = function(mode, lhs, rhs, desc, opts)
	opts = opts or {}
	opts.desc = desc
	vim.keymap.set(mode, lhs, rhs, opts)
end

local L = function(key)
	return "<leader>" .. key
end

local C = function(cmd)
	return "<Cmd>" .. cmd .. "<CR>"
end

-- Non-leader mappings ===========================================================

map({ "n" }, "<C-c>", function()
	local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
	require("menu").open(options, {})
end, "Menu", { noremap = true, silent = true })

map(
	{ "n" },
	"[c",
	C("lua require('treesitter-context').go_to_context(vim.v.count1)"),
	"Previous context",
	{ silent = true }
)

map({ "n" }, "<Esc>", "<cmd>nohlsearch<CR>")
map({ "t" }, "<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")

-- Navigating between neovim/tmux splits
map({ "n" }, "<C-Left>", C("lua require('smart-splits').move_cursor_left()"), "Left")
map({ "n" }, "<C-Down>", C("lua require('smart-splits').move_cursor_down()"), "Down")
map({ "n" }, "<C-Up>", C("lua require('smart-splits').move_cursor_up()"), "Up")
map({ "n" }, "<C-Right>", C("lua require('smart-splits').move_cursor_right()"), "Right")

map({ "t" }, "<C-Left>", "<C-\\><C-n><C-Up>", "Left")
map({ "t" }, "<C-Down>", "<C-\\><C-n><C-Down>", "Down")
map({ "t" }, "<C-Up>", "<C-\\><C-n><C-Up>", "Up")
map({ "t" }, "<C-Right>", "<C-\\><C-n><C-Right>", "Right")

map({ "n" }, "<C-S-Left>", C("lua require('smart-splits').resize_left()"), "Left")
map({ "n" }, "<C-S-Down>", C("lua require('smart-splits').resize_down()"), "Down")
map({ "n" }, "<C-S-Up>", C("lua require('smart-splits').resize_up()"), "Up")
map({ "n" }, "<C-S-Right>", C("lua require('smart-splits').resize_right()"), "Right")

-- Multiple cursors
map({ "n", "x" }, "<C-j>", C("MultipleCursorsAddDown"), "Add cursor, move down")
map({ "n", "x" }, "<C-k>", C("MultipleCursorsAddUp"), "Add cursor, move up")
map({ "i" }, "<M-Up>", C("MultipleCursorsAddUp"), "Add cursor, move up")
map({ "i" }, "<M-Down>", C("MultipleCursorsAddDown"), "Add cursor, move down")
map({ "n", "x", "o" }, "<C-LeftMouse>", C("MultipleCursorMouseAddDelete"), "Add or remove a cursor")

map({ "n", "x" }, "<M-J>", "}W")
map({ "n", "x" }, "<M-K>", "{{W")

-- Flash.nvim
map({ "n", "x", "o" }, ",", C("lua require('flash').jump()"))

-- Yanky
map({ "n", "x" }, "y", "<Plug>(YankyYank)")
map({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
map({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
map({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
map({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
map({ "n" }, "<C-p>", "<Plug>(YankyPreviousEntry)")
map({ "n" }, "<C-n>", "<Plug>(YankyNextEntry)")

-- remap increment/decrement to not conflict with tmux
map({ "n" }, "+", "<C-a>", "Increment", { noremap = true })
map({ "n" }, "-", "<C-x>", "Decrement", { noremap = true })

-- wtf.nvim
map({ "n" }, "gw", C("lua require('wtf').ai()"), "wtf is this")
map({ "x" }, "gw", C("lua require('wtf').ai()"), "wtf is this")

map({ "n" }, "H", C("lua require('nvchad.tabufline').prev()"), "Previous buffer")
map({ "n" }, "L", C("lua require('nvchad.tabufline').next()"), "Next buffer")

map({ "n" }, "<A-h>", C("tabprevious"), "Previous tab")
map({ "n" }, "<A-l>", C("tabnext"), "Next tab")
map({ "n" }, "<A-x>", C("tabclose"), "Close tab")

for i = 1, 9, 1 do
	vim.keymap.set("n", "-" .. i, function()
		vim.api.nvim_set_current_buf(vim.t.bufs[i])
	end)
end

map(
	{ "n" },
	"_",
	C(
		"lua require('fzf-lua').buffers({"
			.. "    winopts = {"
			.. "        fullscreen=false,"
			.. "        relative='cursor',"
			.. "        row=0,"
			.. "        col=1,"
			.. "        height=0.4,"
			.. "        width=0.5,"
			.. "        preview = {"
			.. "            title_pos = 'center',"
			.. "            horizontal = 'right:70%',"
			.. "            vertical = 'down:50%',"
			.. "            layout = 'vertical',"
			.. "        }"
			.. "    }"
			.. "})"
	),
	"Buffers"
)
-- Leader mappings ==========================================================

-- | [B]uffer
map({ "n" }, L("bx"), C("lua require('nvchad.tabufline').close_buffer()"), "Close")
map({ "n" }, L("bs"), C("lua require('fzf-lua').blines()"), "Lines (open)")
map({ "n" }, L("bS"), C("lua require('fzf-lua').lines()"), "Lines (curr)")
map({ "n" }, L("bb"), C("lua require('fzf-lua').buffers()"), "Buffers")
map({ "n" }, L("bg"), C("lua require('fzf-lua').grep_curbuf()"), "Grep")
map({ "n" }, L("b/"), C("lua require('fzf-lua').lgrep_curbuf()"), "LiveGrep")
map({ "n" }, L("bz"), C("lua require('mini.misc').zoom()"), "Zoom")
map({ "n" }, L("bt"), C("lua require('mini.trailspace').trim()"), "Trim whitespace")
map({ "n" }, L("bm"), C("MarkdownPreviewToggle"), "Toggle Preview")
map({ "n" }, L("bp"), C("PasteImage"), "Insert Image")

-- | [L]SP
map(
	{ "n" },
	L("la"),
	C(
		"lua require('fzf-lua').lsp_code_actions({ winopts = {fullscreen=false, relative='editor', row=0.5, col=0, height=0.5, width=1} })"
	),
	"Actions"
)
map({ "n" }, L("lx"), C("lua require('fzf-lua').lsp_document_diagnostics()"), "Diagnostics (doc)")
map({ "n" }, L("lf"), C("lua require('fzf-lua').lsp_finder()"), "Ref's, Def's, & Impl's")
map({ "n" }, L("li"), C("lua require('fzf-lua').lsp_implemenations()"), "Implementations")
map({ "n" }, L("lr"), C("lua require('fzf-lua').lsp_references()"), "References")
map({ "n" }, L("ld"), C("lua require('fzf-lua').lsp_definitions()"), "Definitions")
map({ "n" }, L("ls"), C("lua require('fzf-lua').lsp_workspace_symbols()"), "Symbols")
map({ "n" }, L("ln"), C("lua require('nvchad.lsp.renamer')()"), "Rename Symbol")

-- | [s]earch
map({ "n" }, L("sy"), C("YankyRingHistory"), "Yanks")
map({ "n" }, L("sc"), C("ChezFzf"), "Config")
map({ "n" }, L("sg"), C("lua require('fzf-lua').live_grep()"), "Grep locally")
map({ "n" }, L("sG"), C("lua require('fzf-lua').live_grep_native({ cwd = '~/projects'})"), "Grep projects")
map({ "n" }, L("sf"), C("lua require('fzf-lua').files()"), "Files (cwd)")
map({ "n" }, L("sF"), C("lua require('fzf-lua').files({ cwd = '~/projects'})"), "Files (projs)")
map({ "n" }, L("s."), C("lua require('fzf-lua').resume()"), "Resume")
map({ "n" }, L("sh"), C("lua require('fzf-lua').helptags()"), "Helptags")
map({ "n" }, L("so"), C("lua require('fzf-lua').oldfiles()"), "Oldfiles")
map(
	{ "n" },
	L("sC"),
	C(
		"lua require('fzf-lua').commands({ winopts = {fullscreen=false, relative='editor', row=0, col=1, height=0.5, width=0.4} })"
	),
	"Commands"
)

map({ "n" }, L("gf"), C("lua require('fzf-lua').git_files()"), "Files")
map({ "n" }, L("gs"), C("lua require('fzf-lua').git_status()"), "Status")
map({ "n" }, L("gp"), C("lua require('fzf-lua').git_commits()"), "Commits (proj)")
map({ "n" }, L("gb"), C("lua require('fzf-lua').git_bcommits()"), "Commits (buffer)")
map({ "n" }, L("gl"), C("LazyGit"), "LazyGit")
map({ "n" }, L("gc"), C("lua require('copilot.panel').open()"), "Copilot")
map({ "n" }, L("ga"), C("lua require('copilot.autosuggstion').toggle_auto_trigger()"), "Autosuggestions")

-- [,] convience mappings
map({ "n" }, L(",d"), C("lua require('tiny-inline-diagnostic').toggle()"), "Diagnostics")
map({ "n" }, L(",f"), C("lua require('oil').open()"), "Oil")
map({ "n" }, L(",n"), C("NvimTreeToggle"), "NvimTree")
map({ "n" }, L(",s"), C("Outline!"), "Symbols")
map({ "n" }, L(",r"), C("lua require('persistence').load()"), "Restore")
map({ "n" }, L(",h"), C("lua require('hardtime').toggle()"), "Hardtime")
map({ "n" }, L(",c"), C("lua require('nvchad.themes').open()"), "Colorschemes")
map({ "n" }, L(",u"), C("UndotreeToggle"), "UndoTree")
map(
	{ "n" },
	L(",C"),
	C(
		"lua require('fzf-lua').awesome_colorschemes({ winopts = {fullscreen=false, relative='editor', row=0, col=1, height=0.3, width=0.4} })"
	),
	"Awesome Colorschemes"
)
map({ "n" }, L(",x"), C("Noice fzf"), "Noice")
map({ "n" }, L(",t"), C("lua require('base46').toggle_transparency()"), "Transparency")
map({ "n" }, L(",a"), C("lua require('base46').load_all_highlights()"), "Apply highlights")

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
map({ "n" }, L("wf"), FlipSplit, "flip split")
map({ "n" }, L("wx"), "<C-W>c", "X window", { remap = true })
map({ "n" }, L("wr"), RotateBuffersCW, "rotate buffers (CW)", { remap = true })
map({ "n" }, L("w-"), "<C-W>s", "split up/down", { remap = true })
map({ "n" }, L("w|"), "<C-W>v", "split left/right", { remap = true })
map({ "n" }, L("wd"), C("windo diffsplit browse"), "diff split on")
map({ "n" }, L("wD"), C("windo diffoff"), "diff split off")
map({ "n" }, L("ws"), ScrollBind, "scrollbind on")
map({ "n" }, L("wS"), ScrollUnbind, "scrollbind off")
