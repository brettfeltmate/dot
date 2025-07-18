return {
	"ibhagwan/fzf-lua",
	event = "VeryLazy",
	opts = function()
		local opts = {
			"ivy",
			fzf_opts = { ["--layout"] = "reverse" },
			file_icons = "mini",
			path_shorten = true,
			formatter = "path.filename_first",
			fzf_colors = true,
			winopts = {
				relative = "editor",
				row = 1,
				col = 1,
				backdrop = 95,
				width = 1,
				height = 0.45,
				treesitter = { enabled = true },
				preview = {
					horizontal = "right:65%",
					layout = "horizontal",
				},
			},
			keymap = {
				builtin = {
					true,
					["<C-u>"] = "preview-page-up",
					["<C-d>"] = "preview-page-down",
					["<S-down>"] = nil, -- <S-LDUR> taken for pane nav
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
			previewers = {
				builtin = {
					extensions = {
						["png"] = { "kitten icat" },
						["jpg"] = { "kitten icat" },
						["jpeg"] = { "kitten icat" },
					},
				},
			},
			-- Provider specific options
			builtin = {
				winopts = {
					title = "",
					border = "rounded",
					relative = "cursor",
					height = 0.2,
					width = 0.2,
					prompt = "",
				},
			},
			files = { cwd_prompt = false, hidden = false },
			grep = { rg_glob = true }, -- allow use of `... -- file glob` (e.g., query -- *.rmd)
			marks = { marks = "%a" }, -- show only user defined marks
			keymaps = {
				winopts = {
					preview = {
						hidden = true,
					},
				},
			},
			zoxide = { -- prioritize index over query match
				fzf_opts = {
					["--tiebreak"] = "index",
				},
			},
			quickfix = {
				winopts = {
					preview = {
						hidden = true,
						vertical = "down:30%",
						layout = "vertical",
					},
				},
			},
			helptags = {
				winopts = {
					preview = {
						hidden = true,
					},
				},
			},
			diagnostics = {
				winopts = {
					preview = {
						hidden = true,
						vertical = "down:30%",
						layout = "vertical",
					},
				},
			},
			spell_suggest = {
				winopts = {
					title = "",
					border = "rounded",
					relative = "cursor",
					height = 0.2,
					width = 0.1,
				},
			},
		}
		return opts
	end,

	config = function(_, opts)
		local fzflua = require("fzf-lua")
		fzflua.setup(opts)

		-- use fzf-lua as default selector
		fzflua.register_ui_select(function(_, items)
			-- initially set height to num items + padding
			local h = (#items + 4) / vim.o.lines
			-- clamp height to between 5% and 20% of screen height
			h = math.min(math.max(h, 0.05), 0.2)

			-- initially set width to longest item w/padding
			local max_len = 35
			for _, item in ipairs(items) do
				local len
				if type(item) == "table" and item.value then
					len = #item.value
				else
					len = #tostring(item)
				end
				max_len = math.max(max_len, len)
			end
			local w = (max_len + 8) / vim.o.columns

			-- clamp width to between 5% and 40% of screen width
			w = math.min(math.max(w, 0.05), 0.4)

			return {
				winopts = {
					prompt = "",
					relative = "editor",
					col = 0.5,
					row = 0.5,
					height = h,
					width = w,
					backdrop = 95,
					border = "rounded",
				},
			}
		end)

		-- vim.cmd([[FzfLua register_ui_select]])
	end,
	-- register fzf-lua as default for all ui-select calls
}
