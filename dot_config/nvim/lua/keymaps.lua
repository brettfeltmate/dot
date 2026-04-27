-- Shorthands
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
map({ "t" }, "<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode", { nowait = true })
map({ "n" }, "<Esc>", C("nohl"), "Clear highlights")
map({ "n" }, "gdq", C("Debugprint qflist"), "To qflist")
map({ "n" }, "\\m", C("lua require('base46').toggle_theme()"), "Toggle 'dark/light'")

--  Substitute/Exchange
map({ "n" }, "zs", C("lua require('substitute').operator()"), "Sub [motion]", { noremap = true })
map({ "n" }, "zx", C("lua require('substitute.exchange').operator()"), "Exch [motion]", { noremap = true })

-- Marks, but with commentary
map({ "n" }, "\\a", C("HauntToggle"), "Toggle Annotations")
map({ "n" }, "ma", C("HauntAnnotate"), "Annotate")
map({ "n" }, "md", C("HauntDelete"), "De-annotate")
map({ "n" }, "mn", C("HauntNext"), "Next annotation")
map({ "n" }, "mp", C("HauntPrev"), "Prev annotation")
map({ "n" }, "mq", C("HauntQfAll"), "List")

-- Inline suggestions
map({ "n" }, "\\i", function()
	vim.lsp.inline_completion.enable(not vim.lsp.inline_completion.is_enabled())
end, "Toggle inline suggestions")

map({ "i" }, "<M-l>", function()
	if not vim.lsp.inline_completion.get() then
		return "<M-l>"
	end
end, "Confirm inline suggestion", { expr = true })

map({ "i" }, "<M-n>", function()
	local enabled = vim.lsp.inline_completion.is_enabled()
	if enabled then
		vim.lsp.inline_completion.select({ count = 1 })
	end
end, "Next inline suggestion")

map({ "i" }, "<M-p>", function()
	local enabled = vim.lsp.inline_completion.is_enabled()
	if enabled then
		vim.lsp.inline_completion.select({ count = -1 })
	end
end, "Prev inline suggestion")

-- Diagnostics
map({ "n" }, "<C-w>e", C("lua vim.diagnostic.open_float()"), "Diagnostics float")
map(
	{ "n" },
	"<C-w>d",
	C("lua vim.diagnostic.setqflist({severity={min = vim.diagnostic.severity.ERROR}})"),
	"Diagnostics to qflist"
)
map({ "n" }, "<C-w>q", C("copen"), "Open quickfix")

-- QF jumps
map({ "n" }, "]c", C("cnext"), "Next fix")
map({ "n" }, "[c", C("cprev"), "Prev fix")

-- Switch tabs
map({ "n" }, "]t", C("tabnext"), "Next tab")
map({ "n" }, "[t", C("tabprevious"), "Prev tab")

-- Switch buffers
map({ "n" }, "<S-h>", C("bp"), "Prev buff")
map({ "n" }, "<S-l>", C("bn"), "Next buff")

-- Jump splits
map({ "n" }, "<C-space>", C("wincmd w"), "Next win")

--  Focus splits
map({ "n" }, "<C-Left>", C("lua require('smart-splits').move_cursor_left()"), "Left")
map({ "n" }, "<C-Down>", C("lua require('smart-splits').move_cursor_down()"), "Down")
map({ "n" }, "<C-Up>", C("lua require('smart-splits').move_cursor_up()"), "Up")
map({ "n" }, "<C-Right>", C("lua require('smart-splits').move_cursor_right()"), "Right")
map({ "t" }, "<C-Left>", "<C-\\><C-n><C-Left>", "Left", { nowait = true })
map({ "t" }, "<C-Down>", "<C-\\><C-n><C-Down>", "Down", { nowait = true })
map({ "t" }, "<C-Up>", "<C-\\><C-n><C-Up>", "Up", { nowait = true })
map({ "t" }, "<C-Right>", "<C-\\><C-n><C-Right>", "Right", { nowait = true })

--  Resize splits
map({ "n", "t" }, "<C-S-Left>", C("lua require('smart-splits').resize_left()"), "Resize left")
map({ "n", "t" }, "<C-S-Down>", C("lua require('smart-splits').resize_down()"), "Resize down")
map({ "n", "t" }, "<C-S-Up>", C("lua require('smart-splits').resize_up()"), "Resize up")
map({ "n", "t" }, "<C-S-Right>", C("lua require('smart-splits').resize_right()"), "Resize right")

--  Next/prev unempty para
map({ "n" }, "<C-j>", "}j", "Next para")
map({ "n" }, "<C-k>", "{{j", "Prev para")

-- Go to next/prev hunk
map({ "n" }, "<M-j>", C("VGit hunk_down"), "Next hunk")
map({ "n" }, "<M-k>", C("VGit hunk_up"), "Prev hunk")

-- Treesitter/lsp selection
map(
	{ "n", "x", "o" },
	"<M-i>",
	C("lua require('vim.treesitter._select').select_child(vim.v.count1)"),
	"Child tree node or inner lsp selection"
)
map(
	{ "n", "x", "o" },
	"<M-o>",
	C("lua require('vim.treesitter._select').select_parent(vim.v.count1)"),
	"Parent tree node or outer lsp selection"
)

-- Leader mappings
map({ "n" }, L("c"), C("lua require('rgflow').open_cword_path()"), "Cword")
map({ "n" }, L("d"), C("lua require('snacks').bufdelete()"), "Delete")
map({ "n" }, L("f"), C("lua require('snacks').picker.files()"), "Find")
map({ "n" }, L("o"), C("Oil"), "Open")
map({ "n" }, L("p"), C("lua require('snacks').picker.pickers()"), "Pick")
map({ "n" }, L("q"), C("q"), "Quit")
map({ "n" }, L("r"), C("lua require('rgflow').open()"), "RipGrep")
map({ "v" }, L("r"), C("lua require('rgflow').open_visual()"), "RipGrep")
map({ "n" }, L("s"), C("lua require('snacks').scratch()"), "Scratch")
map({ "n" }, L("u"), C("lua Snacks.picker.undo()"), "Undo")
map({ "n" }, L("w"), C("w"), "Write")
map({ "n" }, L("y"), C("lua Snacks.picker.lsp_symbols()"), "LSP symbols")

-- VGit
map({ "n" }, L("gab"), C("VGit buffer_conflict_accept_both"), "Both")
map({ "n" }, L("gac"), C("VGit buffer_conflict_accept_current"), "Current")
map({ "n" }, L("gai"), C("VGit buffer_conflict_accept_incoming"), "Incoming")

map({ "n" }, L("gbb"), C("VGit buffer_blame_preview"), "History")
map({ "n" }, L("gbd"), C("VGit buffer_diff_preview"), "Diff")
map({ "n" }, L("gbh"), C("VGit buffer_history_preview"), "History")
map({ "n" }, L("gbs"), C("VGit buffer_stage"), "Stage")
map({ "n" }, L("gbu"), C("VGit buffer_unstage"), "Unstage")

map({ "n" }, L("gd"), C("VGit project_diff_preview"), "Diff project")

map({ "n" }, L("ghp"), C("VGit buffer_hunk_preview"), "Preview")
map({ "n" }, L("ghs"), C("VGit buffer_hunk_stage"), "Stage")
map({ "n" }, L("ghu"), C("VGit buffer_hunk_unstage"), "Unstage")
