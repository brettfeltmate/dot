-- [[ Helper methods ]] --
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
--  Misc
map({ "n" }, "grn", C("lua require 'nvchad.lsp.renamer'()"), "rename")
map({ "t" }, "<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode", { nowait = true })
map({ "n" }, "<Esc>", C("nohl"), "Clear highlights")
map({ "n" }, "gdq", C("Debugprint qflist"), "To qflist")
map({ "n" }, "\\m", C("lua require('base46').toggle_theme()"), "Toggle 'dark/light'")

-- Diagnostics
map({ "n" }, "<C-w>e", C("lua vim.diagnostic.open_float()"), "Diagnostics float")
map({ "n" }, "<C-w>d", C("lua vim.diagnostic.setqflist()"), "Diagnostics to qflist")

map({ "n" }, "<C-w>q", C("copen"), "Open quickfix")

-- Prompts for number, diffs the current file against that ancestor using fugitive in a new tab
map({ "n" }, "<C-w>D", function()
	local ancestor = vim.fn.input("Ancestor level: ")
	if ancestor ~= "" then
		-- open current file in a new tab
		vim.cmd("tabnew %")
		-- run Gvdiffsplit against the ancestor
		vim.cmd("Gvdiffsplit @~" .. ancestor .. ":%")
	end
end, "Git diff against ancestor")

-- Switch tabs
map({ "n" }, "]t", C("tabnext"), "Next tab")
map({ "n" }, "[t", C("tabprevious"), "Prev tab")

--  Substitute/Exchange
map({ "n" }, "zs", C("lua require('substitute').operator()"), "Sub [motion]", { noremap = true })
map({ "n" }, "zx", C("lua require('substitute.exchange').operator()"), "Exch [motion]", { noremap = true })

--  Focus
map({ "n" }, "<C-Left>", C("lua require('smart-splits').move_cursor_left()"), "Left")
map({ "n" }, "<C-Down>", C("lua require('smart-splits').move_cursor_down()"), "Down")
map({ "n" }, "<C-Up>", C("lua require('smart-splits').move_cursor_up()"), "Up")
map({ "n" }, "<C-Right>", C("lua require('smart-splits').move_cursor_right()"), "Right")
map({ "t" }, "<C-Left>", "<C-\\><C-n><C-Left>", "Left", { nowait = true })
map({ "t" }, "<C-Down>", "<C-\\><C-n><C-Down>", "Down", { nowait = true })
map({ "t" }, "<C-Up>", "<C-\\><C-n><C-Up>", "Up", { nowait = true })
map({ "t" }, "<C-Right>", "<C-\\><C-n><C-Right>", "Right", { nowait = true })

--  Resize
map({ "n", "t" }, "<C-S-Left>", C("lua require('smart-splits').resize_left()"), "Resize left")
map({ "n", "t" }, "<C-S-Down>", C("lua require('smart-splits').resize_down()"), "Resize down")
map({ "n", "t" }, "<C-S-Up>", C("lua require('smart-splits').resize_up()"), "Resize up")
map({ "n", "t" }, "<C-S-Right>", C("lua require('smart-splits').resize_right()"), "Resize right")

-- Cycle
map({ "n" }, "<S-h>", C("lua require('nvchad.tabufline').prev()"), "Prev buff")
map({ "n" }, "<S-l>", C("lua require('nvchad.tabufline').next()"), "Next buff")

--  Go to beginning of next/prev block
map({ "n" }, "<C-j>", "}j", "Jump next block")
map({ "n" }, "<C-k>", "{{j", "Jump prev block")

-- Go to next/prev hunk
map({ "n" }, "<M-j>", C("VGit hunk_down"), "Next hunk")
map({ "n" }, "<M-k>", C("VGit hunk_up"), "Prev hunk")

