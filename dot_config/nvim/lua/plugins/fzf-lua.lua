return {
	"ibhagwan/fzf-lua",
	lazy = true,
	cmd = "FzfLua",
	dependencies = { "echasnovski/mini.icons", "stevearc/quicker.nvim" },
	opts = function()
		local quicker = require("quicker")
		local opts = {
			"borderless",
			fzf_opts = { ["--layout"] = "reverse" },
			winopts = {
				-- split = "botright new", -- open in a full-height split on the far right
				border = { " ", "─", " ", " ", " ", "─", " ", " " },
				relative = "editor",
				row = 1,
				col = 0,
				backdrop = 100,
				width = 1,
				height = 0.50,
				treesitter = { enabled = true },
				preview = {
					title_pos = "left",
					horizontal = "right:60%",
					vertical = "down:70%",
					layout = "horizontal",
				},
			},
			files = {
				file_icons = "mini",
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
			previewers = {
				extensions = {
					-- neovim terminal only supports `viu` block output
					["png"] = { "viu", "-b" },
					-- by default the filename is added as last argument
					-- if required, use `{file}` for argument positioning
					["svg"] = { "chafa", "{file}" },
					["jpg"] = { "ueberzug" },
				},
				-- if using `ueberzug` in the above extensions map
				-- set the default image scaler, possible scalers:
				--   false (none), "crop", "distort", "fit_contain",
				--   "contain", "forced_cover", "cover"
				-- https://github.com/seebye/ueberzug
				ueberzug_scaler = "cover",
			},
		}
		return opts
	end,
	config = function(_, opts)
		require("fzf-lua").setup(opts)
		require("fzf-lua").register_ui_select(function(_, items)
			local min_h, max_h = 0.15, 0.70
			local h = (#items + 4) / vim.o.lines
			if h < min_h then
				h = min_h
			elseif h > max_h then
				h = max_h
			end
			return { winopts = { height = h, width = 0.60, row = 0.40 } }
		end)
	end,
}
