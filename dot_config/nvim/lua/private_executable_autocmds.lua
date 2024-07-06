local files_set_cwd = function(path)
	-- Works only if cursor is on the valid file system entry
	local cur_entry_path = MiniFiles.get_fs_entry().path
	local cur_directory = vim.fs.dirname(cur_entry_path)
	vim.fn.chdir(cur_directory)
end

-- TODO: merge this with augroup func
vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		vim.keymap.set("n", "g~", files_set_cwd, { buffer = args.data.buf_id })
	end,
})

local function nvim_create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		vim.api.nvim_command("augroup " .. group_name)
		vim.api.nvim_command("autocmd!")
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
			vim.api.nvim_command(command)
		end
		vim.api.nvim_command("augroup END")
	end
end

local autocmds = {
	numberlines = {
		{ "TermOpen", "*", "setlocal nonu nornu signcolumn=no" },
		{ "TermEnter", "*", "setlocal nonu nornu signcolumn=no" },
		{ "BufEnter", "*", "if &nu | set rnu | endif" },
		{ "WinEnter", "*", "if &nu | set rnu | endif" },
		{ "FocusGained", "*", "if &nu | set rnu | endif" },
		{ "BufLeave", "*", "if &nu | set nornu | endif" },
	},
	modechange = {
		{ "BufEnter", "*", 'if &buftype == "terminal" | :startinsert | endif' },
		{ "TermOpen", "*", 'if &buftype == "terminal" | :startinsert | endif' },
		{ "BufLeave", "*", "if &buftype == 'terminal' | :stopinsert  | endif" },
	},
}

nvim_create_augroups(autocmds)