-- Leader mappings
map({ "n" }, L("d"), C("lua require('nvchad.tabufline').close_buffer()"), "Delete")
map({ "n" }, L("f"), C("lua require('snacks').picker.files()"), "Find")
map({ "n" }, L("c"), C("lua require('rgflow').open_cword_path()"), "RipGrep")
map({ "n" }, L("r"), C("lua require('rgflow').open()"), "RipGrep")
map({ "v" }, L("r"), C("lua require('rgflow').open_visual()"), "RipGrep Selection")
map({ "n" }, L("o"), C("Oil"), "Open")
map({ "n" }, L("p"), C("lua require('snacks').picker.pickers()"), "Pick")
map({ "n" }, L("q"), C("q"), "Quit")
map({ "n" }, L("s"), C("lua require('snacks').scratch()"), "Scratch")
map({ "n" }, L("u"), C("lua Snacks.picker.undo()"), "Undo")
map({ "n" }, L("w"), C("w"), "Write")

-- -- VGit
map({ "n" }, L("ghs"), C("VGit buffer_hunk_stage"), "Stage")
map({ "n" }, L("ghu"), C("VGit buffer_hunk_unstage"), "Unstage")
map({ "n" }, L("ghp"), C("VGit buffer_hunk_preview"), "Preview")

map({ "n" }, L("gbs"), C("VGit buffer_stage"), "Stage")
map({ "n" }, L("gbu"), C("VGit buffer_unstage"), "Unstage")
map({ "n" }, L("gbd"), C("VGit buffer_diff_preview"), "Diff")
map({ "n" }, L("gbh"), C("VGit buffer_history_preview"), "History")

map({ "n" }, L("gab"), C("VGit buffer_conflict_accept_both"), "Both")
map({ "n" }, L("gac"), C("VGit buffer_conflict_accept_current"), "Current")
map({ "n" }, L("gai"), C("VGit buffer_conflict_accept_incoming"), "Incoming")

map({ "n" }, L("gd"), C("VGit project_diff_preview"), "Diff project")

-- Treesitter incremental selection
map({ "x" }, "K", function()
	vim.treesitter.select_node({ parent = true })
end, "Parent node")

map({ "x" }, "J", function()
	vim.treesitter.select_node({ child = true })
end, "Child node")

map({ "x" }, "H", function()
	vim.treesitter.select_node({ sibling = "prev" })
end, "Prev sibling node")

map({ "x" }, "L", function()
	vim.treesitter.select_node({ sibling = "next" })
end, "Next sibling node")

-- OpenCode AI Assistant
map({ "n" }, L("aa"), C("lua require('opencode.api').toggle()"), "Toggle")
map({ "n" }, L("ai"), C("lua require('opencode.api').open_input()"), "Input")
map({ "n" }, L("an"), C("lua require('opencode.api').open_input_new_session()"), "New session")
map({ "n" }, L("ao"), C("lua require('opencode.api').open_output()"), "Output")
map({ "n" }, L("at"), C("lua require('opencode.api').timeline()"), "Timeline")
map({ "n" }, L("as"), C("lua require('opencode.api').select_session()"), "Select session")
map({ "n" }, L("ar"), C("lua require('opencode.api').rename_session()"), "Rename session")
map({ "n" }, L("az"), C("lua require('opencode.api').toggle_zoom()"), "Zoom")
map({ "n" }, L("ad"), C("lua require('opencode.api').diff_open()"), "Diff view")
map({ "n" }, L("af"), C("lua require('opencode.api').toggle_focus()"), "Focus toggle")
map({ "n", "x" }, L("ac"), C("lua require('opencode.api').quick_chat()"), "Quick chat")

-- OpenCode shortcuts (non-leader)
map({ "n" }, "<C-;>", C("lua require('opencode.api').toggle()"), "Toggle OpenCode")
map({ "n" }, "<C-,>", C("lua require('opencode.api').toggle_focus()"), "Toggle focus")
map({ "n", "x" }, "<C-.>", C("lua require('opencode.api').quick_chat()"), "Quick chat")
