-- [[ Bootstrap lazy.nvim plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require("lazy").setup({

	require("plugins.smart-splits"),

	require("plugins.treesitter"),

	require("plugins.rainbow-delimiters"),

	require("plugins.lsp"),

	require("plugins.conform"),

	require("plugins.cmp"),

	-- require("plugins.lint"),

	require("plugins.oil"),

	require("plugins.fzf-lua"),

	require("plugins.flash"),

	require("plugins.iron"),

	require("plugins.yanky"),

	require("plugins.todo-comments"),

	require("plugins.marks"),

	require("plugins.image-nvim"),

  require("plugins.mini"),

	-- require("plugins.molten"),

	require("plugins.chezmoi"),

	require("plugins.colouring"),

	require("plugins.markview"),

	require("plugins.cmdpalette"),

	require("plugins.hardtime"),

	require("plugins.aerial"),

	require("plugins.lazygit"),

	require("plugins.btw"),

	require("plugins.surround"),

	require("plugins.parrot"),

})
-- vim: ts=2 sts=2 sw=2 et
