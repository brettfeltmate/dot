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

-- Because navigate-note won't let me rebind preview scroll, and the default conflicts with my tmux prefix
map({ "n" }, "<c-v>", "<c-a>")

-- Readline commands
map({ "i" }, "<A-f>", C("lua require('readline').forward_word()"), "Move one word forward")
map({ "i" }, "<A-b>", C("lua require('readline').backward_word()"), "Move one word backward")
map({ "i" }, "<A-S-f>", C("lua require('readline').kill_word()"), "Kill word forward")
map({ "i" }, "<A-S-b>", C("lua require('readline').backward_kill_word()"), "Kill word backward")

map({ "n" }, "<Esc>", C("nohl"), "Clear highlights")
map({ "t" }, "<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")

-- Navigating between neovim/tmux splits
map({ "n" }, "<S-Left>", C("lua require('smart-splits').move_cursor_left()"), "Left")
map({ "n" }, "<S-Down>", C("lua require('smart-splits').move_cursor_down()"), "Down")
map({ "n" }, "<S-Up>", C("lua require('smart-splits').move_cursor_up()"), "Up")
map({ "n" }, "<S-Right>", C("lua require('smart-splits').move_cursor_right()"), "Right")

map({ "t" }, "<S-Left>", "<C-\\><C-n><C-Up>", "Left")
map({ "t" }, "<S-Down>", "<C-\\><C-n><C-Down>", "Down")
map({ "t" }, "<S-Up>", "<C-\\><C-n><C-Up>", "Up")
map({ "t" }, "<S-Right>", "<C-\\><C-n><C-Right>", "Right")

map({ "n", "t" }, "<C-S-Left>", C("lua require('smart-splits').resize_left()"), "Resize left")
map({ "n", "t" }, "<C-S-Down>", C("lua require('smart-splits').resize_down()"), "Resize down")
map({ "n", "t" }, "<C-S-Up>", C("lua require('smart-splits').resize_up()"), "Resize up")
map({ "n", "t" }, "<C-S-Right>", C("lua require('smart-splits').resize_right()"), "Resize right")

-- Multiple cursors
map({ "n", "x" }, "<A-j>", C("MultipleCursorsAddDown"), "Add cursor, move down")
map({ "n", "x" }, "<A-k>", C("MultipleCursorsAddUp"), "Add cursor, move up")

map({ "n" }, "]n", "/^\\s*\\S/e<cr>:nohl<cr>")
map({ "n" }, "[n", "?^\\s*\\S?e<cr>:nohl<cr>")

-- Flash.nvim
map({ "n", "x", "o" }, "<tab>", C("lua require('flash').jump()"))

