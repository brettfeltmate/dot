return {
	"juniorsundar/cling.nvim",
	event = "BufRead",
	config = function()
		require("cling").setup({
			wrappers = {
				{
					binary = "xan",
					command = "Xan",
					help_cmd = "--help", -- Auto-generate completions by crawling xan help

					keymaps = function(buf)
						-- Prevent terminal from auto-closing when process finishes
						-- This is the key fix: terminal buffers close on any keypress after
						-- process exits unless we set bufhidden to 'hide'
						vim.bo[buf].bufhidden = "hide"

						-- Resize to 15 rows after buffer opens
						vim.defer_fn(function()
							if vim.api.nvim_buf_is_valid(buf) then
								local win = vim.fn.bufwinid(buf)
								if win ~= -1 then
									vim.api.nvim_win_set_height(win, 15)
								end
							end
						end, 10)
					end,
				},
			},
		})
	end,
}
