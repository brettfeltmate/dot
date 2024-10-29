return {
	"ibhagwan/fzf-lua",
	lazy = true,
	event = "UIEnter",
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		require("fzf-lua").setup({
			fzf_bind = "fzf-tmux",
			fzf_opts = { ["--layout"] = "reverse" },
			winopts = {
				backdrop = 75,
				fullscreen = false,
				preview = {
					title_pos = "center",
					horizontal = "right:50%",
					vertical = "up:50%",
					layout = "vertical",
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
		})
		require("fzf-lua").register_ui_select()
	end,
}