-- Yanky
map({ "n", "x" }, "y", "<Plug>(YankyYank)")
map({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
map({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
map({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
map({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
map({ "n" }, "<C-p>", "<Plug>(YankyPreviousEntry)")
map({ "n" }, "<C-n>", "<Plug>(YankyNextEntry)")

-- wtf.nvim
map({ "n" }, "gw", C("Wtf"), "wtf do you mean")

map({ "n" }, "[t", C("tabprevious"), "Previous tab")
map({ "n" }, "]t", C("tabnext"), "Next tab")

map({ "n" }, "H", C("lua require('nvchad.tabufline').prev()"), "Previous buffer")
map({ "n" }, "L", C("lua require('nvchad.tabufline').next()"), "Next buffer")

-- Leader mappings ==========================================================

-- | [B]uffer
map({ "n" }, L("b "), C("FzfLua buffers"), "Buffers")
map({ "n" }, L("bx"), C("lua require('nvchad.tabufline').close_buffer()"), "Close current")
map({ "n" }, L("bX"), C("lua require('nvchad.tabufline').closeAllBufs(false)"), "Close others")
map({ "n" }, L("bg"), C("FzfLua grep_curbuf"), "Grep")
map({ "n" }, L("bt"), C("lua require('mini.trailspace').trim()"), "Trim whitespace")
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

-- | [L]SP
map({ "n" }, L("la"), C("FzfLua lsp_code_actions"), "Actions")
map({ "n" }, L("li"), C("Trouble lsp_implementations"), "Implementations")
map({ "n" }, L("lr"), C("Trouble lsp_references"), "References")
map({ "n" }, L("ld"), C("Trouble lsp_definitions "), "Definitions")
map({ "n" }, L("ls"), C("Trouble lsp_document_symbols win.position=left win.size=40"), "Symbols")
map({ "n" }, L("ln"), C("lua require('nvchad.lsp.renamer')()"), "Rename")
map({ "n" }, L("lx"), C("Trouble diagnostics toggle filter.buf=0"), "Diagnostics (buff)")
map({ "n" }, L("lX"), C("Trouble diagnostics toggle"), "Diagnostics (proj)")

-- | [s]earch
map({ "n" }, L("sc"), C("ChezFzf"), "Config")
map({ "n" }, L("ss"), C("FzfLua lsp_document_symbols"), "Symbols")
map({ "n" }, L("sg"), C("FzfLua live_grep"), "Grep (cwd)")
map({ "n" }, L("sf"), C("FzfLua files"), "Files (cwd)")
map({ "n" }, L("sh"), C("FzfLua helptags"), "Help")
map({ "n" }, L("s."), C("FzfLua resume"), "Resume")
map({ "n" }, L("so"), C("FzfLua oldfiles"), "Old")
map({ "n" }, L("sw"), C("FzfLua grep_cword"), "cword")
map({ "n" }, L("sW"), C("FzfLua grep_cWORD"), "cWORD")
map({ "n" }, L("sb"), C("FzfLua builtin"), "Pickers")

map({ "n" }, L("gC"), C("FzfLua git_commits"), "Commits (proj)")
map({ "n" }, L("gc"), C("FzfLua git_bcommits"), "Commits (buffer)")
map({ "n" }, L("gg"), C("lua Snacks.lazygit.open()"), "LazyGit")
map({ "n" }, L("gl"), C("lua Snacks.lazygit.log_file()"), "LazyGit log (file)")
map({ "n" }, L("gL"), C("lua Snacks.lazygit.log()"), "LazyGit log")
map({ "n" }, L("gh"), C("Gitsigns preview_hunk"), "Preview hunk")
map({ "n" }, L("gb"), C("Gitsigns toggle_current_line_blame"), "Blame lines")
map({ "n" }, L("gn"), C("Gitsigns next_hunk"), "Next hunk")
map({ "n" }, L("gp"), C("Gitsigns prev_hunk"), "Prev hunk")

--| [N]o-neck-pain
map({ "n" }, L("n "), C("NoNeckPain"), "Toggle")
map({ "n" }, L("ni"), C("NoNeckPainWidthUp"), "Increase width")
map({ "n" }, L("nd"), C("NoNeckPainWidthDown"), "Decrease width")
map({ "n" }, L("nr"), C("NoNeckPainToggleRightSide"), "Toggle right")
map({ "n" }, L("nl"), C("NoNeckPainToggleLeftSide"), "Toggle left")

--| [T]est
map({ "n" }, L("tt"), function()
	require("neotest").run.run(vim.fn.expand("%"))
end, "Test file")
map({ "n" }, L("tT"), function()
	require("neotest").run.run(vim.uv.cwd())
end, "All files")
map({ "n" }, L("tr"), function()
	require("neotest").run.run()
end, "Nearest")
map({ "n" }, L("tl"), function()
	require("neotest").run.run_last()
end, "Last")
map({ "n" }, L("ts"), function()
	require("neotest").summary.toggle()
end, "Summary")
map({ "n" }, L("tS"), function()
	require("neotest").run.stop()
end, "Stop")
map({ "n" }, L("tw"), function()
	require("neotest").watch.toggle(vim.fn.expand("%"))
end, "Watch")
map({ "n" }, L("to"), function()
	require("neotest").output.open({
		enter = true,
		auto_close = true,
		open_win = function()
			vim.cmd("vsplit")
		end,
	})
end, "Output (split)")
map({ "n" }, L("tO"), function()
	require("neotest").output.open({
		enter = true,
		auto_close = true,
		open_win = function()
			vim.cmd("tabnew")
		end,
	})
end, "Output (tab)")

-- [,] convience mappings
map({ "n" }, "_", C("Oil"), "Files")
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
map({ "n" }, L(",m"), C("lua require('mini.files').open()"), "MiniFiles")
map({ "n" }, L(",r"), C("lua require('persistence').load()"), "Restore")
map({ "n" }, L(",u"), C("UndotreeToggle"), "UndoTree")
map({ "n" }, L(",x"), C("NoiceAll"), "Noice")
map({ "n" }, L(",y"), C("YankyRingHistory"), "Yanks")
map({ "n" }, L(",d"), C("wqa!"), "Dip")
map({ "n" }, L(",b"), C("lua require('toolbox').show_picker()"), "Toolbox")
map({ "n" }, L(",t"), C("lua Snacks.terminal.toggle()"), "Terminal")
map({ "n" }, L(",i"), function()
	local curr_buf = vim.api.nvim_get_current_buf()
	local is_disabled = vim.diagnostic.is_disabled(curr_buf)
	vim.diagnostic.enable(is_disabled, { bfnr = curr_buf })
end, "Inline diagnostics")
map({ "n" }, L(",q"), C("lua require('quicker').toggle({focus=true})"), "Quickfix")
map({ "n" }, L(",l"), C("lua require('quicker').toggle({focus=true, loclist=true})"), "Loclist")

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
	local win_ids = vim.api.nvim_list_wins()
	local current_win = vim.api.nvim_get_current_win()

	for _, win_id in ipairs(win_ids) do
		if vim.api.nvim_win_is_valid(win_id) then
			table.insert(visible_buffers, vim.api.nvim_win_get_buf(win_id))
		end
	end

	table.insert(visible_buffers, 1, table.remove(visible_buffers))

	for i, win_id in ipairs(win_ids) do
		if vim.api.nvim_win_is_valid(win_id) then
			vim.api.nvim_win_set_buf(win_id, visible_buffers[i])
		end
	end

	vim.api.nvim_set_current_win(current_win)
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
