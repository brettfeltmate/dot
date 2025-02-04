vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.cmd("norm! zz")
	end,
})
