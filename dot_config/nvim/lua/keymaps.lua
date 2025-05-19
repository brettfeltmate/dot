-- |> Helper methods {{{
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
-- }}}

map({ "n" }, "<tab>", "<C-W>w", "Next win", { remap = true })
map({ "t" }, "<Esc>", "<C-\\><C-n>", "Exit terminal mode", { nowait = true })

map({ "n" }, "<Esc>", C("nohl"), "Clear highlights")

map({ "n" }, "<C-s>", C("w"), "Save")

-- |> Substitute
map({ "n" }, "x", C("lua require('substitute').operator()"), "exch oper", { noremap = true })
map({ "n" }, "xx", C("lua require('substitute').line()"), "exch line", { noremap = true })
map({ "n" }, "X", C("lua require('substitute').eol()"), "exch eol", { noremap = true })
map({ "x" }, "x", C("lua require('substitute').visual()"), "exch vis", { noremap = true })

-- |> Toggles
map({ "n" }, "\\a", C("Copilot suggestion toggle_auto_trigger"), "Toggle 'auto-suggestions'")

-- |> Leap
map({ "n", "x", "o" }, ")", "<Plug>(leap-forward)", "Leap forward")
map({ "n", "x", "o" }, "(", "<Plug>(leap-backward)", "Leap backward")
map({ "n", "x", "o" }, "g)", "<Plug>(leap-from-window)", "Leap from window")

-- |> Splits
map({ "n" }, "-", "<C-W>s", "Split u|d", { remap = true })
map({ "n" }, "|", "<C-W>v", "Split l|r", { remap = true })

map({ "n" }, "<S-Left>", C("lua require('smart-splits').move_cursor_left()"), "Left")
map({ "n" }, "<S-Down>", C("lua require('smart-splits').move_cursor_down()"), "Down")
map({ "n" }, "<S-Up>", C("lua require('smart-splits').move_cursor_up()"), "Up")
map({ "n" }, "<S-Right>", C("lua require('smart-splits').move_cursor_right()"), "Right")

map({ "n", "t" }, "<C-S-Left>", C("lua require('smart-splits').resize_left()"), "Resize left")
map({ "n", "t" }, "<C-S-Down>", C("lua require('smart-splits').resize_down()"), "Resize down")
map({ "n", "t" }, "<C-S-Up>", C("lua require('smart-splits').resize_up()"), "Resize up")
map({ "n", "t" }, "<C-S-Right>", C("lua require('smart-splits').resize_right()"), "Resize right")

map({ "t" }, "<S-Left>", "<C-\\><C-n><S-Up>", "Left", { nowait = true })
map({ "t" }, "<S-Down>", "<C-\\><C-n><S-Down>", "Down", { nowait = true })
map({ "t" }, "<S-Up>", "<C-\\><C-n><S-Up>", "Up", { nowait = true })
map({ "t" }, "<S-Right>", "<C-\\><C-n><S-Right>", "Right", { nowait = true })

-- |> Navigate
map({ "n" }, "H", C("lua require('nvchad.tabufline').prev()"), "Prev buff")
map({ "n" }, "L", C("lua require('nvchad.tabufline').next()"), "Next buff")
map({ "n" }, "<A-h>", C("tabprev"), "Prev tab")
map({ "n" }, "<A-l>", C("tabnext"), "Next tab")

-- |> Brackets
map({ "n" }, "[b", C("lua require('nvchad.tabbufline').prev()"), "Prev buff")
map({ "n" }, "]b", C("lua require('nvchad.tabbufline').next()"), "Next buff")
map({ "n" }, "[t", C("tabprevious"), "Prev tab")
map({ "n" }, "]t", C("tabnext"), "Next tab")
map({ "n" }, "[c", C("lua MiniBracketed.conflict('backward')"), "Prev conf")
map({ "n" }, "]c", C("lua MiniBracketed.conflict('forward')"), "Next conf")
map({ "n" }, "[d", C("lua MiniBracketed.diagnostic('backward')"), "Prev diag")
map({ "n" }, "]d", C("lua MiniBracketed.diagnostic('forward')"), "Next diag")
map({ "n" }, "[q", C("lua MiniBracketed.quickfix('backward')"), "Prev qfix")
map({ "n" }, "]q", C("lua MiniBracketed.quickfix('forward')"), "Next qfix")

-- |> Frequent
map({ "n" }, L("b"), C("FzfLua buffers"), "Buffers")
map({ "n" }, L("c"), C("CopilotChatToggle"), "Copilot")
map({ "n" }, L("d"), C("lua Snacks.bufdelete()"), "Delete")
map({ "n" }, L("t"), C("lua Snacks.picker.explorer()"), "Tree")
map({ "n" }, L("o"), C("Oil"), "Oil")
map({ "n" }, L("s"), C("FzfLua files"), "Search")
map({ "n" }, L("g"), C("FzfLua grep_curbuf"), "Grep")
map({ "n" }, L("q"), C("q"), "Quit")
map({ "n" }, L("w"), C("FzfLua grep_cword"), "Cword")
map({ "n" }, L("z"), C("tabnew %"), "Zoom")

-- |> Handy
map({ "n" }, L(",b"), C("qa!"), "BAIL")
map({ "n" }, L(",d"), C("wqa"), "Dip")
map({ "n" }, L(",f"), C("lua require('conform').format()"), "Format")
map({ "n" }, L(",n"), C("Neogit"), "Neogit")
map({ "n" }, L(",m"), C("NoiceAll"), "Messages")
map({ "n" }, L(",q"), C("lua require('quicker').toggle({loclist=false})"), "Quickfix")
map({ "n" }, L(",r"), C("lua require 'nvchad.lsp.renamer'()"), "Rename")
map({ "n" }, L(",s"), C("lua require('snacks').scratch.open()"), "Scratch")
map({ "n" }, L(",w"), C("FzfLua spell_suggest"), "Word?")

-- |> Occasionals
map({ "n" }, L(".c"), C("ChezFzf"), "Config")
map({ "n" }, L(".e"), C("FzfLua diagnostics_document severity_only='Error'"), "Errors")
map({ "n" }, L(".f"), C("FzfLua builtin"), "FzfLua builtin")
map({ "n" }, L(".r"), C("lua require('base46').load_all_highlights()"), "Reload scheme")
map({ "n" }, L(".t"), C("TimeMachineToggle"), "TimeMachine")

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
