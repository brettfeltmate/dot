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

map({ "n" }, "<Esc>", C("nohl"), "Clear highlights")

-- |> Toggles
map({ "n" }, "\\z", C("ZenMode"), "Toggle 'zenmode'")
map({ "n" }, "\\a", C("Copilot suggestion toggle_auto_trigger"), "Toggle 'auto-suggestions'")

-- |> Leap
map({ "n", "x", "o" }, ")", "<Plug>(leap-forward)")
map({ "n", "x", "o" }, "(", "<Plug>(leap-backward)")
map({ "n", "x", "o" }, "g)", "<Plug>(leap-from-window)")

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
map({ "t" }, "<Esc>", "<C-\\><C-n>", "Exit terminal mode", { nowait = true })

-- |> Multiple Cursors
map({ "n", "x" }, "<A-j>", C("MultipleCursorsAddDown"), "Add cursor, move down")
map({ "n", "x" }, "<A-k>", C("MultipleCursorsAddUp"), "Add cursor, move up")

-- |> Yanky
map({ "n", "x" }, "y", "<Plug>(YankyYank)")
map({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
map({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
map({ "n" }, "<C-p>", "<Plug>(YankyPreviousEntry)")

-- |> Navigate
map({ "n" }, "H", C("lua require('nvchad.tabufline').prev()"), "Prev buffer")
map({ "n" }, "L", C("lua require('nvchad.tabufline').next()"), "Next buffer")
map({ "n" }, "[b", C("lua require('nvchad.tabbufline').prev()"), "Prev buffer")
map({ "n" }, "]b", C("lua require('nvchad.tabbufline').next()"), "Next buffer")
map({ "n" }, "[t", C("tabprevious"), "Prev tab", { noremap = true })
map({ "n" }, "]t", C("tabnext"), "Next tab", { noremap = true })
map({ "n" }, "[h", C("lua require('gitsigns').nav_hunk({direction = 'prev'})"), "Prev hunk")
map({ "n" }, "]h", C("lua require('gitsigns').nav_hunk({direction = 'next'})"), "Next hunk")

-- |> Frequent
map({ "n" }, L("b"), C("FzfLua buffers"), "Buffers")
map({ "n" }, L("c"), C("CopilotChatToggle"), "Chat")
map({ "n" }, L("d"), C("lua Snacks.bufdelete()"), "Delete")
map({ "n" }, L("e"), C("Oil"), "Explore")
map({ "n" }, L("s"), C("FzfLua files"), "Search")
map({ "n" }, L("g"), C("FzfLua lgrep_curbuf"), "Grep")
map({ "n" }, L("q"), C("q"), ":q")

-- |> Handy
map({ "n" }, L(",b"), C("qa!"), "Bail")
map({ "n" }, L(",d"), C("wqa"), "Dip")
map({ "n" }, L(",f"), C("lua require('conform').format()"), "Format")
map({ "n" }, L(",g"), C("Neogit"), "Neogit")
map({ "n" }, L(",h"), C("lua Snacks.dashboard()"), "Home")
map({ "n" }, L(",l"), C("lua require('quicker').toggle()"), "Loclist")
map({ "n" }, L(",n"), C("NoiceAll"), "Noice")
map({ "n" }, L(",q"), C("lua require('quicker').toggle({loclist=false})"), "Quickfix")
map({ "n" }, L(",s"), C("FzfLua spell_suggest"), "Spell")
map({ "n" }, L(",t"), C("lua Snacks.picker.explorer()"), "Tree")
map({ "n" }, L(",w"), C("Wtf"), "wtf")

-- |> Toolboxes
map({ "n" }, L(".s"), C("lua require('toolbox').show_picker('search')"), "Search")
map({ "n" }, L(".g"), C("lua require('toolbox').show_picker('grep')"), "Grep")
map({ "n" }, L(".l"), C("lua require('toolbox').show_picker('lsp')"), "LSP")
map({ "n" }, L(".m"), C("lua require('toolbox').show_picker('misc')"), "Misc")
map({ "n" }, L(".t"), C("lua require('toolbox').show_picker('test')"), "Test")
