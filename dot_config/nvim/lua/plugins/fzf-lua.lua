local borders = { " ", "─", " ", " ", " ", "─", " ", " " }
-- local borders = { "╭", "─", "╮", "│", " ", " ", " ", "│" }
-- local borders = { " ", "─", " ", " ", " ", " ", " ", " " }

return {
	"ibhagwan/fzf-lua",
	lazy = true,
	cmd = "FzfLua",
	dependencies = { "echasnovski/mini.icons", "stevearc/quicker.nvim" },
	opts = function()
		local opts = {
			"borderless-full",
			fzf_opts = { ["--layout"] = "reverse" },
			winopts = {
				border = borders,
				relative = "editor",
				row = 1,
				col = 0,
				backdrop = 95,
				width = 1,
				height = 0.4,
				treesitter = { enabled = true },
				preview = {
					border = borders,
					horizontal = "right:65%",
					layout = "horizontal",
				},
			},
			builtin = {
				border = borders,
				relative = "editor",
				row = 1,
				col = 0,
				backdrop = 95,
				width = 1,
				height = 0.4,
			},
			files = {
				file_icons = "mini",
				git_icons = false,
				path_shorten = false,
				formatter = "path.filename_first",
				hidden = false,
			},
			keymaps = {
				winopts = { preview = { hidden = true } },
			},
			oldfiles = {
				file_icons = "mini",
				git_icons = false,
				path_shorten = false,
				formatter = "path.filename_first",
			},
			grep = { git_icons = false, rg_glob = true },
			marks = { marks = "%a" },
			keymap = {
				builtin = {
					true,
					["<C-u>"] = "preview-page-up",
					["<C-d>"] = "preview-page-down",
					["<S-down>"] = nil,
					["<S-up>"] = nil,
					["<M-S-down>"] = nil,
					["<M-S-up>"] = nil,
				},
				fzf = {
					true,
					["ctrl-u"] = "preview-page-up",
					["ctrl-d"] = "preview-page-down",
					["<S-down>"] = nil,
					["<S-up>"] = nil,
				},
			},
			zoxide = {
				fzf_opts = {
					["--no-multi"] = true,
					["--delimiter"] = "[\t]",
					["--tabstop"] = "4",
                    ["--tiebreak"] = "index", -- prefer index over search term
					["--nth"] = "2..",
				},
				winopts = {
					preview = {
						hidden = true,
					},
				},
			},
		}
		return opts
	end,
	config = function(_, opts)
		require("fzf-lua").setup(opts)
		-- make ui_select window height proportional to items returned
		require("fzf-lua").register_ui_select(function(_, items)
			local min_h, max_h = 0.05, 0.20
			local h = (#items + 4) / vim.o.lines
			if h < min_h then
				h = min_h
			elseif h > max_h then
				h = max_h
			end
			return {
				winopts = {
					height = h,
					width = 0.4,
					col = 0,
					row = 1,
					backdrop = 95,
					border = borders,
				},
			}
		end)
	end,
}
