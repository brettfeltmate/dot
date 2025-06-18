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
-- [[ Misc ]] --
map({ "t" }, "<Esc>", "<C-\\><C-n>", "Exit terminal mode", { nowait = true })
map({ "n" }, "<Esc>", C("nohl"), "Clear highlights")
map({ "n" }, "\\a", C("Copilot suggestion toggle_auto_trigger"), "Toggle 'auto-suggestions'")
map({ "n" }, "\\h", C("Hardtime toggle"), "Toggle Hardtime")
map({ "n" }, "\\m", C("lua require('base46').toggle_theme()"), "Toggle dark/light mode")
map({ "n" }, "gdq", C("Debugprint qflist"), "To qflist")
map({ "n" }, "]h", C("Gitsigns next_hunk"), "Next hunk")
map({ "n" }, "[h", C("Gitsigns prev_hunk"), "Prev hunk")

-- [[ Editing ]] --

-- Flash
map({ "n", "x", "o" }, "<C-s>", C("lua require('flash').jump()"), "Flash")
-- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
-- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },

--  Readline
map({ "!" }, "<C-n>", C("lua require('readline').forward_word()"), "Next word")
map({ "!" }, "<C-p>", C("lua require('readline').backward_word()"), "Prev word")
map({ "!" }, "<C-M-n>", C("lua require('readline').beginning_of_line()"), "Line start")
map({ "!" }, "<C-M-p>", C("lua require('readline').end_of_line()"), "Line end")

-- <Delete> & <BS> already kills next, prev char
map({ "!" }, "<C-f>", C("lua require('readline').kill_word()"), "Kill next word")
map({ "!" }, "<C-b>", C("lua require('readline').backward_kill_word()"), "Kill prev word")
map({ "!" }, "<C-S-f>", C("lua require('readline').kill_line()"), "Kill forward")
map({ "!" }, "<C-S-b>", C("lua require('readline').backward_kill_line()"), "Kill backward")

--  Substitute
map({ "n" }, "s", C("lua require('substitute').operator()"), "Sub [motion]", { noremap = true })
map({ "n" }, "ss", C("lua require('substitute').line()"), "Sub [line]", { noremap = true })
map({ "n" }, "S", C("lua require('substitute').eol()"), "Sub [eol]", { noremap = true })
map({ "x" }, "s", C("lua require('substitute').visual()"), "Sub [visual]", { noremap = true })

map({ "n" }, "sx", C("lua require('substitute.exchange').operator()"), "Exch [motion]", { noremap = true })
map({ "n" }, "sxx", C("lua require('substitute.exchange').line()"), "Exch [line]", { noremap = true })
map({ "x" }, "X", C("lua require('substitute.exchange').visual()"), "Exch [visual]", { noremap = true })
map({ "n" }, "sxc", C("lua require('substitute.exchange').cancel()"), "Exch [cancel]", { noremap = true })

-- Treewalker
map({ "n", "v" }, "<S-Left>", "<cmd>Treewalker Left<cr>", "Treewalk Left", { silent = true })
map({ "n", "v" }, "<S-Down>", "<cmd>Treewalker Down<cr>", "Treewalk Down", { silent = true })
map({ "n", "v" }, "<S-Up>", "<cmd>Treewalker Up<cr>", "Treewalk Up", { silent = true })
map({ "n", "v" }, "<S-Right>", "<cmd>Treewalker Right<cr>", "Treewalk Right", { silent = true })

-- [[ Splits/Buffs/Tabs ]] --

--  Split windows
map({ "n" }, "-", "<C-W>s", "Split u|d", { remap = true })
map({ "n" }, "|", "<C-W>v", "Split l|r", { remap = true })

--  Cycle splits
map({ "n" }, "<tab>", "<C-W>w", "Next win", { remap = true })

--  Focus splits
map({ "n" }, "<C-Left>", C("lua require('smart-splits').move_cursor_left()"), "Left")
map({ "n" }, "<C-Down>", C("lua require('smart-splits').move_cursor_down()"), "Down")
map({ "n" }, "<C-Up>", C("lua require('smart-splits').move_cursor_up()"), "Up")
map({ "n" }, "<C-Right>", C("lua require('smart-splits').move_cursor_right()"), "Right")
map({ "t" }, "<C-Left>", "<C-\\><C-n><C-Up>", "Left", { nowait = true })
map({ "t" }, "<C-Down>", "<C-\\><C-n><C-Down>", "Down", { nowait = true })
map({ "t" }, "<C-Up>", "<C-\\><C-n><C-Up>", "Up", { nowait = true })
map({ "t" }, "<C-Right>", "<C-\\><C-n><C-Right>", "Right", { nowait = true })

--  Resize splits
map({ "n", "t" }, "<C-S-Left>", C("lua require('smart-splits').resize_left()"), "Resize left")
map({ "n", "t" }, "<C-S-Down>", C("lua require('smart-splits').resize_down()"), "Resize down")
map({ "n", "t" }, "<C-S-Up>", C("lua require('smart-splits').resize_up()"), "Resize up")
map({ "n", "t" }, "<C-S-Right>", C("lua require('smart-splits').resize_right()"), "Resize right")

--  Cycle buffers
map({ "n" }, "<A-h>", C("lua require('nvchad.tabufline').prev()"), "Prev buff")
map({ "n" }, "<A-l>", C("lua require('nvchad.tabufline').next()"), "Next buff")

