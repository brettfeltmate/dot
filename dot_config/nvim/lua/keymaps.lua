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
vim.g.dim_mode_active = false

map({ "n" }, "\\i", function()
	vim.diagnostic.config({
		virtual_lines = not vim.diagnostic.config().virtual_lines,
		virtual_text = not vim.diagnostic.config().virtual_text,
	})
end, "Toggle 'inline diagnostics'")
map({ "n" }, "\\z", C("ZenMode"), "Toggle 'zenmode'")
map({ "n" }, "\\d", function()
	if vim.g.dim_mode_active then
		vim.cmd("lua Snacks.dim.disable()")
		vim.g.dim_mode_active = false
	else
		vim.cmd("lua Snacks.dim.enable()")
		vim.g.dim_mode_active = true
	end
end, "Toggle 'dimming'")
map({ "n" }, "\\S", C("Copilot suggestion toggle_auto_trigger"), "Toggle 'auto-suggestions'")

map({ "n" }, "-", C("Oil"), "Files")
map({ "n" }, "|", C("lua Snacks.picker.explorer()"), "Tree")

map({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
map({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
map({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)")
-- Create remote versions of all a/i text objects by inserting `r`
-- into the middle (`iw` becomes `irw`, etc.).
-- A trick to avoid having to create separate hardcoded mappings for
-- each text object: when entering `ar`/`ir`, consume the next
-- character, and create the input from that character concatenated to
-- `a`/`i`.
do
	local remote_text_object = function(prefix)
		local ok, ch = pcall(vim.fn.getcharstr) -- pcall for handling <C-c>
		if not ok or ch == vim.keycode("<esc>") then
			return
		end
		require("leap.remote").action({ input = prefix .. ch })
	end
	map({ "x", "o" }, "ar", function()
		remote_text_object("a")
	end)
	map({ "x", "o" }, "ir", function()
		remote_text_object("i")
	end)
end
map({ "x", "o" }, "aa", function()
	-- Force linewise selection.
	local V = vim.fn.mode(true):match("V") and "" or "V"
	-- In any case, do some movement, to trigger operations in O-p mode.
	local input = vim.v.count > 1 and (vim.v.count - 1 .. "j") or "hl"
	-- With `count=false` you can skip feeding count to the command
	-- automatically (we need -1 here, see above).
	require("leap.remote").action({ input = V .. input, count = false })
end)
-- C-a clashes with my tmux prefix
map({ "n" }, "<c-v>", "<c-a>")

map({ "n" }, "<C-d>", "<C-d>zz", "Scroll down w/ cursor at center")
map({ "n" }, "<C-u>", "<C-u>zz", "Scroll up w/ cursor at center")
map({ "n" }, "n", "nzzzv")
map({ "n" }, "N", "Nzzzv")

-- Readline commands
map({ "i" }, "<A-f>", C("lua require('readline').forward_word()"), "Move one word forward")
map({ "i" }, "<A-b>", C("lua require('readline').backward_word()"), "Move one word backward")
map({ "i" }, "<C-f>", C("lua require('readline').kill_word()"), "Kill word forward")
map({ "i" }, "<C-b>", C("lua require('readline').backward_kill_word()"), "Kill word backward")

map({ "n" }, "<Esc>", C("nohl"), "Clear highlights")
map({ "t" }, "<Esc>", "<C-\\><C-n>", "Exit terminal mode", { nowait = true })

-- Navigating between neovim/tmux splits
map({ "n" }, "<S-Left>", C("lua require('smart-splits').move_cursor_left()"), "Left")
map({ "n" }, "<S-Down>", C("lua require('smart-splits').move_cursor_down()"), "Down")
map({ "n" }, "<S-Up>", C("lua require('smart-splits').move_cursor_up()"), "Up")
map({ "n" }, "<S-Right>", C("lua require('smart-splits').move_cursor_right()"), "Right")

map({ "t" }, "<S-Left>", "<C-\\><C-n><S-Up>", "Left", { nowait = true })
map({ "t" }, "<S-Down>", "<C-\\><C-n><S-Down>", "Down", { nowait = true })
map({ "t" }, "<S-Up>", "<C-\\><C-n><S-Up>", "Up", { nowait = true })
map({ "t" }, "<S-Right>", "<C-\\><C-n><S-Right>", "Right", { nowait = true })

map({ "n", "t" }, "<C-S-Left>", C("lua require('smart-splits').resize_left()"), "Resize left")
map({ "n", "t" }, "<C-S-Down>", C("lua require('smart-splits').resize_down()"), "Resize down")
map({ "n", "t" }, "<C-S-Up>", C("lua require('smart-splits').resize_up()"), "Resize up")
map({ "n", "t" }, "<C-S-Right>", C("lua require('smart-splits').resize_right()"), "Resize right")

-- Multiple cursors
map({ "n", "x" }, "<A-j>", C("MultipleCursorsAddDown"), "Add cursor, move down")
map({ "n", "x" }, "<A-k>", C("MultipleCursorsAddUp"), "Add cursor, move up")

-- Yanky
map({ "n", "x" }, "y", "<Plug>(YankyYank)")
map({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
map({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
map({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)", "Put after")
map({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)", "Put before")
map({ "n" }, "<C-p>", "<Plug>(YankyPreviousEntry)")
map({ "n" }, "<C-n>", "<Plug>(YankyNextEntry)")

-- wtf.nvim
map({ "n" }, "gw", C("Wtf"), "Explain diagnostic")

map({ "n" }, "[t", C("tabprevious"), "Previous tab", { noremap = true })
map({ "n" }, "]t", C("tabnext"), "Next tab", { noremap = true })

map({ "n" }, "H", C("lua require('nvchad.tabufline').prev()"), "Previous buffer")
map({ "n" }, "L", C("lua require('nvchad.tabufline').next()"), "Next buffer")
map({ "n" }, "<M-H>", C("tabprevious"), "Previous tab")
map({ "n" }, "<M-L>", C("tabnext"), "Next tab")
map({ "n" }, "<M-X>", C("tabclose"), "Close tab")
map({ "n" }, "<M-N>", C("tabnew"), "New tab")

-- map({ "n" }, "x", function()
-- 	require("substitute").operator()
-- end)
-- map({ "n" }, "xx", function()
-- 	require("substitute").line()
-- end)
-- map({ "n" }, "X", function()
-- 	require("substitute").eol()
-- end)
-- map({ "x" }, "x", function()
-- 	require("substitute").visual()
-- end)

-- Leader mappings ==========================================================

map({ "n" }, L("q"), C("q"), ":q")
map({ "n" }, L("'"), C("FzfLua marks"), "List Marks")
map({ "n" }, L(";"), C("FzfLua buffers"), "List Buffers")
map({ "n" }, L("c"), C("lua require('toolbox').show_picker()"), "Commands")

-- | [B]uffer
map({ "n" }, L("bl"), C("FzfLua buffers"), "Buffers")
map({ "n" }, L("bm"), C("FzfLua marks"), "Marks")
map({ "n" }, L("bx"), C("lua Snacks.bufdelete()"), "Exit (current)")
map({ "n" }, L("bX"), C("lua Snacks.bufdelete.other()"), "Exit (others)")
map({ "n" }, L("bg"), C("FzfLua lgrep_curbuf"), "Grep")
map({ "n" }, L("bf"), C("lua require('conform').format()"), "Format")
map({ "n" }, L("bz"), C("lua MiniMisc.zoom()"), "Zoom")

-- TODO: explicitly set avante mappings

map({ "n", "v" }, L("aa"), C("AvanteAsk"), "Ask")
map({ "n" }, L("ab"), C("AvanteBuild"), "Build")
map({ "n" }, L("ac"), C("AvanteChat"), "Chat")
map({ "n" }, L("at"), C("AvanteToggle"), "Toggle")
map({ "n" }, L("af"), C("AvanteFocus"), "Focus")
map({ "n" }, L("ar"), C("AvanteRefresh"), "Refresh")
map({ "n" }, L("am"), C("AvanteShowRepoMap"), "Map")

-- | [D]AP
map({ "n" }, L("dk"), function()
	require("dap").step_out()
end, "Step out")

map({ "n" }, L("dj"), function()
	require("dap").step_into()
end, "Step into")

map({ "n" }, L("dl"), function()
	require("dap").step_over()
end, "Step over")

map({ "n" }, L("db"), function()
	require("dap").toggle_breakpoint()
end, "Breakpoint")

map({ "n" }, L("dd"), function()
	require("dap").continue()
end, "Start/continue")

map({ "n" }, L("dq"), function()
	require("dap").terminate()
end, "Quit")

map({ "n" }, L("dr"), function()
	require("dap").repl.open()
end, "REPL")

map({ "n" }, L("du"), function()
	require("dapui").toggle()
end, "UI")

map({ "n" }, L("dh"), function()
	require("dap.ui.widgets").hover()
end, "Hover")

map({ "n" }, L("dp"), function()
	require("dap.ui.widgets").preview()
end, "Preview")

map({ "n" }, L("df"), function()
	require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames)
end, "Frames")

map({ "n" }, L("ds"), function()
	require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes)
end, "Scopes")

-- | [L]SP
map({ "n" }, L("lr"), C("FzfLua lsp_references"), "References")
map({ "n" }, L("ld"), C("FzfLua lsp_definitions "), "Definitions")
map({ "n" }, L("ls"), C("FzfLua lsp_document_symbols"), "Symbols (buff)")
map({ "n" }, L("lx"), C("FzfLua diagnostics_document"), "Diagnostics (buff)")

-- | [s]earch
map({ "n" }, L("sc"), C("ChezFzf"), "Config")
map({ "n" }, L("sg"), C("FzfLua live_grep"), "Grep (cwd)")
map({ "n" }, L("sf"), C("FzfLua files"), "Files (cwd)")
map({ "n" }, L("sh"), C("FzfLua helptags"), "Help")
map({ "n" }, L("s."), C("FzfLua resume"), "Resume")
map({ "n" }, L("so"), C("FzfLua oldfiles"), "Old")
map({ "n" }, L("sb"), C("FzfLua builtin"), "Pickers")
map({ "n" }, L("sy"), C("YankyRingHistory"), "Yanks")
map({ "n" }, L("sq"), C("FzfLua quickfix"), "Quickfix")
map({ "n" }, L("si"), function()
	Snacks.picker.files({
		finder = "files",
		format = "file",
		cmd = "fd",
		args = { "-I", "-e", "jpg", "-e", "png", "-e", "jpeg", "-e", "pdf" },
		layout = "vertical",
	})
end, "Images")

-- | [G]it
map({ "n" }, L("gh"), C("Gitsigns preview_hunk"), "View hunk")
map({ "n" }, L("gn"), C("Gitsigns next_hunk"), "Next hunk")
map({ "n" }, L("gp"), C("Gitsigns prev_hunk"), "Prev hunk")
map({ "n" }, L("g "), C("Neogit"), "Neogit")
map({ "n" }, L("gc"), C("FzfLua git_bcommits"), "Commits")
map({ "n" }, L("gl"), C("lua Snacks.git.blame_line()"), "Blame")
map({ "n" }, L("gd"), C("lua Snacks.picker.git_diff()"), "Diffs")

--| [T]est
map({ "n" }, L("nt"), function()
	require("neotest").run.run(vim.fn.expand("%"))
end, "Test file")
map({ "n" }, L("ns"), C("lua require('neotest').summary.toggle()"), "Summary")
map({ "n" }, L("no"), function()
	require("neotest").output.open({
		enter = false,
		auto_close = false,
		open_win = function()
			vim.cmd("split")
		end,
	})
end, "Output")

-- [,] convience mappings

map({ "n" }, L(",."), C("lua Snacks.dashboard()"), "Home")
map({ "n" }, L(",s"), C("FzfLua spell_suggest"), "Spell")
map({ "n" }, L(",n"), C("NoiceAll"), "Noice")
map({ "n" }, L(",d"), C("qa!"), "Dip")
map({ "n" }, L(",q"), C("lua require('quicker').toggle({focus=true, min_height=8})"), "Quickfix")
map({ "n" }, L(",l"), C("lua require('quicker').toggle({focus=true, min_height=8, loclist=true})"), "Loclist")
map({ "n" }, L(",u"), C("lua Snacks.picker.undo()"), "Undos")

-- | [W]indows
-- TODO: refactor functions as script and require
---Toggles the orientation of the current window split
---@return nil
local TransFlip = function()
	-- Exit early if no splits exist
	if vim.fn.winnr("$") == 1 then
		vim.notify("No splits to flip", vim.log.levels.WARN)
		return
	end

	local initial_win = vim.fn.winnr()
	local is_horizontal = vim.fn.winwidth(0) > vim.fn.winheight(0)

	-- Try primary orientation flip
	vim.cmd("wincmd " .. (is_horizontal and "K" or "H"))

	-- If unsuccessful, try opposite orientation
	if initial_win == vim.fn.winnr() then
		vim.cmd("wincmd " .. (is_horizontal and "H" or "K"))
	end

	-- Recenter both windows
	local commands = { "wincmd p", "normal! zz", "wincmd p", "normal! zz" }
	for _, cmd in ipairs(commands) do
		vim.cmd(cmd)
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
map({ "n" }, L("wr"), TransFlip, "TransFlip")
map({ "n" }, L("wx"), "<C-W>c", "Exit", { remap = true })
map({ "n" }, L("w-"), "<C-W>s", "HSplit", { remap = true })
map({ "n" }, L("w|"), "<C-W>v", "Vsplit", { remap = true })
map({ "n" }, L("ws"), ScrollBind, "Scrollbind: on")
map({ "n" }, L("wS"), ScrollUnbind, "Scrollbind: off")
map({ "n" }, L("wm"), C("ScrollItToggle"), "Multipage")
