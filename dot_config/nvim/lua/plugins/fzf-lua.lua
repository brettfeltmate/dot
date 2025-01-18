return {
	"ibhagwan/fzf-lua",
	lazy = true,
	cmd = "FzfLua",
	dependencies = { "echasnovski/mini.icons", "stevearc/quicker.nvim" },
	opts = function()
		local quicker = require("quicker")
		local opts = {
			"borderless-full",
			fzf_opts = { ["--layout"] = "reverse" },
			winopts = {
                border = { " ", "─", " ", " ", " ", " ", " ", " " },
				-- border = "rounded",
                title_pos = "center",
				relative = "editor",
				row = 0.99,
				col = 0,
				backdrop = 99,
				width = 1,
				height = 0.35,
				treesitter = { enabled = true },
				preview = {
                    --
                    --󰇙
					border = { " ", "─", " ", " ", " ", " ", " ", "" },
                    -- border = "rounded",
					title_pos = "center",
					horizontal = "right:65%",
					vertical = "down:70%",
					layout = "horizontal",
				},
			},
			files = {
				file_icons = "mini",
                git_icons = false,
			},
			keymap = {
				builtin = {
					true,
					["<C-Esc>"] = "hide",
				},
			},
			actions = {
				files = {
					true,
					["alt-q"] = quicker.open,
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
					width = 0.2,
					col = 0,
					row = 1,
					backdrop = 100,
				},
			}
		end)
	end,
}
