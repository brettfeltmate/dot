--------------
-- Difftool --
--------------
vim.api.nvim_create_user_command('DirDiff', function(opts)
  if vim.tbl_count(opts.fargs) ~= 2 then
    vim.notify('DirDiff requires exactly two directory arguments', vim.log.levels.ERROR)
    return
  end

  vim.cmd 'tabnew'
  vim.cmd.packadd 'nvim.difftool'
  require('difftool').open(opts.fargs[1], opts.fargs[2], {
    rename = {
      detect = false,
    },
    ignore = { '.git' },
  })
end, { complete = 'dir', nargs = '*' })
