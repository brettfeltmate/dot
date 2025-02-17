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
			-- Default window configuration
			"borderless-full",
			fzf_opts = { ["--layout"] = "reverse" },
			file_icons = "mini",
			git_icons = false,
			path_shorten = false,
			formatter = "path.filename_first",
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
            -- replace default maps for paging previews (conflicts w/ my pane nav binds)
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
			-- Provider specific options
			grep = { rg_glob = true }, -- allow use of `... -- file glob` (e.g., query -- *.rmd)
			marks = { marks = "%a" }, -- show only user defined marks
			keymaps = { winopts = { preview = { hidden = true } } },
			zoxide = { fzf_opts = { ["--tiebreak"] = "index" } }, -- prioritize index over query match
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

			-- get length of longest line in items
			local max_len = 0
			for _, item in ipairs(items) do
				local len
                if type(item) == "table" and item.value then
                    len = #item.value
                else
                    len = #tostring(item)
                end
                max_len = math.max(max_len, len)
			end
			-- initially set width to longest item w/padding
			local w = (max_len + 8) / vim.o.columns

            -- clamp width to between 5% and 40%
            w = math.min(math.max(w, 0.05), 0.4)

			return {
				winopts = {
                    relative = "cursor",
					height = h,
					width = w,
					col = 0,
					row = 1,
					backdrop = 95,
					border = borders,
				},
			}
		end)
	end,
}