--  Cycle tabs
map({ "n" }, "<M-H>", C("tabprev"), "Prev tab")
map({ "n" }, "<M-L>", C("tabnext"), "Next tab")

--  Go to next/prev non-empty line that is not a comment
map({ "n", "x" }, "<A-j>", function()
	local line = vim.fn.line(".")
	local last_line = vim.fn.line("$")

	while line < last_line do
		line = line + 1
		local text = vim.fn.getline(line)
		-- Skip empty lines and comment lines
		if text:match("^%s*$") == nil and text:match("^%s*[-/#]") == nil then
			vim.fn.cursor(line, 1)
			break
		end
	end
end, "Next line")

map({ "n", "x" }, "<A-k>", function()
	local line = vim.fn.line(".")

	while line > 1 do
		line = line - 1
		local text = vim.fn.getline(line)
		-- Skip empty lines and comment lines
		if text:match("^%s*$") == nil and text:match("^%s*[-/#]") == nil then
			vim.fn.cursor(line, 1)
			break
		end
	end
end, "Prev line")

--  Leap to char
-- map({ "n", "x", "o" }, "s", "<Plug>(leap-forward)", "Leap forward")
-- map({ "n", "x", "o" }, "S", "<Plug>(leap-backward)", "Leap backward")
-- map({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)", "Leap from window")

-- [[ Leader mappings ]] --

--  Frequent
map({ "n" }, L("b"), C("FzfLua buffers"), "Buffers")
map({ "n" }, L("c"), C("FzfLua grep_cword"), "Cword")
map({ "n" }, L("d"), C("lua Snacks.bufdelete()"), "Delete")
map({ "n" }, L("f"), C("FzfLua files"), "Files")
map({ "n" }, L("g"), C("FzfLua grep_curbuf"), "Grep")
map({ "n" }, L("l"), C("FzfLua live_grep"), "Live Grep")
map({ "n" }, L("o"), C("Oil"), "Oil")
map({ "n" }, L("s"), C("FzfLua lsp_document_symbols"), "Symbols")
map({ "n" }, L("t"), C("Otree"), "Tree")
map({ "n" }, L("w"), C("w"), "Write")
map({ "n" }, L("q"), C("q"), "Quit")
map({ "n" }, L("z"), C("tabnew %"), "Zoom")

--  Handy
map({ "n" }, L(",b"), C("qa!"), "BAIL")
map({ "n" }, L(",d"), C("wqa"), "Dip")
map({ "n" }, L(",f"), C("lua require('conform').format()"), "Format")
map({ "n" }, L(",n"), C("Neogit"), "Neogit")
map({ "n" }, L(",m"), C("NoiceAll"), "Noice")
map({ "n" }, L(",q"), C("lua require('quicker').toggle({loclist=false})"), "Quickfix")
map({ "n" }, L(",r"), C("lua require 'nvchad.lsp.renamer'()"), "Rename")
map({ "n" }, L(",s"), C("lua require('snacks').scratch.open()"), "Scratch")
map({ "n" }, L(",w"), C("FzfLua spell_suggest"), "Word?")

--  Occasionals
map({ "n" }, L(".c"), C("ChezFzf"), "Config")
map({ "n" }, L(".e"), C("FzfLua diagnostics_document severity_only='Error'"), "Errors")
map({ "n" }, L(".f"), C("FzfLua builtin"), "FzfLua...")
map({ "n" }, L(".r"), C("lua require('base46').load_all_highlights()"), "Repaint")
map({ "n" }, L(".t"), C("TimeMachineToggle"), "TimeMachine")
map({ "n" }, L(".u"), C("lua Snacks.picker.undo()"), "Undos")
map({ "n" }, L(".n"), C("NoNeckPain"), "NoNeckPain")

map({ "n" }, L(".g"), function()
	local dir = vim.fn.input("Grep dir: ", "~/")
	vim.cmd("FzfLua live_grep cwd=" .. dir)
end, "Grep...")

map({ "n" }, L(".i"), function()
	require("fzf-lua").files({
		prompt = "Images: ",
		fd_opts = [[-I -e jpg -e png -e jpeg]],
	})
end, "Images")

map({ "n" }, L(".s"), function()
	local dir = vim.fn.input("Search dir: ", "~/")
	vim.cmd("FzfLua files cwd=" .. dir)
end, "Search...")

-- Gitsigns (+ DiffviewFileHistory)
map({ "n" }, L(".hs"), C("lua require('gitsigns').stage_hunk()"), "Stage")
map({ "v" }, L(".hs"), C("lua require('gitsigns').stage_hunk({vim.fn.line('.'), vim.fn.line('v')})"), "Stage")
map({ "n" }, L(".hr"), C("lua require('gitsigns').reset_hunk()"), "Reset")
map({ "v" }, L(".hr"), C("lua require('gitsigns').stage_hunk({vim.fn.line('.'), vim.fn.line('v')})"), "Reset")
map({ "n" }, L(".hp"), C("lua require('gitsigns').preview_hunk()"), "Preview")
map({ "n" }, L(".hi"), C("lua require('gitsigns').preview_hunk_inline()"), "Inline")
map({ "n" }, L(".hd"), C("lua require('gitsigns').diffthis()"), "Diff")
map({ "n" }, L(".hq"), C("lua require('gitsigns').setqflist()"), "Set qf")
map({ "n" }, L(".hh"), C("DiffviewFileHistory %"), "History")
