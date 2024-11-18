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
map(
    { "n" },
    "]c",
    C("lua require('treesitter-context').go_to_context(vim.v.count1, true)"),
    "Next context",
    { silent = true }
)

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

map({ "n" }, "]n", "/^\\s*\\S/e<cr>")
map({ "n" }, "[n", "?^\\s*\\S?e<cr>")

-- Flash.nvim
map({ "n", "x", "o" }, "s", C("lua require('flash').jump()"))

-- nvim-spider
map({ "n" }, "w", C("lua require('spider').motion('w')"), "Spider-w")
map({ "n" }, "e", C("lua require('spider').motion('e')"), "Spider-e")
map({ "n" }, "b", C("lua require('spider').motion('b')"), "Spider-b")

-- squirrel.nvim
map({ "n", "x" }, "ga", C("lua require('squirrel.hop').hop_linewise()"), "Squirrel hop linewise")
map({ "n", "x" }, "ge", C("lua require('squirrel.hop').hop_linewise({head = false, tail = true})"))
map({ "n", "x" }, "gE", C("lua require('squirrel.hop').hop({head = false, tail = true})"))

-- Yanky
map({ "n", "x" }, "y", "<Plug>(YankyYank)")
map({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
map({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
map({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
map({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
map({ "n" }, "<C-p>", "<Plug>(YankyPreviousEntry)")
map({ "n" }, "<C-n>", "<Plug>(YankyNextEntry)")

-- wtf.nvim
map({ "n" }, "gw", C("Wtf"), "wtf is this")

map({ "n" }, "[t", C("tabprevious"), "Previous tab")
map({ "n" }, "]t", C("tabnext"), "Next tab")

map({ "n" }, "H", C("lua require('nvchad.tabufline').prev()"), "Previous buffer")
map({ "n" }, "L", C("lua require('nvchad.tabufline').next()"), "Next buffer")

local function open_fzf_buffers()
	require("fzf-lua").buffers({
		fzf_opts = { ["--layout"] = "reverse" },
		winopts = {
			fullscreen = false,
			relative = "editor",
			row = 0,
			col = 0,
			height = 0.7,
			width = 1,
			preview = {
				title_pos = "center",
				horizontal = "right:60%",
				vertical = "up:60%",
				layout = "vertical",
			},
		},
	})
end

map({ "n" }, "<leader><leader>", open_fzf_buffers, "Buffers")

-- Leader mappings ==========================================================

-- | [B]uffer
map({ "n" }, L("bx"), C("lua Snacks.bufdelete.delete()"), "Close current")
map({ "n" }, L("bX"), C("lua Snacks.bufdelete.other()"), "Close others")
map({ "n" }, L("bg"), C("FzfLua grep_curbuf"), "Grep")
map({ "n" }, L("bz"), C("lua require('mini.misc').zoom()"), "Zoom")
map({ "n" }, L("bt"), C("lua require('mini.trailspace').trim()"), "Trim whitespace")
map({ "n" }, L("bf"), C("lua require('conform').format()"), "Format")

-- | [C]opilot
-- Show help actions with fzf-lua
map({ "n" }, L("ch"), function()
	local actions = require("CopilotChat.actions")
	require("CopilotChat.integrations.fzflua").pick(actions.help_actions())
end, "Help actions")
-- Show prompts actions with fzf-lua
map({ "n", "v" }, L("ca"), function()
	local actions = require("CopilotChat.actions")
	require("CopilotChat.integrations.fzflua").pick(actions.prompt_actions())
end, "Prompt actions")
-- Open chat promp in cmdline
map({ "n", "v" }, L("cc"), function()
	local input = vim.fn.input("Quick Chat: ")
	if input ~= "" then
		require("CopilotChat").ask(input, { selection = require("CopilotChat.select").visual })
	end
end, "Quick chat")

map({ "n" }, L("ct"), C("CopilotChatToggle"), "Toggle")
map({ "n" }, L("cq"), C("CopilotChatStop"), "Stop")
map({ "n" }, L("cR"), C("CopilotChatReset"), "Reset")
map({ "n", "x" }, L("ce"), C("CopilotChatExplain"), "Explain")
map({ "n", "x" }, L("cf"), C("CopilotChatFix"), "Fix")
map({ "n", "x" }, L("cr"), C("CopilotChatReview"), "Review")
map({ "n", "x" }, L("cd"), C("CopilotChatDocs"), "Document")
map({ "n", "x" }, L("cT"), C("CopilotChatTests"), "Tests")
map({ "n", "x" }, L("co"), C("CopilotChatOptimize"), "Optimize")
-- | [L]SP
map(
	{ "n" },
	L("la"),
	C(
		"lua require('fzf-lua').lsp_code_actions({ winopts = {fullscreen=false, relative='editor', row=0.5, col=0, height=0.5, width=1} })"
	),
	"Actions"
)
-- map({ "n" }, L("la"), C("lua require('tiny-code-action').code_action()"), "Actions")
map({ "n" }, L("lI"), C("lua require('tiny-inline-diagnostic').toggle()"), "Inline diagnostics")
map({ "n" }, L("li"), C("Trouble lsp_implementations"), "Implementations")
map({ "n" }, L("lr"), C("Trouble lsp_references"), "References")
map({ "n" }, L("ld"), C("Trouble lsp_definitions "), "Definitions")
map({ "n" }, L("lo"), C("Trouble symbols"), "Outline")
map({ "n" }, L("ls"), C("Trouble lsp_document_symbols auto_close=true"), "Symbols")
map({ "n" }, L("ln"), C("lua require('nvchad.lsp.renamer')()"), "Rename")
map({ "n" }, L("lx"), C("Trouble diagnostics toggle"), "Diagnostics (proj)")
map({ "n" }, L("lX"), C("Trouble diagnostics toggle filter.buf=0"), "Diagnostics (buff)")
map({ "n" }, L("ll"), C("Trouble loclist toggle"), "Loc list")
map({ "n" }, L("lq"), C("Trouble qlist toggle"), "Quickfix list")

-- | [s]earch
map({ "n" }, L("sc"), C("ChezFzf"), "Config")
map({ "n" }, L("ss"), C("FzfLua lsp_document_symbols"), "Symbols")
map({ "n" }, L("sg"), C("FzfLua live_grep"), "Grep (cwd)")
map({ "n" }, L("sG"), C("FzfLua live_grep cwd=~/projects"), "Grep (projs)")
map({ "n" }, L("sf"), C("FzfLua files"), "Files (cwd)")
map({ "n" }, L("sF"), C("FzfLua files cwd=~/projects"), "Files (projs)")
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

-- [,] convience mappings
map({ "n" }, L(",f"), C("lua require('oil').open()"), "Oil")
map({ "n" }, L(",n"), C("NvimTreeToggle"), "NvimTree")
map(
	{ "n" },
	L(",s"),
	C(

		"lua require('fzf-lua').spell_suggest({winopts={fullscreen = false, relative='cursor', row=0.1, col=0, height=0.2, width=0.2}})"
	),
	"Spell"
)
map({ "n" }, L(",h"), C("lua require('hardtime').toggle()"), "Hardtime")
map({ "n" }, L(",r"), C("lua require('persistence').load()"), "Restore")
map({ "n" }, L(",u"), C("UndotreeToggle"), "UndoTree")
map({ "n" }, L(",x"), C("NoiceAll"), "Noice")
map({ "n" }, L(",y"), C("YankyRingHistory"), "Yanks")
map({ "n" }, L(",q"), C("qa!"), "BAIL")
map({ "n" }, L(",d"), C("wqa!"), "Dip")
map({ "n" }, L(",t"), C("lua require('toolbox').show_picker()"), "Toolbox")
map({ "n" }, L(",g"), C("lua require('gitpad').toggle_gitpad()"), "Gitpad")
map({ "n" }, L(",c"), C("NoNeckPain"), "Centre")

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
