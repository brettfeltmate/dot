vim.api.nvim_create_autocmd("User", {
	pattern = "TSUpdate",
	callback = function()
		require("nvim-treesitter.parsers").kitty = {
			install_info = {
				url = "https://github.com/OXY2DEV/tree-sitter-kitty",
			},
		}
		require("nvim-treesitter.parsers").stan = {
			install_info = {
				url = "https://github.com/kingcol13/tree-sitter-stan.git",
				files = { "src/parser.c" },
				branch = "dev",
				generate_requires_npm = false,
				requires_generate_from_grammar = false,
			},
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
				"norg",
				"python",
				"query",
				"r",
				"rnoweb",
				"regex",
				"scss",
				"svelte",
				"toml",
				"tsx",
				"typescript",
				"typst",
				"vim",
				"vimdoc",
				"vue",
				"xml",
			})

			local group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true })

			local ignore_filetypes = {
				"checkhealth",
				"lazy",
				"mason",
				"snacks_dashboard",
				"snacks_notif",
				"snacks_win",
			}

			-- Auto-install parsers and enable highlighting on FileType
			vim.api.nvim_create_autocmd("FileType", {
				group = group,
				desc = "Enable treesitter highlighting and indentation",
				callback = function(event)
					if vim.tbl_contains(ignore_filetypes, event.match) then
						return
					end

					local lang = vim.treesitter.language.get_lang(event.match) or event.match
					local buf = event.buf

					-- Start highlighting immediately (works if parser exists)
					pcall(vim.treesitter.start, buf, lang)

					-- Enable treesitter indentation
					vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

					-- Install missing parsers (async, no-op if already installed)
					ts.install({ lang })
				end,
			})
			vim.treesitter.language.register("markdown", "rmd")
			vim.treesitter.language.register("r", "R")
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
