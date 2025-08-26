local excluded_filetypes = { "gitcommit", "dashboard", "oil", "Otree", "prompt" }

local excluded_filenames = { "do-not-autosave-me.lua" }

local function save_condition(buf)
	if
		vim.tbl_contains(excluded_filetypes, vim.fn.getbufvar(buf, "&filetype"))
		or vim.tbl_contains(excluded_filenames, vim.fn.expand("%:t"))
	then
		return false
	end
	return true
end

return {
	"okuuva/auto-save.nvim",
	version = "^1.0.0",
	lazy = true,
	event = { "BufReadPre" },
	enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	opts = {
		enabled = true,
		trigger_events = {
			immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" },
			defer_save = { "InsertLeave", "TextChanged" },
			cancel_deferred_save = { "InsertEnter" },
		},
		condition = save_condition,
		write_all_buffers = false,
		debounce_delay = 5000,
	},
}
