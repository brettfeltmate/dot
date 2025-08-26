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
map({ "t" }, "<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode", { nowait = true })
map({ "n" }, "<Esc>", C("nohl"), "Clear highlights")
map({ "n" }, "\\a", C("Copilot suggestion toggle_auto_trigger"), "Toggle 'auto-suggestions'")
map({ "n" }, "\\v", C(":ASToggle<CR>"), "Toggle Auto-Save")
map({ "n" }, "gdq", C("Debugprint qflist"), "To qflist")

-- [[ Editing ]] --

-- Flash
map({ "n", "x", "o" }, "<C-s>", C("lua require('flash').jump()"), "Flash")

--  Substitute
map({ "n" }, "s", C("lua require('substitute').operator()"), "Sub [motion]", { noremap = true })
map({ "n" }, "ss", C("lua require('substitute').line()"), "Sub [line]", { noremap = true })
map({ "n" }, "S", C("lua require('substitute').eol()"), "Sub [eol]", { noremap = true })
map({ "x" }, "s", C("lua require('substitute').visual()"), "Sub [visual]", { noremap = true })

map({ "n" }, "sx", C("lua require('substitute.exchange').operator()"), "Exch [motion]", { noremap = true })
map({ "n" }, "sxx", C("lua require('substitute.exchange').line()"), "Exch [line]", { noremap = true })
map({ "x" }, "X", C("lua require('substitute.exchange').visual()"), "Exch [visual]", { noremap = true })
map({ "n" }, "sxc", C("lua require('substitute.exchange').cancel()"), "Exch [cancel]", { noremap = true })

-- [[ Splits/Buffs/Tabs ]] --

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
map({ "n" }, "<S-h>", C("lua require('nvchad.tabufline').prev()"), "Prev buff")
map({ "n" }, "<S-l>", C("lua require('nvchad.tabufline').next()"), "Next buff")

--  Cycle tabs

map({ "n" }, "<S-tab>", C("tabnext"), "Next tab")

-- [[ Leader mappings ]] --

--  Frequent
map({ "n" }, L("c"), C("FzfLua grep_cword"), "Cword")
map({ "n" }, L("d"), C("lua Snacks.bufdelete()"), "Delete")
map({ "n" }, L("e"), C("lua Snacks.picker.explorer()"), "Explore")
map({ "n" }, L("f"), C("FzfLua files"), "Find")
map({ "n" }, L("g"), C("FzfLua grep_project"), "Grep")
map({ "n" }, L("h"), C("FzfLua helptags"), "Helptags")
map({ "n" }, L("i"), function()
	require("fzf-lua").files({
		prompt = "Images: ",
		fd_opts = [[-I -e jpg -e png -e jpeg]],
	})
end, "Images")
map({ "n" }, L("j"), C("lua require('snacks').scratch.open()"), "Jotnotes")
map({ "n" }, L("m"), C("NoiceAll"), "Messages")
map({ "n" }, L("n"), C("NoNeckPain"), "NoNeckPain")
map({ "n" }, L("o"), C("Oil"), "Oil")
map({ "n" }, L("q"), C("quit"), "Quit")
map({ "n" }, L("r"), C("lua require 'nvchad.lsp.renamer'()"), "Rename")
map({ "n" }, L("s"), C("FzfLua spell_suggest"), "Spell")
map({ "n" }, L("w"), C("write"), "Write")
map({ "n" }, L("x"), C("wqa"), "Exit")
