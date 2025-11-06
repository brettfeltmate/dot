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
map({ "n" }, "\\v", C(":ASToggle<CR>"), "Toggle 'Auto-Save'")
map({ "n" }, "gdq", C("Debugprint qflist"), "To qflist")
map({ "n" }, "\\m", C("lua require('base46').toggle_theme()"), "Toggle 'dark/light'")
map({ "n" }, "\\e", C("Sidekick nes toggle"), "Toggle 'edit suggestions'")

-- Diagnostics
map({ "n" }, "<C-w>e", C("lua vim.diagnostic.open_float()"), "Diagnostics float")
map({ "n" }, "<C-w>d", C("lua vim.diagnostic.setqflist()"), "Diagnostics to qflist")
map({ "n" }, "<C-w>q", C("copen"), "Open quickfix")

-- Jump
map({ "n", "x", "o" }, "<C-s>", C("lua require('flash').jump()"), "Flash")

--  Substitute
map({ "n" }, "s", C("lua require('substitute').operator()"), "Sub [motion]", { noremap = true })
map({ "n" }, "ss", C("lua require('substitute').line()"), "Sub [line]", { noremap = true })
map({ "n" }, "S", C("lua require('substitute').eol()"), "Sub [eol]", { noremap = true })
map({ "x" }, "s", C("lua require('substitute').visual()"), "Sub [visual]", { noremap = true })

--  Exchange
map({ "n" }, "sx", C("lua require('substitute.exchange').operator()"), "Exch [motion]", { noremap = true })
map({ "n" }, "sxx", C("lua require('substitute.exchange').line()"), "Exch [line]", { noremap = true })
map({ "x" }, "X", C("lua require('substitute.exchange').visual()"), "Exch [visual]", { noremap = true })
map({ "n" }, "sxc", C("lua require('substitute.exchange').cancel()"), "Exch [cancel]", { noremap = true })

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
map({ "n" }, "<S-tab>", C("tabnext"), "Next tab")

--  Go to next/prev non-empty line that is not a comment
map({ "n", "x" }, "<C-j>", function()
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

map({ "n", "x" }, "<C-k>", function()
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
-- Leader
map({ "n" }, L("c"), C("lua require('rgflow').open_cword_path()"), "Cword")
map({ "n" }, L("d"), C("lua require('nvchad.tabufline').close_buffer()"), "Delete")
map({ "n" }, L("f"), C("FFFFind"), "Files")
map({ "n" }, L("g"), C("tab Git"), "Git")
map({ "n" }, L("m"), C("messages"), "Messages")
map({ "n" }, L("o"), C("lua require('oil').open_float()"), "Oil")
map({ "n" }, L("q"), C("quit"), "Quit")
map({ "n" }, L("r"), C("lua require('rgflow').open()"), "Ripgrep")
map({ "v" }, L("r"), C("lua require('rgflow').open_visual()"), "Ripgrep [vis]")
map({ "n" }, L("s"), C("lua require('snacks').scratch()"), "Scratch")
map({ "n" }, L("t"), C("Fyler"), "Tree")
map({ "n" }, L("w"), C("write"), "Write")
map({ "n" }, L("x"), C("wqa"), "Exit")
map({ "n" }, L("p"), C("lua require('snacks').picker.pickers()"), "Pickers")

-- vim.keymap.set("n", "<leader>.", require("minibuffer.examples.files"))
-- vim.keymap.set("n", "<leader>,", require("minibuffer.examples.buffers"))
-- vim.keymap.set("n", "<leader>/", require("minibuffer.examples.live-grep"))
-- vim.keymap.set("n", "<leader>%", function()
-- 	require("minibuffer.examples.oldfiles")({ cwd = vim.fn.getcwd() })
-- end)
-- vim.keymap.set("n", "<leader>*", require("minibuffer.examples.oldfiles"))

-- Inline completion
map({ "i" }, "<M-y>", function()
	vim.lsp.inline_completion.get()
end, "Accept inline completion")

map({ "i" }, "<M-n>", function()
	vim.lsp.inline_completion.select({ count = 1, wrap = true })
end, "Next inline completion")

map({ "i" }, "<M-p>", function()
	vim.lsp.inline_completion.select({ count = -1, wrap = true })
end, "Prev inline completion")
