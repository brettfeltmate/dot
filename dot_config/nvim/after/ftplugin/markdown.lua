vim.cmd("setlocal spell")
vim.cmd("setlocal wrap")
-- Custom function to append a new checkbox item
local function append_checkbox()
	local line = vim.api.nvim_get_current_line()
	if line:match("^%s*%-%s%[ %]") then
		-- If the line already starts with a checkbox, create a new item below it
		vim.api.nvim_set_current_line(line .. "\n- [ ] ")
	else
		-- If not, create a new checkbox item
		vim.api.nvim_set_current_line(line .. "- [ ] ")
	end
end

local function map(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, opts or {})
end
-- Slime bindings
map("n", "<CR>", "<Plug>SlimeParagraphSend}j", { buffer = 0, noremap = true, desc = "Send block" })
map("x", "<CR>", "<Plug>SlimeRegionSend", { buffer = 0, noremap = true, desc = "Send region" })

map({ "n", "i" }, "<C-c>a", append_checkbox, { desc = "Add" })
map({ "n", "x" }, "<C-c>c", ":Checkbox toggle<CR>", { desc = "In-progress" })
map({ "n", "x" }, "<C-c>i", ":Checkbox interactive<CR>", { desc = "Manual" })
map({ "n", "x" }, "<C-c>y", ":Checkbox change 0 6<CR>", { desc = "Yay" })
map({ "n", "x" }, "<C-c>n", ":Checkbox change 1 6<CR>", { desc = "Nay" })
