return {
	"ibhagwan/fzf-lua",
	lazy = true,
	event = "BufReadPre",
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		require("fzf-lua").setup({
			fzf_bind = "fzf-tmux",
			fzf_opts = { ["--layout"] = "reverse-list" },
			winopts = {
				backdrop = 75,
				fullscreen = true,
				preview = {
					title_pos = "center",
					horizontal = "right:70%",
					vertical = "up:80%",
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
