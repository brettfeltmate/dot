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

-- Flash.nvim
map({ "n", "x", "o" }, "<tab>", C("lua require('flash').jump()"))

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

map({ "n" }, "[t", C("tabprevious"), "Previous tab", { noremap = true})
map({ "n" }, "]t", C("tabnext"), "Next tab", { noremap = true})

map({ "n" }, "H", C("lua require('nvchad.tabufline').prev()"), "Previous buffer")
map({ "n" }, "L", C("lua require('nvchad.tabufline').next()"), "Next buffer")
map({ "n" }, "<M-H>", C("tabprevious"), "Previous tab")
map({ "n" }, "<M-L>", C("tabnext"), "Next tab")
map({ "n" }, "<M-X>", C("tabclose"), "Close tab")
map({ "n" }, "<M-N>", C("tabnew"), "New tab")

map({ "n" }, "s", function()
	require("substitute").operator()
end)
map({ "n" }, "ss", function()
	require("substitute").line()
end)
map({ "n" }, "S", function()
	require("substitute").eol()
end)
map({ "x" }, "s", function()
	require("substitute").visual()
end)

-- Leader mappings ==========================================================

map({ "n" }, L("'"), C("FzfLua marks"), "List Marks")
map({ "n" }, L(";"), C("FzfLua buffers"), "List Buffers")

-- | [B]uffer
map({ "n" }, L("bl"), C("FzfLua buffers"), "Buffers")
map({ "n" }, L("bm"), C("FzfLua marks"), "Marks")
map({ "n" }, L("bx"), C("lua Snacks.bufdelete()"), "Close current")
map({ "n" }, L("bX"), C("lua Snacks.bufdelete.other()"), "Close others")
map({ "n" }, L("bg"), C("FzfLua lgrep_curbuf"), "Grep")
map({ "n" }, L("bf"), C("lua require('conform').format()"), "Format")

-- | [C]opilot
-- Open chat promp in cmdline
map({ "n", "v" }, L("cc"), function()
	local input = vim.fn.input("Quick Chat: ")
	if input ~= "" then
		require("CopilotChat").ask(input, { selection = require("CopilotChat.select").visual })
	end
end, "Quick chat")

map({ "n" }, L("c "), C("CopilotChatToggle"), "Chat")
map({ "n" }, L("cq"), C("CopilotChatStop"), "Stop")
map({ "n" }, L("cR"), C("CopilotChatReset"), "Reset")
map({ "n", "x" }, L("ce"), C("CopilotChatExplain"), "Explain")
map({ "n", "x" }, L("cf"), C("CopilotChatFix"), "Fix")
map({ "n", "x" }, L("cd"), C("CopilotChatDocs"), "Document")
map({ "n", "x" }, L("ct"), C("CopilotChatTests"), "Tests")
map({ "n", "x" }, L("co"), C("CopilotChatOptimize"), "Optimize")

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
map({ "n" }, L("li"), C("FzfLua lsp_implementations"), "Implementations")
map({ "n" }, L("lr"), C("FzfLua lsp_references"), "References")
map({ "n" }, L("ld"), C("FzfLua lsp_definitions "), "Definitions")
map({ "n" }, L("ls"), C("FzfLua lsp_document_symbols"), "Symbols (buff)")
map({ "n" }, L("lS"), C("FzfLua lsp_workspace_symbols"), "Symbols (space)")
map({ "n" }, L("ll"), C("FzfLua lsp_live_workspace_symbols"), "Symbols (live)")
map({ "n" }, L("lx"), C("FzfLua diagnostics_document"), "Diagnostics (buff)")
map({ "n" }, L("lX"), C("FzfLua diagnostics_workspace"), "Diagnostics (space)")

-- | [s]earch
map({ "n" }, L("sc"), C("ChezFzf"), "Config")
map({ "n" }, L("sg"), C("FzfLua live_grep"), "Grep (cwd)")
map({ "n" }, L("sf"), C("FzfLua files"), "Files (cwd)")
map({ "n" }, L("sh"), C("FzfLua helptags"), "Help")
map({ "n" }, L("sH"), function()
	require("fzf-lua").live_grep({
		cwd = vim.fs.joinpath(vim.env.VIMRUNTIME, "doc"),
	})
end, "Grep help")
map({ "n" }, L("s."), C("FzfLua resume"), "Resume")
map({ "n" }, L("so"), C("FzfLua oldfiles"), "Old")
map({ "n" }, L("sw"), C("FzfLua grep_cword"), "cword")
map({ "n" }, L("sW"), C("FzfLua grep_cWORD"), "cWORD")
map({ "n" }, L("sb"), C("FzfLua builtin"), "Pickers")
map({ "n" }, L("sq"), C("FzfLua quickfix"), "Quickfix")
map({ "n" }, L("sl"), C("FzfLua loclist"), "Loclist")

