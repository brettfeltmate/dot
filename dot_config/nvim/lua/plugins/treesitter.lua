vim.api.nvim_create_autocmd("User", {
	pattern = "TSUpdate",
	callback = function()
		require("nvim-treesitter.parsers").kitty = {
			install_info = {
				url = "https://github.com/OXY2DEV/tree-sitter-kitty",
				revision = "HEAD",
			},
			tier = 3,
		}
		require("nvim-treesitter.parsers").stan = {
			install_info = {
				url = "https://github.com/kingcol13/tree-sitter-stan.git",
				files = { "src/parser.c" },
				branch = "dev",
				revision = "HEAD",
				generate_requires_npm = false,
				requires_generate_from_grammar = false,
			},
			tier = 3,
		}
	end,
})
return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		lazy = true,
		event = "BufReadPre",
		config = function(_)
			local ts = require("nvim-treesitter")

			-- Install core parsers at startup
			ts.install({
				"bash",
				"comment",
				"css",
				"diff",
				"fish",
				"git_config",
				"git_rebase",
				"gitcommit",
				"gitignore",
				"html",
				"javascript",
				"json",
				"latex",
				"lua",
				"luadoc",
				"make",
				"markdown",
				"markdown_inline",
				"python",
				"r",
				"rnoweb",
				"regex",
				"scss",
				"toml",
				"vim",
				"vimdoc",
			})

			-- Auto-install parsers and enable highlighting on FileType
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("EnableTreesitter", {}),
				desc = "Install and enable treesitter filetype parsers",
				callback = function(args)
					local buf = args.buf
					local ftype = args.match

					-- Check if a parser even exists for this ft
					local lang = vim.treesitter.language.get_lang(ftype) or ftype

					if not vim.treesitter.language.add(lang) then
						return
					end

					-- Start highlighting immediately (works if parser exists)
					pcall(vim.treesitter.start, buf, lang)

					-- Enable indents
					vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

					-- Enable folds
					vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				end,
			})

			-- These used to be necessary, not sure if still the case but wtvr
			vim.treesitter.language.register("markdown", "rmd")
			vim.treesitter.language.register("r", "R")
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
