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

vim.keymap.set({ "n", "i" }, "<C-c>a", append_checkbox, { desc = "Add" })
vim.keymap.set({ "n", "x" }, "<C-c>c", ":Checkbox toggle<CR>", { desc = "In-progress" })
vim.keymap.set({ "n", "x" }, "<C-c>i", ":Checkbox interactive<CR>", { desc = "Manual" })
vim.keymap.set({ "n", "x" }, "<C-c>y", ":Checkbox change 0 6<CR>", { desc = "Yay" })
vim.keymap.set({ "n", "x" }, "<C-c>n", ":Checkbox change 1 6<CR>", { desc = "Nay" })
