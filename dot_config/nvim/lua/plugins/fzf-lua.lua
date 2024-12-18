return {
	"ibhagwan/fzf-lua",
	lazy = true,
	cmd = "FzfLua",
	dependencies = { "echasnovski/mini.icons", "folke/trouble.nvim" },
	config = function()
		local quicker = require("quicker")
		require("fzf-lua").setup({
			fzf_opts = { ["--layout"] = "reverse" },
			winopts = {
				relative = "editor",
				row = 1,
				col = 0,
				backdrop = 50,
				fullscreen = false,
				width = 1,
				height = 0.50,
                treesitter = { enabled = true },
				preview = {
					title_pos = "center",
					horizontal = "right:60%",
					vertical = "up:60%",
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
					["alt-t"] = quicker.open,
				},
			},
		})
		require("fzf-lua").register_ui_select()
	end,
}
