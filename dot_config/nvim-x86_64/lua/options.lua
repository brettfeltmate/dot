vim.cmd.colorscheme("nightlamp-tempered-V2")

vim.g.have_nerd_font = true
vim.g.autoformat = true
vim.g.lazygit_config = true
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
vim.opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.laststatus = 3 -- global statusline
vim.opt.breakindent = true
vim.opt.hlsearch = false
vim.opt.signcolumn = "yes"
vim.opt.pumheight = 6
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.splitbelow = true
vim.opt.list = false
vim.opt.listchars = { trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.termguicolors = true -- True color support
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.tabstop = 4
vim.opt.virtualedit = "block"
if vim.fn.has("nvim-0.10") == 1 then
	vim.opt.smoothscroll = true
end