-- | [G]it
map({ "n" }, L("gh"), C("Gitsigns preview_hunk"), "View hunk")
map({ "n" }, L("gn"), C("Gitsigns next_hunk"), "Next hunk")
map({ "n" }, L("gp"), C("Gitsigns prev_hunk"), "Prev hunk")
map({ "n" }, L("g "), C("Neogit"), "Neogit")
map({ "n" }, L("gc"), C("FzfLua git_bcommits"), "Commits")
map({ "n" }, L("gl"), C("Neogit log"), "Log")
map({ "n" }, L("gd"), C("Neogit diff"), "Log")

--| [T]est
map({ "n" }, L("nt"), function()
	require("neotest").run.run(vim.fn.expand("%"))
end, "Test file")
map({ "n" }, L("nT"), function()
	require("neotest").run.run(vim.uv.cwd())
end, "All files")
map({ "n" }, L("nr"), function()
	require("neotest").run.run()
end, "Nearest")
map({ "n" }, L("nl"), function()
	require("neotest").run.run_last()
end, "Last")
map({ "n" }, L("ns"), function()
	require("neotest").summary.toggle()
end, "Summary")
map({ "n" }, L("nS"), function()
	require("neotest").run.stop()
end, "Stop")
map({ "n" }, L("nw"), function()
	require("neotest").watch.toggle(vim.fn.expand("%"))
end, "Watch")
map({ "n" }, L("no"), function()
	require("neotest").output.open({
		enter = true,
		auto_close = true,
		open_win = function()
			vim.cmd("vsplit")
		end,
	})
end, "Output (split)")
map({ "n" }, L("nO"), function()
	require("neotest").output.open({
		enter = true,
		auto_close = true,
		open_win = function()
			vim.cmd("tabnew")
		end,
	})
end, "Output (tab)")

-- [,] convience mappings
map({ "n" }, "-", C("Oil"), "Files")
map({ "n" }, L(",s"), function()
	require("fzf-lua").spell_suggest({
		winopts = {
			fullscreen = false,
			relative = "cursor",
			row = 1,
			col = 0,
			height = 0.2,
			width = 0.3,
		},
	})
end, "Spell")
map({ "n" }, L(",r"), C("lua require('persistence').load()"), "Restore")
map({ "n" }, L(",c"), C("Copilot suggestion toggle_auto_trigger"), "Suggestions")
map({ "n" }, L(",u"), C("UndotreeToggle"), "UndoTree")
map({ "n" }, L(",n"), C("NoiceAll"), "Noice")
map({ "n" }, L(",y"), C("YankyRingHistory"), "Yanks")
map({ "n" }, L(",d"), C("qa!"), "Dip")
map({ "n" }, L(",b"), C("lua require('toolbox').show_picker()"), "Toolbox")
map({ "n" }, L(",t"), C("lua Snacks.terminal.toggle(nil, { win = { size = 0.25 } })"), "Terminal")
-- map({ "n" }, L(",i"), function()
-- 	local curr_buf = vim.api.nvim_get_current_buf()
-- 	local is_enabled = vim.diagnostic.is_enabled()
-- 	vim.diagnostic.enable(not is_enabled, { bfnr = curr_buf })
-- end, "Inline diagnostics")
map({ "n" }, L(",q"), C("lua require('quicker').toggle({focus=true, min_height=8})"), "Quickfix")
map({ "n" }, L(",l"), C("lua require('quicker').toggle({focus=true, min_height=8, loclist=true})"), "Loclist")
map({ "n" }, L(",z"), C("ZenMode"), "Zen-mode")
map({ "n" }, L(",i"), function()
	vim.diagnostic.config({
		virtual_lines = not vim.diagnostic.config().virtual_lines,
		virtual_text = not vim.diagnostic.config().virtual_text,
	})
end, "Inline diagnostics")
map({ "n", "v" }, L(",g"), C("GrugFar"), "GrugFar")

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
map({ "n" }, L("w-"), "<C-W>s", "split up/down", { remap = true })
map({ "n" }, L("w|"), "<C-W>v", "split left/right", { remap = true })
map({ "n" }, L("ws"), ScrollBind, "scrollbind on")
map({ "n" }, L("wS"), ScrollUnbind, "scrollbind off")
map({ "n", "v" }, L("wc"), C("lua require('go-up').centerScreen()"), "Center")
map({ "n", "v" }, L("wa"), C("lua require('go-up').align()"), "Align")

-- | [T]reewalker
map({ "n", "v" }, L("th"), C("Treewalker Left"), "Move left")
map({ "n", "v" }, L("tj"), C("Treewalker Down"), "Move down")
map({ "n", "v" }, L("tk"), C("Treewalker Up"), "Move up")
map({ "n", "v" }, L("tl"), C("Treewalker Right"), "Move right")

map({ "n" }, L("tH"), C("Treewalker SwapLeft"), "Swap left")
map({ "n" }, L("tJ"), C("Treewalker SwapDown"), "Swap down")
map({ "n" }, L("tK"), C("Treewalker SwapUp"), "Swap up")
map({ "n" }, L("tL"), C("Treewalker SwapRight"), "Swap right")
