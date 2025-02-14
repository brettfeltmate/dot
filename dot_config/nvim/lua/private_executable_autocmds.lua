vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.cmd("norm! zz")
	end,
})
vim.api.nvim_create_augroup('LeapRemote', {})
vim.api.nvim_create_autocmd('User', {
  pattern = 'RemoteOperationDone',
  group = 'LeapRemote',
  callback = function (event)
    -- Do not paste if some special register was in use.
    if vim.v.operator == 'y' and event.data.register == '"' then
      vim.cmd('normal! p')
    end
  end,
})
