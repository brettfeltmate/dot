return {
	"ibhagwan/fzf-lua",
	lazy = true,
    cmd = "FzfLua",
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		local actions = require("fzf-lua.actions")
		require("fzf-lua").setup({
			-- fzf_bin = "fzf-tmux",
			fzf_opts = { ["--layout"] = "reverse" },
			winopts = {
				backdrop = 100,
				fullscreen = false,
				preview = {
					title_pos = "center",
					horizontal = "right:60%",
					vertical = "up:60%",
					layout = "vertical",
					width = 90,
					height = 90,
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
					["alt-t"] = actions.file_tabedit,
				},
			},
		})
		require("fzf-lua").register_ui_select()
	end,
}
